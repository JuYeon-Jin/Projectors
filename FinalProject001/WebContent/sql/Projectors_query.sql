SELECT USER
FROM DUAL;
--==>> PROJECTORS
/*
[시퀀스명]
관리자  ->          AD||SEQ
회원식별번호        UP||SEQ
유저    ->          US||SEQ
프로필  ->          PF||SEQ
유저 사용 도구  ->  UT||SEQ
공지    ->          NT||SEQ
공고    ->          RC||SEQ
지원서  ->          AP||SEQ
프로젝트->          PJ||SEQ
모집 포지션 번호 -> RP||SEQ
1차 합류 번호    -> FS||SEQ
최종 합류 번호   -> FN||SEQ

[날짜 폼 지정]
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';


[시퀀스 생성 구문]
CREATE SEQUENCE USERPINSEQ
NOCACHE;

CREATE SEQUENCE USERNOSEQ
NOCACHE;

CREATE SEQUENCE PROFILENOSEQ
NOCACHE;

CREATE SEQUENCE UTOOLNOSEQ
NOCACHE;

CREATE SEQUENCE RECRUITNOSEQ
NOCACHE;

CREATE SEQUENCE APPLYNOSEQ
NOCACHE;

CREATE SEQUENCE RECRUITPOSSEQ
NOCACHE;

CREATE SEQUENCE FIRSTCKSEQ
NOCACHE;

CREATE SEQUENCE FINALNOSEQ
NOCACHE;

CREATE SEQUENCE PROJECTNOSEQ
NOCACHE;


CREATE SEQUENCE LOGINRECSEQ
NOCACHE;
--==>> Sequence LOGINRECSEQ이(가) 생성되었습니다.
CREATE SEQUENCE LOGOUTRECSEQ
NOCACHE;
--==>> Sequence LOGOUTRECSEQ이(가) 생성되었습니다.

*/

--○ 시퀀스 생성 및 INSERT 동작 쿼리문
/*
-- 회원 가입 시 식별 번호 발생
-- 회원 식별 번호 시퀀스 생성


-- 회원식별번호 테이블에 시퀀스 삽입
INSERT INTO USER_PIN VALUES(PINNOSEQ.NEXTVAL ,SYSDATE);

-- 회원 가입

--회원 정보 테이블(USERS)에 데이터 삽입
INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US''||TO_CHAR(USERNOSEQ.NEXTVAL)  
, (SELECT PIN_NO
   FEOM USER_PIN
   ORDER BY JOIN_DATE DESC
   FETCH FIRST 1 ROW ONLY)
, '아이디@naver.com'
, '비밀번호'
, '닉네임'
, 'c://WebStudy');

-- 회원 가입 후 프로필 생성

-- 프로필(PROFILE) 테이블에 데이터 삽입
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, ★세션으로 넘겨받은 PIN_NO
, ★포지션 번호
, (SELECT ★지역번호 FROM SUB_REGION WHERE REGION_NO=★세부지역번호)
, SYSDATE);


-- 유저 사용도구 테이블(프로필 번호를 참조하는) 사용 도구에 따라서 하나의 PROFILE_NO에 
INSERT INTO USER_TOOL
( UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLSEQ.NEXTVAL)
, (SELECT PROFILE_NO FROM PROFILE WHERE PIN_NO=?)
, TOOL_NO);

*/


-- 평가 출력에 사용될 FINAL_NO 구하는 메소드
/*
SELECT FINAL_NO
      FROM FINAL
       WHERE FIRST_CK_NO = (SELECT FIRST CK_NO
                            FROM FIRST_CK
                            WHERE APPLY_NO = (SELECT APPLY_NO
                                              FROM APPLY
                                              WHERE PIB_NO =? ))));
*/



--○ 보여줄 (정보를 출력하는데 사용될 쿼리문)================


DESC POSITION;
/*
-- 나의 프로필 클릭 시 보게 될 쿼리문
-- ① 프로필 파트(평가, 툴 제외)
-- ★뷰 생성
CREATE OR REPLACE VIEW PROFILE_SHOW
AS
SELECT U.ID, U.NICKNAME, POS.POS_NAME, R.REGION_NAME, SR.REGION_NAME, POS.POS_NAME, P.PROFILE_DATE
FROM PROFILE P LEFT JOIN USERS U ON P.PIN_NO = U.PIN_NO
LEFT JOIN POSITION POS ON P.POS_NO = POS.POS_NO
LEFT JOIN SUB_REGION SR ON SR.SUB_REGION_NO = P.SUB_REGION_NO; 
LEFT JOIN REGION R ON R.REGION_NO = SR.REGION_NO;

--★ 뷰 실행
SELECT * FROM PROFILE_SHOW
WHERE PIN_NO = ★; 


-- ②  툴 파트
--★ 뷰 생성
CREATE OR REPLACE VIEW PROFILE_TOOL_VIEW
AS
SELECT T.TOOL_NAME
FROM TOOL T
JOIN USER_TOOL UT ON T.TOOL_NO = UT.TOOL_NO
JOIN PROFILE P ON UT.PROFILE_NO = P.PROFILE_NO;

--★ 뷰 수행 구문
SELECT TOOL_NAME
FROM PROFILE_TOOL_VIEW
WHERE PIN_NO = ★;




-- ③ 평가 파트
--(1) 개인 이탈 총 평가 ( -> 평가 번호와 해당 평가가 몇 개인지)
SELECT RATE_NO, COUNT(RATE_NO) AS OUT_RATE_TOT
FROM MEM_OUT_RATE
WHERE MEM_OUT_NO = (SELECT MEM_OUT_NO
                    FROM MEMBER_OUT
                    WHERE FINAL_NO = (SELECT FINAL_NO
                                      FROM FINAL
                                      WHERE FIRST_CK_NO = (SELECT FIRST CK_NO
                                                          FROM FIRST_CK
                                                          WHERE APPLY_NO = (SELECT APPLY_NO
                                                                            FROM APPLY
                                                                            WHERE PIN_NO ='UP42' ))))
GROUP BY RATE_NO;
                                         
--(2) 팀 닫기 총 평가                                         
SELECT RATE_NO, COUNT AS COUNT(RATE_NO)
FROM PROJECT_STOP_RATE
WHERE RECEIVER_NO = (SELECT FINAL_NO
                    FROM FINAL
                    WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                         FROM FIRST_CK
                                         WHERE APPLY_NO = (SELECT APPLY_NO
                                                           FROM APPLY
                                                           WHERE PIN_NO='UP42')))
GROUP BY RATE_NO;

--(3) 팀 완료 총 평가
SELECT RATE_NO, COUNT(RATE_NO) AS DONE_RATE
FROM PROJECT_RATE
WHERE RECEIVER_NO = (SELECT FINAL_NO
                    FROM FINAL
                    WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                         FROM FIRST_CK
                                         WHERE APPLY_NO = (SELECT APPLY_NO
                                                           FROM APPLY
                                                           WHERE PIN_NO='UP42')))
GROUP BY RATE_NO;


-- 이 세 쿼리문에 나온 다 합쳐서 프로필에 보여주면됨 합쳐주는 뷰 생성 구문==========================================
-- ★ 뷰 생성
CREATE OR REPLACE VIEW RATE_SUMMARY
AS
SELECT RATE_NO, SUM(COUNT) AS TOTAL_COUNT
FROM (
    SELECT RATE_NO, COUNT(*) AS COUNT
    FROM MEM_OUT_RATE
    WHERE MEM_OUT_NO = (SELECT MEM_OUT_NO
                        FROM MEMBER_OUT
                        WHERE FINAL_NO = (SELECT FINAL_NO
                                          FROM FINAL
                                          WHERE FIRST_CK_NO = (SELECT FIRST CK_NO
                                                              FROM FIRST_CK
                                                              WHERE APPLY_NO = (SELECT APPLY_NO
                                                                                FROM APPLY
                                                                                WHERE PIN_NO =? ))))
    GROUP BY RATE_NO

    UNION ALL

    SELECT RATE_NO, COUNT(*) AS COUNT
    FROM PROJECT_STOP_RATE
    WHERE RECEIVER_NO = (SELECT FINAL_NO
                          FROM FINAL
                         WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                              FROM FIRST_CK
                                                WHERE APPLY_NO = (SELECT APPLY_NO
                                                                 FROM APPLY
                                                                 WHERE PIN_NO=?)))
    GROUP BY RATE_NO

    UNION ALL

    SELECT RATE_NO, COUNT(*) AS COUNT
    FROM PROJECT_RATE
    WHERE RECEIVER_NO = (SELECT FINAL_NO
                        FROM FINAL
                        WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                             FROM FIRST_CK
                                             WHERE APPLY_NO = (SELECT APPLY_NO
                                                               FROM APPLY
                                                               WHERE PIN_NO=?)))
    GROUP BY RATE_NO
) AS SUBQUERY
GROUP BY ROLLUP (RATE_NO);


--★ 뷰 수행
SELECT RATE_NO, TOTAL_COUNT
FROM RATE_SUMMARY
WHERE PIN_NO = ★핀 번호; 


*/


