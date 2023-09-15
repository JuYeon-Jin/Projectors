select user from dual;
--==>>LJB_PROJECTORS

select table_name from all_tables
where owner ='LJB_PROJECTORS';
--==>>
/*
SPACE_NOTICE
SUB_REGION
TOOL
USERS
USER_PIN
PROFILE
PROJECT
PROJECT_RATE
PROJECT_STOP
PRJ_STOP_REASON
PROJECT_STOP_RATE
QUESTION
QUIT_ADMIN
RATE_SELECT
RECRUIT
RECRUIT_POS
RECRUIT_TOOL
REGION
REGULATION
REGULATION_PERIOD
REPORT_APPLY
REPORT_COMM
REPORT_NOTE
REPORT_PRJ
REPORT_REASON
REPORT_RESULT
REP_APPLY_RESULT
REP_COMM_RESULT
REP_NOTE_RESULT
REP_PRJ_REASON
REP_RECRUIT
REP_RECRUIT_RESULT
USER_TOOL
WITHDRAW_TYPE
WITHDRAW_USER
WORKSPACE
WORKSPACE_COMM
ADMIN
ADMIN_NOTICE
ANSWER
APPLY
COMMENTS
DEL_APPLY
DEL_COMM
DEL_NOTE
DEL_RECRUIT
DEL_REP_PRJ
DO_TYPE
FAQ
FEED
FINAL
FIRST_CK
LOGIN_REC
LOGOUT_REC
MEETING
MEMBER_OUT
MEM_OUT_RATE
MEM_OUT_REASON
NOTE
POSITION
PRJ_PRESULT
*/

select * from users;

select * from recruit
where title='�츮���� ��¯';

update recruit
SET PRJ_START =TO_DATE('2023-09-15')
where title = '�츮���� ��¯';

--------------------------------------------------------------------------------
-- 23.08.30 _ ������ ��� �� �ش� ��ƼŬ ��ȸ�� ���� �ֱ� �� ��ȣ ã�� ���� �߰�


SELECT TO_CHAR(MAX(SPACE_NOTICE_NO)) AS spaceNoticeNo
FROM SPACE_NOTICE;
--==>> SN85

select * from space_notice
ORDER BY space_notice_no desc;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--23.09.04 _ ȸ�Ƿ� �Խ��� �� ��� �ҷ����� ������
-- ȸ�ǳ�¥�� �������� �ֽż� �����ϴ� ORDER BY ���� �߰� 

SELECT SUBSTR(M.MEETING_NO,3) meetingNo
  , U.NICKNAME nickName
  , M.TITLE title
  , M.CREATED_DATE createdDate
  , M.MEETING_DATE meetingDate
FROM MEETING M JOIN FINAL F
ON M.FINAL_NO = F.FINAL_NO              
    JOIN FIRST_CK FC 
    ON F.FIRST_CK_NO = FC.FIRST_CK_NO 
        JOIN APPLY A 
        ON FC.APPLY_NO = A.APPLY_NO 
            JOIN USERS U 
            ON A.PIN_NO = U.PIN_NO  
WHERE M.FINAL_NO IN('FN1','FN2','FN3')
ORDER BY MEETINGDATE DESC;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------�ڡڡ�[ �������̽� >  �� �۾���  ���� ������ ]�ڡڡ�

select * from FINAL; -- �����շ���ȣ�� ��ȸ 

select * from all_sequences
where sequence_owner = 'LJB_PROJECTORS'; -- ��� ������ ��ȸ 

--�� �۾��� ��� ������ ����
CREATE SEQUENCE WORKSPACECOMMNOSEQ NOCACHE;
--==>> Sequence WORKSPACECOMMNOSEQ��(��) �����Ǿ����ϴ�.

SELECT * FROM WORKSPACE; -- �۾��� ���̺� ��������ȸ 

DESC WORKSPACE;
--==>>
/*
�̸�           ��?       ����             
------------ -------- -------------- 
WORKSPACE_NO NOT NULL VARCHAR2(16)   
FINAL_NO     NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(2000) 
CREATED_DATE NOT NULL DATE           
WORK_DATE             DATE 
*/

SELECT * -- �۾��� ���̺� �������� ��ȸ
FROM user_constraints
WHERE table_name = 'WORKSPACE';

--�� �۾��� ���̺� �۾����� ��� �÷� �߰��ϰ� NN �������� �߰� (�����)
--ALTER TABLE WORKSPACE MODIFY WORK_DATE DATE NOT NULL;

--��  09.14 ����
ALTER TABLE WORKSPACE MODIFY WORK_DATE;   
--==>> ��� NN �������� ���� (������ �⺻������ ���ϱ�) 


