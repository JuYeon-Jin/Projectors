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


