/*


-- 특정 공고의 특정 포시션에 대한 지원을 수행할 때
INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, APPLY_DATE)
VALUES
( APPLYSEQ.NEXTVAL
, (SELECT RECRUIT_POS_NO
   FROM RECRUIT_POS
   WHERE RECRUIT_NO = (SELECT RECRUIT_NO 
                       FROM RECRUIT
                       WHERE PIN_NO=?))  -- 모집 공고자 PIN_NO
, ?
, ??
, SYSDATE);


-- 모집자가 특정 지원서(지원자)에 대해 수락을 클릭할 때 수행될 INSERT 쿼리문
-- 지원 후 모집자가 행하는 1차 수락시 수락 클릭 시 FIRST_CK 테이블에  그 사람의 APPLY_NO가 INSERT 된다.
INSERT INTO FIRST_CK
( FIRST_CK_NO
, APPLY_NO
, PASS_DATE)
VALUES
( FIRSTSEQ.NEXTVAL
, APPLY_NO FROM APPLY WHERE RECRUIT_POS_NO = (SELECT RECRUIT_POS_NO
                                              FROM RECRUIT_POS
                                              WHERE RECRUIT_NO = (SELECT RECRUIT_NO
                                                                  FROM RECRUIT
                                                            	  WHERE PIN_NO=?))
, SYSDATE);


-- 프로젝트 모집자가 1차 수락 시킨 인원이 모집 인원과 동일한지 확인하는 쿼리문
-- ※ 전제 조건 모집 공고 올릴 시 모집 인원은 모집자가 정한 인원의 +1 로 INSERT 되었을 때
-> 모집자가 자동으로 모집 포지션 지원과 FIRST_CK 테이블로 이동해야 하기 때문





-- 최종 합류 승낙을 누르면 INSERT될 테이블 (프로젝트 생성 여부와 상관없이)
INSERT INTO FINAL(FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES
( FINALSEQ.NEXTVAL
, SELECT FIRST_CK_NO
  FROM FIRST_CK
  WHERE APPLY_NO = (SELECT APPLY_NO
                    FROM APPLY
                    WHERE PIN_NO=?)

);






*/
--=================================================================================================================================================


--== 입력할 쿼리문(UsersDAO.xml)

SELECT *
FROM USERS;

-- (1) 로그인
SELECT COUNT(PIN_NO)
FROM USERS
WHERE ID='도라에몽@naver.com' AND PW='java002$';
--▼


--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
-- 1. 회원 가입
SELECT COUNT(PIN_NO)
FROM USERS
WHERE ID=? AND PW=?;
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

-- 로그인 이후 핀번호를 세션하기 위해 getPin_no()

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';




--== 회원 가입 클릭스 동시에 동작할 메소드 =========================
INSERT INTO USER_PIN
( PIN_NO
, JOIN_DATE)
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
 , SYSDATE);

INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US'||TO_CHAR(USERNOSEQ.NEXTVAL)
, (SELECT PIN_NO
   FROM (SELECT PIN_NO
         FROM USER_PIN
         ORDER BY JOIN_DATE DESC)
   WHERE ROWNUM = 1)
,'노프로필@naver.com'
,'java002'
,'노프로필'
,'images/defaulfPhoto.jpg');


commit;

INSERT INTO USER_PIN
( PIN_NO
, JOIN_DATE)
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
 , SYSDATE);
 
INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US'||TO_CHAR(USERNOSEQ.NEXTVAL)
, (SELECT PIN_NO
   FROM (SELECT PIN_NO
         FROM USER_PIN
         ORDER BY JOIN_DATE DESC)
   WHERE ROWNUM = 1)
,'평가용6@naver.com'
,'java002'
,'평가용6'
,'images/defaulfPhoto.jpg');




DESC WITHDRAW_USER;
/*
WD_USER_NO NOT NULL NUMBER(8)     
PIN_NO     NOT NULL VARCHAR2(16)  
WD_DATE             DATE          
ID         NOT NULL VARCHAR2(100) 
WD_TYPE_NO NOT NULL NUMBER(1)     
*/



INSERT INTO WITHDRAW_USER
( WD_USER_NO
, PIN_NO
, WD_DATE
, ID
, WD_TYPE_NO)
VALUES
( WDUSERNOSEQ.NEXTVAL
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='탈퇴용')
, SYSDATE
, (SELECT ID FROM USERS WHERE NICKNAME='탈퇴용')
, 1
);
--==>> 1 행 이(가) 삽입되었습니다.



SELECT *
FROM USERS;
--==>> US16	UP18	spb@naver.com	java002	스폰지밥	images/defaulfPhoto.jpg


--★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--1. 우선 핀 생성
INSERT INTO USER_PIN
( PIN_NO
, JOIN_DATE)
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
 , SYSDATE);
--2. 생성된 핀에 회원가입 실행
INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US'||TO_CHAR(USERNOSEQ.NEXTVAL)
, (SELECT PIN_NO
   FROM (SELECT PIN_NO
         FROM USER_PIN
         ORDER BY JOIN_DATE DESC)
   WHERE ROWNUM = 1)
