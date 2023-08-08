SELECT USER
FROM DUAL;
--==>> PROJECTORS
/*
[��������]
������  ->          AD||SEQ
ȸ���ĺ���ȣ        UP||SEQ
����    ->          US||SEQ
������  ->          PF||SEQ
���� ��� ����  ->  UT||SEQ
����    ->          NT||SEQ
����    ->          RC||SEQ
������  ->          AP||SEQ
������Ʈ->          PJ||SEQ
���� ������ ��ȣ -> RP||SEQ
1�� �շ� ��ȣ    -> FS||SEQ
���� �շ� ��ȣ   -> FN||SEQ

[��¥ �� ����]
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';


[������ ���� ����]
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
--==>> Sequence LOGINRECSEQ��(��) �����Ǿ����ϴ�.
CREATE SEQUENCE LOGOUTRECSEQ
NOCACHE;
--==>> Sequence LOGOUTRECSEQ��(��) �����Ǿ����ϴ�.

*/

--�� ������ ���� �� INSERT ���� ������
/*
-- ȸ�� ���� �� �ĺ� ��ȣ �߻�
-- ȸ�� �ĺ� ��ȣ ������ ����


-- ȸ���ĺ���ȣ ���̺� ������ ����
INSERT INTO USER_PIN VALUES(PINNOSEQ.NEXTVAL ,SYSDATE);

-- ȸ�� ����

--ȸ�� ���� ���̺�(USERS)�� ������ ����
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
, '���̵�@naver.com'
, '��й�ȣ'
, '�г���'
, 'c://WebStudy');

-- ȸ�� ���� �� ������ ����

-- ������(PROFILE) ���̺� ������ ����
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, �ڼ������� �Ѱܹ��� PIN_NO
, �������� ��ȣ
, (SELECT ��������ȣ FROM SUB_REGION WHERE REGION_NO=�ڼ���������ȣ)
, SYSDATE);


-- ���� ��뵵�� ���̺�(������ ��ȣ�� �����ϴ�) ��� ������ ���� �ϳ��� PROFILE_NO�� 
INSERT INTO USER_TOOL
( UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLSEQ.NEXTVAL)
, (SELECT PROFILE_NO FROM PROFILE WHERE PIN_NO=?)
, TOOL_NO);

*/


-- �� ��¿� ���� FINAL_NO ���ϴ� �޼ҵ�
/*
SELECT FINAL_NO
      FROM FINAL
       WHERE FIRST_CK_NO = (SELECT FIRST CK_NO
                            FROM FIRST_CK
                            WHERE APPLY_NO = (SELECT APPLY_NO
                                              FROM APPLY
                                              WHERE PIB_NO =? ))));
*/



--�� ������ (������ ����ϴµ� ���� ������)================


DESC POSITION;
/*
-- ���� ������ Ŭ�� �� ���� �� ������
-- �� ������ ��Ʈ(��, �� ����)
-- �ں� ����
CREATE OR REPLACE VIEW PROFILE_SHOW
AS
SELECT U.ID, U.NICKNAME, POS.POS_NAME, R.REGION_NAME, SR.REGION_NAME, POS.POS_NAME, P.PROFILE_DATE
FROM PROFILE P LEFT JOIN USERS U ON P.PIN_NO = U.PIN_NO
LEFT JOIN POSITION POS ON P.POS_NO = POS.POS_NO
LEFT JOIN SUB_REGION SR ON SR.SUB_REGION_NO = P.SUB_REGION_NO; 
LEFT JOIN REGION R ON R.REGION_NO = SR.REGION_NO;

--�� �� ����
SELECT * FROM PROFILE_SHOW
WHERE PIN_NO = ��; 


-- ��  �� ��Ʈ
--�� �� ����
CREATE OR REPLACE VIEW PROFILE_TOOL_VIEW
AS
SELECT T.TOOL_NAME
FROM TOOL T
JOIN USER_TOOL UT ON T.TOOL_NO = UT.TOOL_NO
JOIN PROFILE P ON UT.PROFILE_NO = P.PROFILE_NO;

--�� �� ���� ����
SELECT TOOL_NAME
FROM PROFILE_TOOL_VIEW
WHERE PIN_NO = ��;




-- �� �� ��Ʈ
--(1) ���� ��Ż �� �� ( -> �� ��ȣ�� �ش� �򰡰� �� ������)
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
                                                                            WHERE PIN_NO =? ))))
GROUP BY RATE_NO;
                                         
--(2) �� �ݱ� �� ��                                         
SELECT RATE_NO, COUNT AS COUNT(RATE_NO)
FROM PROJECT_STOP_RATE
WHERE RECEIVER_NO = (SELECT FINAL_NO
                    FROM FINAL
                    WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                         FROM FIRST_CK
                                         WHERE APPLY_NO = (SELECT APPLY_NO
                                                           FROM APPLY
                                                           WHERE PIN_NO=?)))
GROUP BY RATE_NO;

--(3) �� �Ϸ� �� ��
SELECT RATE_NO, COUNT(RATE_NO) AS DONE_RATE
FROM PROJECT_RATE
WHERE RECEIVER_NO = (SELECT FINAL_NO
                    FROM FINAL
                    WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                         FROM FIRST_CK
                                         WHERE APPLY_NO = (SELECT APPLY_NO
                                                           FROM APPLY
                                                           WHERE PIN_NO=?)))
GROUP BY RATE_NO;


-- �� �� �������� ���� �� ���ļ� �����ʿ� �����ָ�� �����ִ� �� ���� ����==========================================
-- �� �� ����
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


--�� �� ����
SELECT RATE_NO, TOTAL_COUNT
FROM RATE_SUMMARY
WHERE PIN_NO = ���� ��ȣ; 


*/


