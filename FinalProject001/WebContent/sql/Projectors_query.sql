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







--�� ������ (������ ����ϴµ� ���� ������)
/*
-- ���� ������ Ŭ�� �� ���� �� ������
-- �� ������ ��Ʈ(��, �� ����)
SELECT  * 
FROM PROFILE
WHERE PIN_NO = ?;

-- ��  �� ��Ʈ
SELECT TOOL_NAME
FROM TOOL
WHERE TOOL_NO = (SELECT TOOL_NO
                FROM USER_TOOL
                WHERE PROFILE_NO = (SELECT  PROFILE_NO 
                                   FROM PROFILE
                                   WHERE PIN_NO = ?));

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
                                                                            WHERE PIB_NO =? ))));
                                         
--(2) �� �ݱ� �� ��                                         
SELECT RATE_NO, COUNT COUNT(RATE_NO)
FROM PROJECT_STOP_RATE
WHERE RECEIVER_NO = (SELECT FINAL_NO
                    FROM FINAL
                    WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                         FROM FIRST_CK
                                         WHERE APPLY_NO = (SELECT APPLY_NO
                                                           FROM APPLY
                                                           WHERE PIN_NO=?)));

--(3) �� �Ϸ� �� ��
SELECT RATE_NO, COUNT COUNT(RATE_NO)
FROM PROJECT_RATE
WHERE RECEIVER_NO = (SELECT FINAL_NO
                    FROM FINAL
                    WHERE FIRST_CK_NO = (SELECT FIRST_CK_NO
                                         FROM FIRST_CK
                                         WHERE APPLY_NO = (SELECT APPLY_NO
                                                           FROM APPLY
                                                           WHERE PIN_NO=?)));

-- �� �� �������� ���� �� ���ļ� �����ʿ� �����ָ��


*/


--
/*

-- ���� ������ ������ ���� ������ ����
CREATE SEQUENCE APPLYSEQ
NOCACHE;

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
SELECT *
FROM POSITION;