,?
,?
,?
,?);
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--=================================================


-- 회원정보 수정

-- 샘플데이터 입력

DESC RECRUIT;
/*
RECRUIT_NO   NOT NULL VARCHAR2(16)   
PIN_NO       NOT NULL VARCHAR2(16)   
DO_TYPE_NO   NOT NULL NUMBER(1)      
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(3000) 
CREATED_DATE          DATE           
PRJ_START    NOT NULL DATE           
PRJ_END      NOT NULL DATE  
*/


INSERT INTO RECRUIT
( RECRUIT_NO
, PIN_NO
, DO_TYPE_NO
, TITLE
, CONTENT
, CREATED_DATE
, PRJ_START
, PRJ_END
)
VALUES
( 
'RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL)
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='평가용')
, 1
, '평가 출력용 제목 공고2'
, '평가 출력용 내용 공고2'
, SYSDATE
, TO_DATE('2022-01-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-04-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
);

--===>> 1 행 이(가) 삽입되었습니다.

SELECT RECRUIT_NO FROM RECRUIT WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='스폰지밥');
--==>> RC7

DESC REP_RECRUIT;
/*
이름             널?       유형           
-------------- -------- ------------ 
REP_RECRUIT_NO NOT NULL VARCHAR2(16) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
PIN_NO         NOT NULL VARCHAR2(16) 
CREATED_DATE            DATE         
REP_REASON_NO  NOT NULL NUMBER(2)   
*/


INSERT INTO REP_RECRUIT
( REP_RECRUIT_NO
, RECRUIT_NO
, PIN_NO
, CREATED_DATE
, REP_REASON_NO
)
VALUES
( 'REPR'|| TO_CHAR(REPRECNOSEQ.NEXTVAL)
, 'RC7'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='스폰지밥' )
, SYSDATE
, 1);








--==>> 1 행 이(가) 삽입되었습니다.

DESC REP_RECRUIT_RESULT;
/*
RECRUIT_RESULT_NO NOT NULL VARCHAR2(16) 
REP_RECRUIT_NO    NOT NULL VARCHAR2(16) 
REP_RESULT_NO     NOT NULL NUMBER(2)    
REGU_NO           NOT NULL NUMBER(1)    
REGU_PERIOD_NO    NOT NULL NUMBER(1)    
PIN_NO            NOT NULL VARCHAR2(16) 
REGU_DATE                  DATE         

*/

SELECT *
FROM REPORT_RESULT;
/*
1	처리
0	반려
*/
SELECT *
FROM REGULATION;
/*
1	성희롱
2	음란물
3	욕설
4	광고
5	도배
6	유해한 행위(자해 및 자살 등)
7	사기성 행위
8	부적절한 콘텐츠
9	기타
*/

SELECT * 
FROM REGULATION_PERIOD;

INSERT INTO REP_RECRUIT_RESULT
( RECRUIT_RESULT_NO
, REP_RECRUIT_NO
, REP_RESULT_NO
, REGU_NO
, REGU_PERIOD_NO
, PIN_NO
, REGU_DATE )
VALUES
( 'RESR'||TO_CHAR(RECRUITRESULTNOSEQ.NEXTVAL)
, 'REPR1'
, 1
, 8
, 3
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='스폰지밥')
, SYSDATE
);
--==>> 1 행 이(가) 삽입되었습니다.


--추가 신고 미처리자 데이터 입력

INSERT INTO USER_PIN
( PIN_NO
, JOIN_DATE)
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
 , SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US'||TO_CHAR(USERNOSEQ.NEXTVAL)
, (SELECT PIN_NO
   FROM (SELECT PIN_NO
         FROM USER_PIN
         ORDER BY JOIN_DATE DESC)
   WHERE ROWNUM = 1)
,'bad@naver.com'
,'java002'
,'나쁜사람'
,'images/defaulfPhoto.jpg');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT * FROM USERS;




INSERT INTO RECRUIT
( RECRUIT_NO
, PIN_NO
, DO_TYPE_NO
, TITLE
, CONTENT
, CREATED_DATE
, PRJ_START
, PRJ_END
)
VALUES
( 
'RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL)
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='나쁜사람')
, 1
, '애매한 제목의 공고'
, '애매한 내용의 공고'
, SYSDATE
, TO_DATE('2023-08-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
--==>> 1 행 이(가) 삽입되었습니다.


SELECT * FROM RECRUIT;


INSERT INTO REP_RECRUIT
( REP_RECRUIT_NO
, RECRUIT_NO
, PIN_NO
, CREATED_DATE
, REP_REASON_NO
)
VALUES
( 'REPR'|| TO_CHAR(REPRECNOSEQ.NEXTVAL)
, 'RC8'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='나쁜사람' )
, SYSDATE
, 1);
--==>> 1 행 이(가) 삽입되었습니다.


SELECT * FROM REP_RECRUIT LEFT JOIN USERS ON REP_RECRUIT.PIN_NO = USERS.PIN_NO;

COMMIT;
--===>> 커밋완료
DESC REP_RECRUIT;
DESC REP_RECRUIT_RESULT;

SELECT RR.REP_RECRUIT_NO, RRR.RECRUIT_RESULT_NO
FROM REP_RECRUIT RR LEFT OUTER JOIN REP_RECRUIT_RESULT RRR ON RR.REP_RECRUIT_NO = RRR.REP_RECRUIT_NO;
/*
REPR1	RESR1
REPR2	
*/

DESC FAQ;

INSERT INTO FAQ
( FAQ_NO
, TITLE
, CONTENT
)
VALUES
( FAQNOSEQ.NEXTVAL
, 'FAQ 예시1'
, '예시 1에 관련된 내용'
);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT * FROM FAQ;
--==>> 1	FAQ 예시1	예시 1에 관련된 내용


COMMIT;
--==>> 커밋완료

SELECT * FROM USERS;

DESC ADMIN_NOTICE;
/*
ADMIN_NOTICE_NO NOT NULL VARCHAR2(8)    
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
PIN_NO          NOT NULL VARCHAR2(16)   
*/


SELECT * FROM ADMIN;

INSERT INTO ADMIN_NOTICE
( ADMIN_NOTICE_NO
, TITLE
, CONTENT
, PIN_NO)
VALUES
('AN'||TO_CHAR(ADMINNOTICENOSEQ.NEXTVAL)
, '오픈 첫 공지'
, '많관잘부'
, 'UP16');
--==>> 1 행 이(가) 삽입되었습니다.


SELECT * FROM ADMIN_NOTICE;
--==>> AN1	오픈 첫 공지	많관잘부	UP16

DESC QUESTION;
/*
QUESTION_NO  NOT NULL VARCHAR2(12)   
PIN_NO       NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(1000) 
CREATED_DATE          DATE       
*/

