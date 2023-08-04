SELECT USER
FROM DUAL;
--==>> PROJECTORS


--�� ������ ���� �� INSERT ���� ������

/*
-- ȸ�� ���� �� �ĺ� ��ȣ �߻�
-- ȸ�� �ĺ� ��ȣ ������ ����
CREATE SEQUENCE PINNOSEQ
NOCACHE;

-- ȸ���ĺ���ȣ ���̺� ������ ����
INSERT INTO USER_PIN VALUES(PINNOSEQ.NEXTVAL ,SYSDATE);

-- ȸ�� ����

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


-- ȸ�� ���� �� ������ ����

-- ������ ��ȣ�� ����� ������ ����
CREATE SEQUENCE PROFILESEQ
NOCACHE;

-- ������(PROFILE) ���̺� ������ ����
INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( PROFILESEQ.NEXTVAL
, ?
, ?
, (SELECT ? FROM SUB_REGION WHERE REGION_NO=?)
, SYSDATE);


---- ���� ��뵵�� ��ȣ�� ����� ������ ����
CREATE SEQUENCE UTOOLSEQ
NOCACHE;

-- ���� ��뵵�� ���̺�(������ ��ȣ�� �����ϴ�) ��� ������ ���� �ϳ��� PROFILE_NO�� 
INSERT INTO USER_TOOL
( UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES
( UTOOLSEQ.NEXTVAL
, (SELECT PROFILE_NO FROM PROFILE WHERE PIN_NO=?)
, TOOL_NO);

-- ���� ������ ������ ���� ������ ����
CREATE SEQUENCE APPLYSEQ
NOCACHE;

-- Ư�� ������ Ư�� ���üǿ� ���� ������ ������ ��
INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, ALLY_DATE)
VALUES
( APPLYSEQ.NEXTVAL
, (SELECT RECRUIT_POS_NO
   FROM RECRUIT_POS
   WHERE (SELECT RECRUIT_NO 
          FROM RECRUIT
          WHERE PIN_NO=?))
, ?
, ??
, SYSDATE);


-- �����ڰ� Ư�� ������(������)�� ���� ������ Ŭ���� �� ����� INSERT ������
-- ���� �� �����ڰ� ���ϴ� 1�� ������ ���� Ŭ�� �� FIRST_CK ���̺�  �� ����� APPLY_NO�� INSERT �ȴ�.
INSERT FIRST_CK
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


*/


--�� ������ (������ ����ϴµ� ���� ������)
/*
-- ���� ������ Ŭ�� �� ���� �� ������
-- �� �� ������ ������ ��Ʈ
SELECT * 
FROM PROFILE


-- �� +��


*/