SELECT * FROM WORKSPACE_COMM;  -- �۾����� ��� ���̺� ��ȸ
-- WORKSPACE_COMM_NO , WORKSPACE_NO,  FINAL_NO, CONTENT, CREATED_DATE 
--------------------------------------------------------------------------------
--�� �� �۾��ǿ� �� ���
INSERT INTO WORKSPACE(WORKSPACE_NO, FINAL_NO, TITLE, CONTENT, WORK_DATE, CREATED_DATE)
VALUES('WS'||TO_CHAR(WORKSPACENOSEQ.NEXTVAL) -- �۾��� ��ȣ
     , 'FN1'  -- �ۼ����� �����շ���ȣ
     , 'N���� �۾�����'
     , '�۾��� NULL�� �׽�Ʈ.'
     , NVL(NULL,SYSDATE) -- �۾��� ���� ���ϸ� ����Ϸ� ����� 
     , SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--------------------------------------------------------------------------------
--�� �� �۾��� �Խ��� ��� �ҷ����� (�� ��ȣ, ����, �۾���,�ۼ���) 
SELECT SUBSTR(WORKSPACE_NO,3), TITLE, WORK_DATE, CREATED_DATE 
FROM WORKSPACE
WHERE FINAL_NO = 'FN1'
ORDER BY WORK_DATE DESC
;
--==>> 
/*
WS29	�׽�Ʈ	             23/09/04	23/09/04
WS23	��ȹ�� �ۼ�	        23/09/02	23/09/04
WS22	ù ����: ��ȹȸ��	23/09/01	23/09/04
*/
--------------------------------------------------------------------------------
--�� �� �۾��� ��ƼŬ ���� �������� (�� ��ȣ, ����, �۾���, �ۼ���, ����)
SELECT WORKSPACE_NO, TITLE, WORK_DATE, CREATED_DATE, CONTENT
FROM WORKSPACE 
WHERE WORKSPACE_NO = 'WS23'
;
--==>> WS23	2���� �۾�����!	23/09/04	���õ� ��ȹȸ�Ǹ� �ߴ�!
--------------------------------------------------------------------------------
--�� ��ƼŬ ���� (����, ����, �۾���)
UPDATE WORKSPACE
SET TITLE = '��ȹ�� �ۼ�',
    CONTENT = 'ȸ�� ��� �������� ��ȹ���� ����ϴ�.',
    WORK_DATE = '23/09/02'
WHERE WORKSPACE_NO ='WS23'
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�� ��ƼŬ ����
DELETE FROM WORKSPACE
WHERE WORKSPACE_NO ='WS31'
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�� �� �۾��� ��ƼŬ�� �޸� ��� ��������(��۹�ȣ, �ۼ��� �г���, ����, �ۼ���)
SELECT WORKSPACE_COMM_NO, FINAL_NO, CONTENT, CREATED_DATE 
FROM WORKSPACE_COMM
WHERE WORKSPACE_NO = 'WS22'
ORDER BY CREATED_DATE DESC;
;
--==>> 2	FN2	�ʹ� ª�� ���Ű� �ƴѰ���!	23/09/04
--------------------------------------------------------------------------------
--�� Ư�� �۾��ۿ� ��� �ۼ��ϱ� (��������)
INSERT INTO WORKSPACE_COMM(WORKSPACE_COMM_NO , WORKSPACE_NO,  FINAL_NO, CONTENT, CREATED_DATE)
VALUES(WORKSPACECOMMNOSEQ.NEXTVAL
     , 'WS22'
     , 'FN2'
     , '�ʹ� ª�� ���Ű� �ƴѰ���!'
     , SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--------------------------------------------------------------------------------
--�� ��� �����ϱ�
UPDATE WORKSPACE_COMM 
SET CONTENT = '�ʹ� ª�� ���Ű� �ƴѰ���~!! ������ �� �ڼ��� ���ּ���'
WHERE WORKSPACE_NO='WS22'
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�� ��� �����ϱ�
DELETE FROM WORKSPACE_COMM
WHERE WORKSPACE_COMM_NO = 3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------
COMMIT;
--==>> Ŀ�� �Ϸ�.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 23.09.14 _

-- �ٸ� ��� �۾��� ���� ��, ������ �۾������� ����ֱ� ���� �г��� ��������
-- (�� �����̽� ���ο��� �̸����� ���� + �̵� �Ŀ��� �����) => �ϴ� ����

-- �����丮 ���� ������ 

-- ȸ�Ƿ�, ���� ��ü�� �۾��� ������ ��ȸ
SELECT * FROM MEETING;
SELECT * FROM WORKSPACE;

-- ȸ�Ƿ�,�۾��� ���̺� ���� ��ȸ => �ʿ��� �÷� 
DESC MEETING; -- MEETING_NO, TITLE, MEETING_DATE (ȸ�Ǳ۹�ȣ, ����, ȸ����)
DESC WORKSPACE; -- WORKSPACE_NO, FINAL_NO, TITLE, WORK_DATE (�۾��۹�ȣ, �۾���, ����, �۾���)

-- ȸ�Ƿ� �κ� �����丮 (����, ȸ����) 
SELECT TITLE, MEETING_DATE FROM MEETING WHERE FINAL_NO IN('FN1','FN2','FN3');

-- �۾��� �κ� �����丮(�۾���, ����, �۾���)
SELECT FINAL_NO, TITLE, WORK_DATE FROM WORKSPACE WHERE FINAL_NO IN('FN1','FN2','FN3');


commit;