INSERT INTO QUESTION
(QUESTION_NO
,PIN_NO
,TITLE
,CONTENT
,CREATED_DATE)
VALUES
('QN'||TO_CHAR(QUESTIONNOSEQ.NEXTVAL)
, 'UP1'
, '등업 질문'
,'등업은 어떻게 하나요?'
, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT * FROM QUESTION;
--===>> QN1	UP1	등업 질문	등업은 어떻게 하나요?	2023-08-07

COMMIT;
--==>> 커밋 완료.


DESC REP_APPLY_RESULT;

DESC REPORT_RESULT;

SELECT * FROM USERS;

DESC USERS;

-- 아이디 중복검사를 뷰 생성


CREATE OR REPLACE VIEW IDCHECK
AS
SELECT ID
FROM USERS 
UNION ALL 
SELECT ADMIN_ID AS ID
FROM ADMIN;

--==>> View IDCHECK이(가) 생성되었습니다.

SELECT ID
FROM IDCHECK;
/*
bad@naver.com
doolahyeon@gmail.com
nedahyeon@gmail.com
ohahyeon@gmail.com
sedahyeon@gmail.com
spb@naver.com
test995@test.com
test996@test.com
test997@test.com
test998@test.com
test999@test.com
tty@naver.com
ugahyeon@gmail.com
노진구@naver.com
도라에몽@naver.com
비실이@naver.com
이슬이@naver.com
퉁퉁이@naver.com
admin001@gmail.com
admin002@gmail.com
*/

--==>> 아이디 중복 체크용 COUNT
SELECT COUNT(*) AS COUNT
FROM IDCHECK
WHERE ID='노진구@naver.com';
--==>> 1

--==>> 아이디 중복검사용
SELECT COUNT(*) AS COUNT
FROM IDCHECK
WHERE ID='';


SELECT COUNT(*) AS COUNT
FROM USERS
WHERE NICKNAME='스폰지밥';
--==>> 1

--==>> 닉네임 중복 검사용
SELECT COUNT(*) AS COUNT
FROM USERS
WHERE NICKNAME='';


SELECT *
FROM FAQ;


SELECT sequence_name, last_number
FROM user_sequences;


SELECT * FROM PROFILE;


DESC NOTE;
/*
NOTE_NO   NOT NULL VARCHAR2(16)   
SENDER    NOT NULL VARCHAR2(16)   
READER    NOT NULL VARCHAR2(16)   
SEND_DATE          DATE           
READ_DATE          DATE           
TITLE     NOT NULL VARCHAR2(100)  
CONTENT   NOT NULL VARCHAR2(1000) 
SEND_DEL           DATE           
READ_DEL           DATE       
*/


SELECT * FROM USERS;


INSERT INTO NOTE
( NOTE_NO
, SENDER
, READER
, SEND_DATE
, TITLE
,CONTENT)
VALUES
( 'NN'||TO_CHAR(NOTENOSEQ.NEXTVAL)
, 'UP27'
, 'UP15'
, SYSDATE
, '하찮은 녀석'
, '은 너!'
);
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>> 커밋 완료.

DESC REPORT_COMM;
/*
REP_COMM_NO   NOT NULL NUMBER(10)   
COMM_NO       NOT NULL NUMBER(10)   
PIN_NO        NOT NULL VARCHAR2(16) 
REP_DATE               DATE         
REP_REASON_NO NOT NULL NUMBER(2)
*/

DESC COMMENTS;
SELECT * FROM RECRUIT;

INSERT INTO COMMENTS
( COMM_NO
, RECRUIT_NO
, PIN_NO
, CREATED_DATE
, CONTENT
)
VALUES
( COMMNOSEQ.NEXTVAL
, 'RC9'
, 'UP18'
, SYSDATE
, '기분 나쁘게 생김' 
);
--==>> 1 행 이(가) 삽입되었습니다.*3 

SELECT  * FROM COMMENTS;

DESC REPORT_COMM;

INSERT INTO REPORT_COMM
( REP_COMM_NO
, COMM_NO
, PIN_NO
, REP_DATE
, REP_REASON_NO )
VALUES
( REPCOMMNOSEQ.NEXTVAL
,3
,'UP13'
, SYSDATE
, 2 );
--==>> 1 행 이(가) 삽입되었습니다. *3

COMMIT;
--==>> 커밋 완료.


SELECT * FROM USERS US LEFT JOIN USER_PIN UP ON US.PIN_NO = UP.PIN_NO ORDER BY JOIN_DATE DESC;


SELECT PIN_NO
		   FROM (SELECT PIN_NO
 		         FROM USER_PIN
 		         ORDER BY JOIN_DATE DESC)
		   WHERE ROWNUM = 1;


DESC USERS;


DESC PROFILE;
/*
PROFILE_NO    NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
POS_NO        NOT NULL NUMBER(2)    
SUB_REGION_NO NOT NULL NUMBER(3)    
PROFILE_DATE           DATE   
*/

DESC PROFILE;
/*
PROFILE_NO    NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
POS_NO        NOT NULL NUMBER(2)    
SUB_REGION_NO NOT NULL NUMBER(3)    
PROFILE_DATE           DATE      
*/


CREATE OR REPLACE VIEW PROFILEVIEW
AS
SELECT  P.PIN_NO AS PINNO
        , P.PROFILE_NO AS PROFILENO
        , U.PHOTOURL AS PHOTOURL
        , NICKNAME
        , ID
        , R.REGION_NO AS REGIONNO
        , R.REGION_NAME AS REGIONNAME
        , SR.SUB_REGION_NO AS SUBREGIONNO
        , SR.SUB_REGION_NAME AS SUBREGIONNAME
        , P.POS_NO AS POSNO
        , POS.POS_NAME AS POSNAME
FROM PROFILE P 
LEFT JOIN USERS U ON P.PIN_NO = U.PIN_NO
LEFT JOIN POSITION POS ON P.POS_NO = POS.POS_NO
LEFT JOIN SUB_REGION SR ON P.SUB_REGION_NO = SR.SUB_REGION_NO
LEFT JOIN REGION R ON R.REGION_NO = SR.REGION_NO;
--==>> View PROFILEVIEW이(가) 생성되었습니다.



--★ 핀넘버로 프로필 데이터 출력 쿼리문
SELECT PROFILENO, PHOTOURL, NICKNAME, ID, REGIONNO, REGIONNAME, SUBREGIONNO, SUBREGIONNAME, POSNO, POSNAME
FROM PROFILEVIEW
WHERE PINNO = 'UP13';
--==>> 프로필 데이터 출력


CREATE OR REPLACE VIEW USERTOOLVIEW
AS
SELECT P.PIN_NO AS PINNO, P.PROFILE_NO AS PROFILENO, T.TOOL_NO AS TOOLNO,T.TOOL_NAME AS TOOLNAME
FROM USER_TOOL UT
LEFT JOIN PROFILE P ON UT.PROFILE_NO = P.PROFILE_NO
LEFT JOIN TOOL T ON UT.TOOL_NO = T.TOOL_NO;
--==> View USERTOOLVIEW이(가) 생성되었습니다.


--★ 핀넘버로 프로필에서 보여줄 사용 도구명 출력 쿼리문
SELECT TOOLNO, TOOLNAME
FROM USERTOOLVIEW
WHERE PINNO='UP13';


DESC PROFILE;
/*
PROFILE_NO    NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
POS_NO        NOT NULL NUMBER(2)    
SUB_REGION_NO NOT NULL NUMBER(3)    
PROFILE_DATE           DATE        
*/

SELECT * FROM PROFILE;

SELECT *
FROM USERS
LEFT OUTER JOIN PROFILE ON USERS.PIN_NO = PROFILE.PIN_NO;


--★ 핀넘버로 프로필 데이터 입력 쿼리문
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE )
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
,  #{pinNo}                            -- 원래를 세션에서 받아온 핀넘버여야 함
,  #{posNo}
,  #{subRegionNo}
, SYSDATE);