/*


-- Ư�� ������ Ư�� ���üǿ� ���� ������ ������ ��
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
                       WHERE PIN_NO=?))  -- ���� ������ PIN_NO
, ?
, ??
, SYSDATE);


-- �����ڰ� Ư�� ������(������)�� ���� ������ Ŭ���� �� ����� INSERT ������
-- ���� �� �����ڰ� ���ϴ� 1�� ������ ���� Ŭ�� �� FIRST_CK ���̺�  �� ����� APPLY_NO�� INSERT �ȴ�.
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


-- ������Ʈ �����ڰ� 1�� ���� ��Ų �ο��� ���� �ο��� �������� Ȯ���ϴ� ������
-- �� ���� ���� ���� ���� �ø� �� ���� �ο��� �����ڰ� ���� �ο��� +1 �� INSERT �Ǿ��� ��
-> �����ڰ� �ڵ����� ���� ������ ������ FIRST_CK ���̺�� �̵��ؾ� �ϱ� ����





-- ���� �շ� �³��� ������ INSERT�� ���̺� (������Ʈ ���� ���ο� �������)
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


--== �Է��� ������(UsersDAO.xml)

SELECT *
FROM USERS;

-- (1) �α���
SELECT COUNT(PIN_NO)
FROM USERS
WHERE ID='���󿡸�@naver.com' AND PW='java002$';
--��


--�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
-- 1. ȸ�� ����
SELECT COUNT(PIN_NO)
FROM USERS
WHERE ID=? AND PW=?;
--�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�

-- �α��� ���� �ɹ�ȣ�� �����ϱ� ���� getPin_no()

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';




--== ȸ�� ���� Ŭ���� ���ÿ� ������ �޼ҵ� =========================
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
,'spb@naver.com'
,'java002'
,'��������'
,'images/defaulfPhoto.jpg');




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
,'tty@naver.com'
,'java002'
,'Ż���2'
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
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='Ż���')
, SYSDATE
, (SELECT ID FROM USERS WHERE NICKNAME='Ż���')
, 1
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



SELECT *
FROM USERS;
--==>> US16	UP18	spb@naver.com	java002	��������	images/defaulfPhoto.jpg


--�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
--1. �켱 �� ����
INSERT INTO USER_PIN
( PIN_NO
, JOIN_DATE)
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
 , SYSDATE);
--2. ������ �ɿ� ȸ������ ����
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
--�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
--=================================================


-- ȸ������ ����

-- ���õ����� �Է�

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
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='��������')
, 1
, '�ҷ��� ������ ����'
, '�ҷ��� ������ ����'
, SYSDATE
, TO_DATE('2023-08-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
);

--===>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT RECRUIT_NO FROM RECRUIT WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='��������');
--==>> RC7

DESC REP_RECRUIT;
/*
�̸�             ��?       ����           
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
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='��������' )
, SYSDATE
, 1);

--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

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
1	ó��
0	�ݷ�
*/
SELECT *
FROM REGULATION;
/*
1	�����
2	������
3	�弳
4	����
5	����
6	������ ����(���� �� �ڻ� ��)
7	��⼺ ����
8	�������� ������
9	��Ÿ
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
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='��������')
, SYSDATE
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�߰� �Ű� ��ó���� ������ �Է�

INSERT INTO USER_PIN
( PIN_NO
, JOIN_DATE)
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
 , SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
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
,'���ۻ��'
,'images/defaulfPhoto.jpg');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

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
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='���ۻ��')
, 1
, '�ָ��� ������ ����'
, '�ָ��� ������ ����'
, SYSDATE
, TO_DATE('2023-08-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


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
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='���ۻ��' )
, SYSDATE
, 1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT * FROM REP_RECRUIT LEFT JOIN USERS ON REP_RECRUIT.PIN_NO = USERS.PIN_NO;

COMMIT;
--===>> Ŀ�ԿϷ�
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
, 'FAQ ����1'
, '���� 1�� ���õ� ����'
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM FAQ;
--==>> 1	FAQ ����1	���� 1�� ���õ� ����


COMMIT;
--==>> Ŀ�ԿϷ�

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
, '���� ù ����'
, '�����ߺ�'
, 'UP16');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT * FROM ADMIN_NOTICE;
--==>> AN1	���� ù ����	�����ߺ�	UP16

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
, '��� ����'
,'����� ��� �ϳ���?'
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM QUESTION;
--===>> QN1	UP1	��� ����	����� ��� �ϳ���?	2023-08-07

COMMIT;
--==>> Ŀ�� �Ϸ�.


DESC REP_APPLY_RESULT;

DESC REPORT_RESULT;

SELECT * FROM USERS;

DESC USERS;

-- ���̵� �ߺ��˻縦 �� ����


CREATE OR REPLACE VIEW IDCHECK
AS
SELECT ID
FROM USERS 
UNION ALL 
SELECT ADMIN_ID AS ID
FROM ADMIN;

--==>> View IDCHECK��(��) �����Ǿ����ϴ�.

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
������@naver.com
���󿡸�@naver.com
�����@naver.com
�̽���@naver.com
������@naver.com
admin001@gmail.com
admin002@gmail.com
*/

--==>> ���̵� �ߺ� üũ�� COUNT
SELECT COUNT(*) AS COUNT
FROM IDCHECK
WHERE ID='������@naver.com';
--==>> 1

--==>> ���̵� �ߺ��˻��
SELECT COUNT(*) AS COUNT
FROM IDCHECK
WHERE ID='';


SELECT COUNT(*) AS COUNT
FROM USERS
WHERE NICKNAME='��������';
--==>> 1

--==>> �г��� �ߺ� �˻��
SELECT COUNT(*) AS COUNT
FROM USERS
WHERE NICKNAME='';


SELECT *
FROM FAQ;

