SELECT USER
FROM DUAL;
--==>> PROJECTORS

-- ȸ�� ���� �� �ĺ� ��ȣ �߻�
/*
-- ȸ�� �ĺ� ��ȣ ������ ����
CREATE SEQUENCE PINNOSEQ
NOCACHE;

-- ȸ���ĺ���ȣ ���̺� ������ ����
INSERT INTO USER_PIN VALUES(PINNOSEQ.NEXTVAL ,SYSDATE);
*/

-- ȸ�� ����
/*
--ȸ�� ��ȣ ������ ����
CREATE SEQUENCE USERNOSEQ
NOCACHE;

--ȸ�� ���� ���̺�(USERS)�� ������ ����
INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( USERNOSEQ.NEXTVAL
, (SELECT MAX(PIN_NO) FROM USER_PIN)
, ?
, ?
, ?
, ?);

*/

-- ȸ�� ���� �� ������ ����
/*
-- ������ ��ȣ�� ����� ������ ����
CREATE SEQUENCE PROFILESEQ
NOCACHE;

-- �����ʿ� �� ���� ���� ��ȣ ����


-- ������(PROFILE) ���̺� ������ ����
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( PROFILESEQ.NEXTVAL
, (SELECT PIN_NO FROM USERS WHERE USER_NO=?)
, ?
, (SELECT ? FROM SUB_REGION WHERE REGION_NO=?)
, SYSDATE);



---- ���� ��뵵�� ��ȣ�� ����� ������ ����
CREATE SEQUENCE UTOOLSEQ
NOCACHE;

-- ���� ��뵵�� ���̺�(������ ��ȣ�� �����ϴ�)
INSERT INTO USER_TOOL
( UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES
( UTOOLSEQ.NEXTVAL
, ( SELECT PROFILE_NO FROM PROFILE WHERE PIN_NO=?)
   )
);
*/