SELECT PROFILENO, NICKNAME, ID, REGIONNO, REGIONNAME, SUBREGIONNO, SUBREGIONNAME, POSNO, POSNAME
			FROM PROFILEVIEW
			WHERE PINNO = 'UP13';



			SELECT PROFILENO as profileNo
					, NICKNAME as nickname
					, ID     as id
					, REGIONNO as regionNo
					, REGIONNAME as regionName
					, SUBREGIONNO as subRegionNo
					, SUBREGIONNAME as subRegionName
					, POSNO as posNo
					, POSNAME as posName
			FROM PROFILEVIEW
			WHERE PINNO = 'UP13';

		SELECT PROFILENO,NICKNAME,ID,REGIONNO,REGIONNAME,SUBREGIONNO,SUBREGIONNAME,POSNO,POSNAME
			FROM PROFILEVIEW
			WHERE PINNO='UP18';
        
select * from users;



DESC PROFILE;



CREATE OR REPLACE VIEW USER_TOOL_VIEW
AS
SELECT P.PIN_NO AS PINNO, UT.TOOL_NO AS TOOLNO, T.TOOL_NAME AS TOOLNAME
FROM PROFILE P
LEFT JOIN USER_TOOL UT ON UT.PROFILE_NO = P.PROFILE_NO
LEFT JOIN TOOL T ON UT.TOOL_NO = T.TOOL_NO;


--★ 핀번호로 그사람의 사용 기술 알아내는 쿼리문
SELECT TOOLNO
FROM USER_TOOL_VIEW
WHERE PINNO='UP13';


SELECT * FROM RATE;

SELECT * FROM RATE_SELECT;

SELECT * FROM MEM_OUT_RATE;
DESC MEM_OUT_RATE;
/*
OUT_RATE_NO NOT NULL VARCHAR2(18) 
MEM_OUT_NO  NOT NULL VARCHAR2(16) 
GIVER       NOT NULL VARCHAR2(16) 
RATE_NO     NOT NULL NUMBER(1)    
RATE_DATE            DATE     
*/

SELECT * FROM FINAL;

SELECT * FROM RECRUIT_POS;

DESC RECRUIT_POS;
/*
RECRUIT_POS_NO NOT NULL VARCHAR2(20) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
POS_NO         NOT NULL NUMBER(2) 
*/

SELECT * FROM RECRUIT;

INSERT INTO RECRUIT_POS
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
,'RC12'
,1);

SELECT RECRUIT_POS_NO FROM RECRUIT_POS WHERE RECRUIT_NO = (SELECT RECRUIT_NO FROM RECRUIT WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='평가용'));
/*
RP24
RP25
RP26
*/

SELECT RECRUIT_POS_NO FROM RECRUIT_POS WHERE RECRUIT_NO = (SELECT RECRUIT_NO FROM RECRUIT WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='평가용1'));
/*
RP27
RP28
*/

SELECT * FROM RECRUIT_POS WHERE RECRUIT_NO = 'RC12';
/*
RP29	    RC12	1
RP30    	RC12	1
RP31    	RC12	1
*/


INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
        , 'RP31' -- ?삁?떆 (怨듦퀬?뿉?꽌 紐⑥쭛以묒씤 ?룷吏??뀡 踰덊샇)(?궗?슜?옄媛? ?꽑?깮?븳 媛?)
        , (SELECT PIN_NO FROM USERS WHERE NICKNAME='평가용4') -- 吏??썝?옄 ?? 踰덊샇(=紐⑥쭛?옄)
        ,'평가용4의 지원내용' -- ?궡?슜
        , TO_DATE('2023-01-01', 'YYYY-MM-DD')     -- 吏??썝?씪 (怨듦퀬 ?벑濡앹씪?떆?? 媛숈쓬) ?썝?옒?뒗 SYSDATE濡? 
        , TO_DATE('2023-01-02', 'YYYY-MM-DD')); 


SELECT * FROM RECRUIT;
/*
RC10 	UP39	1	평가 출력용 제목 공고	평가 출력용 내용 공고
RC1 1	UP41	1	평가 출력용 제목 공고	평가 출력용 내용 공고
*/

SELECT * FROM APPLY;
/*
AP21    	RP24	    UP42    	평가용 2의 지원내용
AP22	    RP25	    UP43	평가용 3의 지원내용
AP23	    RP26	    UP44	평가용4의 지원내용
AP24	    RP27	    UP45	평가용5의 지원내용
AP25	    RP28    	UP46	평가용6의 지원내용
*/

/*
AP26    	RP29	    UP42    	평가용2의 지원내용
AP27    	RP30	    UP43	평가용3의 지원내용
AP28    	RP31    	UP44	평가용4의 지원내용
*/
INSERT INTO FIRST_CK
(FIRST_CK_NO
, APPLY_NO
, PASS_DATE)
VALUES
( 'FS'||FIRSTCKSEQ.NEXTVAL
, 'AP28'
, TO_DATE('2023-01-10', 'YYYY-MM-DD'));

SELECT * FROM FIRST_CK;
/*
FS10	    AP21	    2023-07-23
FS11	    AP22	    2023-07-23
FS12	    AP23    	2023-07-23
FS13    	AP24    	2023-07-23
FS14    	AP25	    2023-07-23
*/

/*
FS15    	AP26	    2023-01-10
FS16	    AP27    	2023-01-10
FS17    	AP28    	2023-01-10
*/

SELECT *
FROM FINAL;
/*
FN13 	FS15	2023-01-14
FN14 	FS16	2023-01-14
FN15	     FS17	2023-01-14
*/

