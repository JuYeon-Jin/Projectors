SELECT USER
FROM DUAL;
--==>> PROJECTORS

SELECT SYSDATE
FROM DUAL;
--==>> 2023-08-07

-- 관리자 조회 (로그인시) 쿼리문
-- DELETEDATE 가 0이면 활성화 관리자, 1이면 비활성화 관리자
SELECT NVL2(TO_CHAR(QA.QUIT_DATE,'YYYY-MM-DD'),0,1) AS DELETEDATE, AD.PIN_NO AS PIN_NO, AD.ADMIN_NO AS ADMIN_NO, COUNT(*) AS COUNT
FROM QUIT_ADMIN QA
RIGHT JOIN ADMIN AD 
ON QA.PIN_NO = AD.PIN_NO
WHERE AD.ADMIN_ID = 'admin001@gmail.com' AND AD.ADMIN_PW = 'admin001'
GROUP BY TO_CHAR(QA.QUIT_DATE,'YYYY-MM-DD'), AD.PIN_NO, AD.ADMIN_NO;

-- 관리자 로그인 기록 쿼리문
DESC LOGIN_REC;

SELECT *
FROM LOGIN_REC;

INSERT INTO LOGIN_REC(LOGIN_REC,PIN_NO) 
VALUES(LOGINRECSEQ.NEXTVAL, 'UP1' )
;

ROLLBACK;

--------------------------------------------------------------------------------

-- 금일 로그인 횟수
SELECT COUNT(*)
FROM LOGIN_REC
WHERE TO_CHAR(LOGIN_DATE, 'YYYY-MM-DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD');

DESC REPORT_COMM;

-- 처리해야할 신고 건수
-- 댓글
SELECT COUNT(CASE WHEN RCR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_COMM_RESULT RCR
JOIN REPORT_COMM RC
ON RCR.REP_COMM_NO = RC.REP_COMM_NO;
-- 지원
SELECT COUNT(CASE WHEN RAR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_APPLY_RESULT RAR
JOIN REPORT_APPLY RA
ON RAR.REP_APPLY_NO = RA.REP_APPLY_NO;
-- 공고
SELECT COUNT(CASE WHEN RRR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_RECRUIT_RESULT RRR
JOIN REP_RECRUIT RR
ON RRR.REP_RECRUIT_NO = RR.REP_RECRUIT_NO;
-- 쪽지
SELECT COUNT(CASE WHEN RNR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_NOTE_RESULT RNR
JOIN REPORT_NOTE RN
ON RNR.REP_NOTE_NO = RN.REP_NOTE_NO;

-- 댓글 + 지원 + 공고 + 쪽지
SELECT
  (
    SELECT COUNT(CASE WHEN RCR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_COMM_RESULT RCR
    RIGHT JOIN REPORT_COMM RC
    ON RCR.REP_COMM_NO = RC.REP_COMM_NO
  ) +
  (
    SELECT COUNT(CASE WHEN RAR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_APPLY_RESULT RAR
    RIGHT JOIN REPORT_APPLY RA
    ON RAR.REP_APPLY_NO = RA.REP_APPLY_NO
  ) +
  (
    SELECT COUNT(CASE WHEN RRR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_RECRUIT_RESULT RRR
    RIGHT JOIN REP_RECRUIT RR
    ON RRR.REP_RECRUIT_NO = RR.REP_RECRUIT_NO
  ) +
  (
    SELECT COUNT(CASE WHEN RNR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_NOTE_RESULT RNR
    RIGHT JOIN REPORT_NOTE RN
    ON RNR.REP_NOTE_NO = RN.REP_NOTE_NO
  ) AS TOTAL_REPORT_COUNT
FROM DUAL;

-- 처리해야할 문의건수
SELECT COUNT(CASE WHEN A.CREATED_DATE IS NULL THEN 1 END)AS NULL_COUNT
FROM QUESTION Q
JOIN ANSWER A
ON Q.QUESTION_NO = A.QUESTION_NO;


-----------------------------------------------------------------------------------
-- ADMIN 공지 관련 쿼리문

-- 공지 LIST 조회 구문

SELECT ADMIN_NOTICE_NO
        , SUBSTR(( SELECT ADMIN_NO
            FROM ADMIN
            WHERE PIN_NO = AN.PIN_NO),3) AS ADMIN_NO
        , TITLE
        , CONTENT
FROM ADMIN_NOTICE AN
;

-- 공지 insert구문
INSERT INTO ADMIN_NOTICE(ADMIN_NOTICE_NO, PIN_NO, TITLE, CONTENT)
VALUES(AD||ADMINNOSEQ.NEXTVAL, ?, ? , ? )
;

-- 공지 DELETE 구문
DELETE
FROM ADMIN_NOTICE
WHERE ADMIN_NOTICE = ? ;


-- pin_no 로 관리자번호 뒷자리 숫자만 조회
SELECT TO_NUMBER(SUBSTR(ADMIN_NO, 3)) AS adminNo
FROM ADMIN
WHERE PIN_NO = 'UP16';


-- 공지 아티클 확인 구문
SELECT ADMIN_NOTICE_NO AS adminNoticeNo
        , TITLE
        , CONTENT
FROM ADMIN_NOTICE
WHERE ADMIN_NOTICE_NO = 'AN1'
;

DESC ADMIN_NOTICE;

--TEXTAREA 확인 용 공지글 삽입

INSERT INTO ADMIN_NOTICE(ADMIN_NOTICE_NO, TITLE, CONTENT, PIN_NO)
VALUES('AN'||ADMINNOTICENOSEQ.NEXTVAL, '이용수칙', '본 사이트는 웹 개발 프로젝트를 위한 사이트로, 많은 웹 개발자분들의 관심과 사랑으로 운영되고 있습니다. 
다만, 일부 악용유저들의 무분별한 이용으로 인해, 본 사이트의 수칙을 강화하게 되었습니다.
기존의 유저들께 불편을 끼치지 않으면서 악용유저들의 이용을 제한하고자 아래와 같은 수칙들을 안내드리니, 확인 부탁드립니다.', 'UP16')
;
--==>> 1 행 이(가) 삽입되었습니다.