INSERT INTO FINAL(FINAL_NO, FIRST_CK_NO,FINAL_CK_DATE)
VALUES('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL),'FS17', TO_DATE('2023-01-14 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM RECRUIT;
/*
RC10    	UP39	1	평가 출력용 제목 공고	평가 출력용 내용 공고
RC11    	UP41	1	평가 출력용 제목 공고	평가 출력용 내용 공고
*/
INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES ('PJ'||TO_CHAR(PROJECTNOSEQ.NEXTVAL), 'RC12', TO_DATE('2023-01-14 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM MEM_OUT_REASON;
SELECT * FROM PRJ_STOP_REASON;


DESC MEMBER_OUT;
/*
MEM_OUT_NO    NOT NULL VARCHAR2(16) 
FINAL_NO      NOT NULL VARCHAR2(16) 
OUT_REASON_NO NOT NULL NUMBER(1)    
OUT_DATE               DATE
*/
/*
SELECT * FROM FINAL WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO FROM FIRST_CK WHERE APPLY_NO = (SELECT APPLY_NO FROM APPLY 
WHERE RECRUIT_POS_NO =(SELECT RECRUIT_POS_NO FROM RECRUIT_POS WHERE RECRUIT_NO = (SELECT RECRUIT_NO FROM RECRUIT 
WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='평가용')))));
*/

DESC FINAL;

SELECT FINAL_NO FROM FINAL WHERE FIRST_CK_NO=
(SELECT FIRST_CK_NO FROM FIRST_CK WHERE APPLY_NO = (SELECT APPLY_NO FROM APPLY WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='평가용6')));

DESC MEMBER_OUT;

INSERT INTO MEMBER_OUT
VALUES
( 'MO'||TO_CHAR(MEMOUTNOSEQ.NEXTVAL)
, 'FN8'
, 1
, TO_DATE('2023-07-31 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM MEMBER_OUT WHERE FINAL_NO ='FN8'; --> 평가용2 의 팀이탈 번호는 MO2

DESC MEM_OUT_RATE;
/*
OUT_RATE_NO NOT NULL VARCHAR2(18) 
MEM_OUT_NO  NOT NULL VARCHAR2(16) 
GIVER       NOT NULL VARCHAR2(16) 
RATE_NO     NOT NULL NUMBER(1)    
RATE_DATE            DATE         
*/

/*
평가용 UP39(팀장)       ==> FIANL_NO 없음   프로젝트 번호 PJ3
평가용2(UP42)      ==> 'FN8'     -> 팀 이탈자 (MEMBERO_OUT_RATE)    팀 이탈 번호 MO2
평가용3 UP43   ==> 'FN9'     -> 팀 닫기   (PROJECT_STOP_RATE)
평가용4 UP44    ==> 'FN10'    -> 팀 닫기   (PROJECT_STOP_RATE)
----
평가용1 UP41(팀장) ==> FINAL_NO 없음  프로젝트 번호 PJ4
평가용5  UP45    ==> 'FN11'  -> 팀완료      (PROJECT_RATE)
평가용6  UP46    ==> 'FN12'  -> 팀완료      (PROJECT_RATE)
*/



DESC FIRST_CK;
DESC RECRUIT_POS;
-- FN 키로 UP(핀번호) 가지고 오는

SELECT *
FROM USERS
WHERE NICKNAME='평가용1';


SELECT *
FROM FINAL F LEFT JOIN FIRST_CK FC ON F.FIRST_CK_NO = FC.FIRST_CK_NO
LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO
LEFT JOIN USERS US ON A.PIN_NO = US.PIN_NO
WHERE FINAL_NO = 'FN12';




DESC MEM_OUT_RATE;
/*
OUT_RATE_NO NOT NULL VARCHAR2(18) 
MEM_OUT_NO  NOT NULL VARCHAR2(16) 
GIVER       NOT NULL VARCHAR2(16) 
RATE_NO     NOT NULL NUMBER(1)    
RATE_DATE            DATE    
*/
SELECT * FROM RATE_SELECT;
/*
1	열심히 참여함
2	협업능력이 뛰어남
4	참여율이 저조함
5	협업능력이 부족함
6	업무 수행 능력이 낮음
3	업무 능력이 뛰어남
*/


-- 평가용 2('FN8' )에대한 팀이탈 평가자 평가자는(GIVER)는 평가용3 와 평가용 4
INSERT INTO MEM_OUT_RATE VALUES('MOR'||TO_CHAR(MEMOUTRATENOSEQ.NEXTVAL), 'MO2', 'FN9',  4, TO_DATE('2023-08-01 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEM_OUT_RATE VALUES('MOR'||TO_CHAR(MEMOUTRATENOSEQ.NEXTVAL), 'MO2', 'FN10', 5, TO_DATE('2023-08-01 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));

-- 평가용 3 (FN8) -> 평가용 4 (FN9) / 평가용4(FN9 -> 평가용 3(FN8)  프로젝트 번호 PJ3
-- 우선 팀 닫기 먼저
INSERT INTO PROJECT_STOP
VALUES('PS'||TO_CHAR(PRJSTOPNOSEQ.NEXTVAL), 'PJ3',  TO_DATE('2023-08-05 14:34:56', 'YYYY-MM-DD HH24:MI:SS'), 1);
-->> PJ3 팀 닫기 완료    팀 닫기 번호 ==> PS1

DESC PROJECT_STOP_RATE;
/*------------ -------- ------------ 
STOP_RATE_NO NOT NULL VARCHAR2(20) 
PRJ_STOP_NO  NOT NULL VARCHAR2(16) 
RECEIVER     NOT NULL VARCHAR2(16) 
GIVER        NOT NULL VARCHAR2(16) 
RATE_NO      NOT NULL NUMBER(1)    
RATE_DATE             DATE  
*/

INSERT INTO PROJECT_STOP_RATE VALUES('PSR'||TO_CHAR(PRJSTOPRATENOSEQ.NEXTVAL), 'PS1','FN9', 'FN8',1, TO_DATE('2023-08-06 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO PROJECT_STOP_RATE VALUES('PSR'||TO_CHAR(PRJSTOPRATENOSEQ.NEXTVAL), 'PS1','FN8', 'FN9',1, TO_DATE('2023-08-06 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 상호 평가 완료

--== 

DESC PROJECT_RATE;
/*
DONE_RATE_NO NOT NULL VARCHAR2(20) 
GIVER        NOT NULL VARCHAR2(16) 
RECEIVER     NOT NULL VARCHAR2(16) 
RATE_NO      NOT NULL NUMBER(1)    
RATE_DATE             DATE 
*/
-- 프로젝트 완료 평가 데이터 입력
-- 평가용 5 (FN10) -> 평가용 6 (FN11) / 평가용6(FN11) -> 평가용5 (FN10)  프로젝트 번호 PJ4

INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN10', 'FN11', 3, SYSDATE);
INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN11', 'FN10', 3, SYSDATE);
--==>> 프로젝트 완료 상호평가 완료

-- 또 다른 프로젝트 평가

/*
FN13 	FS15	2023-01-14
FN14 	FS16	2023-01-14
FN15	    FS17	2023-01-14
*/

INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN13', 'FN14', 1, SYSDATE);
INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN13', 'FN15', 2, SYSDATE);

INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN14', 'FN13', 1, SYSDATE);
INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN14', 'FN15', 3, SYSDATE);

INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN15', 'FN13', 6, SYSDATE);
INSERT INTO PROJECT_RATE VALUES('PJR'||TO_CHAR(PRJRATENOSEQ.NEXTVAL), 'FN15', 'FN14', 5, SYSDATE);


COMMIT;
--==>> 커밋 완료



SELECT * FROM PROJECT LEFT JOIN RECRUIT ON PROJECT.RECRUIT_NO = RECRUIT.RECRUIT_NO;

DESC PROJECT_STOP;
/*
PRJ_STOP_NO    NOT NULL VARCHAR2(16) 
PRJ_NO         NOT NULL VARCHAR2(16) 
STOP_DATE               DATE         
STOP_REASON_NO NOT NULL NUMBER(1)    
*/

DESC FINAL;
DESC FIRST_CK;



/*
평가용 UP39(팀장) ==> FIANL_NO 없음   프로젝트 번호 PJ3
평가용2(UP42)      ==> 'FN8'     -> 팀 이탈자 (MEMBERO_OUT_RATE)    팀 이탈 번호 MO2
평가용3 UP43   ==> 'FN9'     -> 팀 닫기   (PROJECT_STOP_RATE)
평가용4 UP44    ==> 'FN10'    -> 팀 닫기   (PROJECT_STOP_RATE)
----
평가용1 UP41(팀장) ==> FINAL_NO 없음  프로젝트 번호 PJ4
평가용5  UP45    ==> 'FN11'  -> 팀완료      (PROJECT_RATE)
평가용6  UP46    ==> 'FN12'  -> 팀완료      (PROJECT_RATE)
*/

DESC USER_TOOL;
/*
UTOOL_NO   NOT NULL VARCHAR2(16) 
PROFILE_NO NOT NULL VARCHAR2(16) 
TOOL_NO    NOT NULL NUMBER(3) 
*/


SELECT * FROM USER_TOOL WHERE PROFILE_NO = (SELECT PROFILE_NO FROM PROFILE WHERE PIN_NO ='UP42');
SELECT * FROM  USERS WHERE PIN_NO='UP42';

-- 최종합류 번호를 가지고 회원 번호 가져오는 법
SELECT F.FINAL_NO, US.PIN_NO
FROM FINAL F
LEFT JOIN FIRST_CK FC ON F.FIRST_CK_NO = FC.FIRST_CK_NO
LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO  
LEFT JOIN USERS US ON A.PIN_NO = US.PIN_NO
WHERE F.FINAL_NO = 'FN9';
--==>> FN8	UP42
--==>> FN8	FS10	2023-07-24	FS10	AP21	2023-07-23	AP21	RP24	UP42	평가용 2의 지원내용	2023-07-20	2023-07-20	US40	UP42	평가용2@naver.com	java002	평가용2	images/defaulfPhoto.jpg

commit;

SELECT TOOLNAME
			FROM USER_TOOL_VIEW
			WHERE PINNO='UP42';

SELECT * FROM RATE_SELECT;


/*
CREATE OR REPLACE VIEW RATE_SUMMARY
AS
*/

DESC MEMBER_OUT;

DESC RATE_SELECT;



--＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠＠
-- PINNO 핀넘버로 팀이탈 평가기록 가지고 오는 쿼리문
SELECT MOR.RATE_NO AS RATENO, COUNT(MOR.RATE_NO) AS COUNT
FROM MEM_OUT_RATE MOR 
LEFT JOIN MEMBER_OUT MO ON MOR.MEM_OUT_NO = MO.MEM_OUT_NO
LEFT JOIN FINAL F ON MO.FINAL_NO = F.FINAL_NO  
LEFT JOIN FIRST_CK FC ON F.FIRST_CK_NO = FC.FIRST_CK_NO
LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO  
LEFT JOIN USERS US ON A.PIN_NO = US.PIN_NO
WHERE US.PIN_NO = 'UP42'
GROUP BY MOR.RATE_NO;

--  PINNO 핀넘버로 팀닫기 평가기록 가지고 오는 쿼리문
SELECT PSR.RATE_NO AS RATENO, COUNT(PSR.RATE_NO) AS COUNT
FROM PROJECT_STOP_RATE PSR
LEFT JOIN FINAL F ON F.FINAL_NO = PSR.RECEIVER
LEFT JOIN FIRST_CK FC ON FC.FIRST_CK_NO = F.FIRST_CK_NO
LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO
WHERE A.PIN_NO='UP42'
GROUP BY PSR.RATE_NO;

-- PINNO 핀넘버로 프로젝트 완료 평가기록 가지고 오는 쿼리문
SELECT PJR.RATE_NO AS RATENO, COUNT(PJR.RATE_NO) AS COUNT
FROM PROJECT_RATE PJR
LEFT JOIN FINAL F ON F.FINAL_NO = PJR.RECEIVER
LEFT JOIN FIRST_CK FC ON FC.FIRST_CK_NO = F.FIRST_CK_NO
LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO
WHERE A.PIN_NO='UP42'
GROUP BY PJR.RATE_NO;

----

-- 핀번호로 전체 평가 가져오는 뷰
CREATE OR REPLACE VIEW PROFILE_TOTAL_RATE
AS
SELECT PINNO, RATENO, RATENAME, SUM(TOTAL_COUNT) AS TOTAL_COUNT
FROM (
    SELECT US.PIN_NO AS PINNO, RS.CONTENT AS RATENAME ,MOR.RATE_NO AS RATENO, COUNT(MOR.RATE_NO) AS TOTAL_COUNT
    FROM MEM_OUT_RATE MOR 
    LEFT JOIN RATE_SELECT RS ON RS.RATE_NO = MOR.RATE_NO
    LEFT JOIN MEMBER_OUT MO ON MOR.MEM_OUT_NO = MO.MEM_OUT_NO
    LEFT JOIN FINAL F ON MO.FINAL_NO = F.FINAL_NO  
    LEFT JOIN FIRST_CK FC ON F.FIRST_CK_NO = FC.FIRST_CK_NO
    LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO  
    LEFT JOIN USERS US ON A.PIN_NO = US.PIN_NO
    WHERE US.PIN_NO = 'UP42'
    GROUP BY US.PIN_NO, MOR.RATE_NO, RS.CONTENT
 
    UNION 
    
    SELECT A.PIN_NO AS PINNO, RS.CONTENT AS RATENAME, PSR.RATE_NO AS RATENO, COUNT(PSR.RATE_NO) AS TOTAL_COUNT
    FROM PROJECT_STOP_RATE PSR
    LEFT JOIN RATE_SELECT RS ON RS.RATE_NO = PSR.RATE_NO
    LEFT JOIN FINAL F ON F.FINAL_NO = PSR.RECEIVER
    LEFT JOIN FIRST_CK FC ON FC.FIRST_CK_NO = F.FIRST_CK_NO
    LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO
    WHERE A.PIN_NO='UP42'
    GROUP BY A.PIN_NO, PSR.RATE_NO, RS.CONTENT

    UNION
    
    SELECT A.PIN_NO AS PINNO, RS.CONTENT AS RATENAME, PJR.RATE_NO AS RATENO, COUNT(PJR.RATE_NO) AS TOTAL_COUNT
    FROM PROJECT_RATE PJR
    LEFT JOIN RATE_SELECT RS ON RS.RATE_NO = PJR.RATE_NO
    LEFT JOIN FINAL F ON F.FINAL_NO = PJR.RECEIVER -- 수정된 부분
    LEFT JOIN FIRST_CK FC ON FC.FIRST_CK_NO = F.FIRST_CK_NO
    LEFT JOIN APPLY A ON FC.APPLY_NO = A.APPLY_NO
    WHERE A.PIN_NO='UP42'
    GROUP BY A.PIN_NO, PJR.RATE_NO, RS.CONTENT
)
GROUP BY PINNO, RATENO, RATENAME;

DESC RATE_SELECT;

--==>> 뷰 이용해서 
        
        

        
        
-- 조회 예
SELECT RATENO, RATENAME, TOTAL_COUNT AS COUNT
FROM PROFILE_TOTAL_RATE
WHERE PINNO='UP42'
ORDER BY RATENO ASC;

DESC PROFILE;

-- 프로필 있나 없나 조회
SELECT COUNT(*) AS COUNT
FROM PROFILE
WHERE PIN_NO='UP42';


-- 프로필 입력
DESC PROFILE;

--1. 유저 프로필 -> 프로필번호 생성
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE )
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
,  #{pinNo}                            -- 원래를 세션에서 받아온 핀넘버여야 함
,  #{posNo}
,  #{subRegionNo}
, SYSDATE);
-- 2. 유저 사용도구 
INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO = #{pinNo})
, #{posNo}
, #{subRegionNo}
, #{toolNo});

-- region 출력
SELECT REGION_NO AS REGIONNO, REGION_NAME AS REGIONNAME
FROM REGION;

-- region에 따른 subregion 출력
SELECT SR.SUB_REGION_NO AS SUBREGIONNO, SR.SUB_REGION_NAME AS SUBREGIONNAME 
FROM SUB_REGION SR 
LEFT JOIN REGION R ON SR.REGION_NO = R.REGION_NO
WHERE R.REGION_NO =2;

SELECT * FROM APPLY;

DESC SUB_REGION;
DESC REGION;

DESC POSITION;
/*
POS_NO   NOT NULL NUMBER(2)    
POS_NAME NOT NULL VARCHAR2(40) 
*/
--==>>  포지션 리스트 출력
SELECT POS_NO AS POSNO, POS_NAME AS POSNAME
FROM POSITION;

/*
--==>> 1- 도구 리스트 출력 (1~10)
SELECT TOOL_NO AS TOOLNO, TOOL_NAME AS TOOLNAME
FROM TOOL
WHERE TOOL_NO >= 1 AND TOOL_NO <= 10;

--==>> 2- 도구 리스트 출력 (1~20)
SELECT TOOL_NO AS TOOLNO, TOOL_NAME AS TOOLNAME
FROM TOOL
WHERE TOOL_NO >= 1 AND TOOL_NO <= 10;

--==>> 3- 도구 리스트 출력 (21~30)
SELECT TOOL_NO AS TOOLNO, TOOL_NAME AS TOOLNAME
FROM TOOL
WHERE TOOL_NO >= 21 AND TOOL_NO <= 30;
*/


--==>> 포지션 리스트 출력
SELECT TOOL_NO AS TOOLNO, TOOL_NAME AS TOOLNAME
FROM TOOL;

SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM all_sequences
WHERE sequence_owner = 'PROJECTORS';

DESC PROFILE;
/*
PROFILE_NO    NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
POS_NO        NOT NULL NUMBER(2)    
SUB_REGION_NO NOT NULL NUMBER(3)    
PROFILE_DATE           DATE   
*/
-- 핀넘버로 PROFILE 생성하기
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE )
VALUES
(
);





-- 특정 회원의 유저 사용 도구가 갯수가 0이면 그냥 입력만
-- 특정 회원의 유저 사용 도구가 갯수가 0 이상 이면 DELETE 후 입력
SELECT COUNT(UTOOL_NO) AS COUNT
FROM USER_TOOL
WHERE PROFILE_NO = ( SELECT PROFILE_NO
                     FROM PROFILE
                     WHERE PIN_NO=#{pinNo});
        
        
-- 도구 DELETE
DELETE
FROM USER_TOOL
WHERE PROFILE_NO = ( SELECT PROFILE_NO
                     FROM PROFILE
                     WHERE PIN_NO=#{pinNo});
                     
-- 프로필을 참조하여 도구 넣기
INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
  FROM PROFILE
  WHERE PIN_NO=#{pinNo})
, #{toolNo});

SELECT *
FROM PROFILE
WHERE PIN_NO =(SELECT PIN_NO FROM USERS WHERE NICKNAME='노프로필');

--==>>PF28	UP47	1	2	2023-08-12


-- ★ 프로필 수정

-- position 내 프로필에 있던 값들이 셀렉티드되어서 보여지게 하기 위해 outer join 진행
SELECT
    P.POS_NO AS POSNO,
    P.POS_NAME AS POSNAME,
    MAX(PR.PIN_NO) AS PINNO
FROM POSITION P
LEFT OUTER JOIN PROFILE PR ON P.POS_NO = PR.POS_NO AND PR.PIN_NO = 'UP42'
GROUP BY P.POS_NO, P.POS_NAME
ORDER BY P.POS_NO;

-- check box  내 프로필에 있던 값들은 체크되어서 보여지게 하기 위해 outer join 진행
SELECT
    T.TOOL_NO AS TOOLNO,
    T.TOOL_NAME AS TOOLNAME,
    MAX(P.PIN_NO) AS PINNO
FROM TOOL T
LEFT OUTER JOIN USER_TOOL UT ON T.TOOL_NO = UT.TOOL_NO
LEFT JOIN PROFILE P ON UT.PROFILE_NO = P.PROFILE_NO AND P.PIN_NO = 'UP42'
GROUP BY T.TOOL_NO, T.TOOL_NAME
ORDER BY T.TOOL_NO;

-- 기존에 있던 프로필 지역번호
SELECT
    R.REGION_NO AS REGIONNO,
    R.REGION_NAME AS REGIONNAME,
    MAX(P.PIN_NO) AS PINNO
FROM REGION R
LEFT OUTER JOIN SUB_REGION SR ON R.REGION_NO = SR.REGION_NO
LEFT JOIN PROFILE P ON SR.SUB_REGION_NO = P.SUB_REGION_NO AND P.PIN_NO = 'UP42'
GROUP BY R.REGION_NO, R.REGION_NAME
ORDER BY R.REGION_NO;

-- 기존에 있던 프로직 세부지역번호
SELECT
    SR.SUB_REGION_NO AS SUBREGIONNO,
    SR.SUB_REGION_NAME AS SUBREGIONNAME,
    MAX(P.PIN_NO) AS PINNO
FROM SUB_REGION SR
LEFT OUTER JOIN PROFILE P ON SR.SUB_REGION_NO = P.SUB_REGION_NO AND P.PIN_NO = 'UP42'
GROUP BY SR.SUB_REGION_NO, SR.SUB_REGION_NAME
ORDER BY SR.SUB_REGION_NO;


SELECT *
FROM USERS WHERE NICKNAME='노프로필';

SELECT *
FROM PROFILEVIEW;


SELECT * 
FROM USERS;


