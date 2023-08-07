SELECT USER FROM DUAL;
--==>PROJECTORS
--------------------------------------------------------------------------------
--�� 2023.08.03.���� 8:55 ���� : ���̺� �μ�Ʈ ���� �ۼ� 


DESC RATE_SELECT;
--==>>
/*
�̸�      ��?       ����           
------- -------- ------------ 
RATE_NO NOT NULL NUMBER(1)    
CONTENT NOT NULL VARCHAR2(30) 
*/

--�� �� ������ ���̺� ������ �Է� ( RATE_SELECT )
INSERT INTO RATE_SELECT VALUES(1,'������ ������');
INSERT INTO RATE_SELECT VALUES(2,'�����ɷ��� �پ');
INSERT INTO RATE_SELECT VALUES(3,'���� �ɷ��� �پ');
INSERT INTO RATE_SELECT VALUES(4,'�������� ������');
INSERT INTO RATE_SELECT VALUES(5,'�����ɷ��� ������');
INSERT INTO RATE_SELECT VALUES(6,'���� �ɷ��� ������');

--(���� ���� ���� �ۼ��� �ϰ� �غ������� ���� �Ϸ�) 
--------------------------------------------------------------------------------

--�� 2023.08.04.���� 2:48 ����
-- : ���� ���� �Խ���, ���ΰ����� �ۼ� ������ ���� ������ �ۼ�

--�� ������ ���� �Խ��� ���̺� Ȯ�� 
DESC ADMIN_NOTICE; 
--==>>
/*
�̸�              ��?       ����             
--------------- -------- -------------- 
ADMIN_NOTICE_NO NOT NULL VARCHAR2(8)    
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
PIN_NO          NOT NULL VARCHAR2(16)  
*/
--------------------------------------------------------------------------------
--�� ������ ��� ��ȸ ������ �غ� (MainNoticeLists.jsp)
--( �۹�ȣ, ����) + (�ۼ���, �ۼ���..�� ���� �������� �ϴ��� ���� ����ϴ�) 
SELECT ADMIN_NOTICE_NO, TITLE 
FROM ADMIN_NOTICE;

--------------------------------------------------------------------------------
--�� ������ ���� ��� ���� ������ �غ� (MainNoticeInsert.jsp)

--��1) ������ ���� (�� ��ȣ �տ� ���� ���ڿ��� ���� ����) 
CREATE SEQUENCE ADMIN_NOTICE_NO_SEQ
NOCACHE;

--��2)�μ�Ʈ ���� ( �۹�ȣ, ����, ����, �ɹ�ȣ) // ���ڿ� ����
INSERT INTO ADMIN_NOTICE(ADMIN_NOTICE_NO,TITLE,CONTENT,PIN_NO)
VALUES('AAA'||TO_CHAR(ADMIN_NOTICE_SEQ.NEXTVAL),'�ȳ��ϼ��� �������ͽ��Դϴ�','�ȳ��ϼ���! ����Ʈ�� ���� �����߽��ϴ�!','ABCD1234');

--------------------------------------------------------------------------------

--�� 2023.08.06.���� 2:00 ����
-- ������ �μ�Ʈ ������ �ۼ�

-- : ȸ�� 5��(�����ʱ���), �������� 2��(1������|1�����Ϸ�)
--  ������ 5�� (����1�� ������ ������ 1��, ���� 2�� ������ ������ 1�� 
--               + ������ 3��(2����: ���� �Ϸ�� ����2 // 1���� ���� ���� ���� 1)) 
-- ������Ʈ 1��(3�� ������Ʈ) 


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--=============================
CREATE SEQUENCE USERPINSEQ
NOCACHE;

CREATE SEQUENCE USERNOSEQ
NOCACHE;
/*
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
-- ���� �ɹ�ȣ ����
INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES(UP||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);

-- ���� ��ȣ ������ ����
CREATE SEQUENCE USERNOSEQ
NOCACHE;



--�� ȸ�� ���̺�(USERS) �μ�Ʈ (������ȣ, �����ɹ�ȣ, ���̵�, ���, �г���, ����) 
INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES('US'||TO_CHAR(USERNOSEQ.NEXTVAL)        --������ȣ
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- ���� �ɹ�ȣ
, 'doolahyeon@gmail.com'                     -- ���̵�(�̸���)
, CRYPTPACK.ENCRYPT('user0001','user0001')    -- ��й�ȣ(��ȣȭ)
, '�ζ���'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --������ȣ
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- ���� �ɹ�ȣ
, 'sedahyeon@gmail.com'                     -- ���̵�(�̸���)
, CRYPTPACK.ENCRYPT('user0002','user0002')    -- ��й�ȣ(��ȣȭ)
, '������'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --������ȣ
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- ���� �ɹ�ȣ
, 'nedahyeon@gmail.com'                     -- ���̵�(�̸���)
, CRYPTPACK.ENCRYPT('user0003','user0003')    -- ��й�ȣ(��ȣȭ)
, '�״���'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url


INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --������ȣ
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- ���� �ɹ�ȣ
, 'ohahyeon@gmail.com'                     -- ���̵�(�̸���)
, CRYPTPACK.ENCRYPT('user0004','user0004')    -- ��й�ȣ(��ȣȭ)
, '������'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --������ȣ
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- ���� �ɹ�ȣ
, 'ugahyeon@gmail.com'                     -- ���̵�(�̸���)
, CRYPTPACK.ENCRYPT('user0005','user0005')    -- ��й�ȣ(��ȣȭ)
, '������'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url

--------------------------------------------------------------------------------
--�� ������ �μ�Ʈ��

-- ������ ��ȣ ������ �� ������ ����
CREATE SEQUENCE PROFILESEQ
NOCACHE;

-- ������(PROFILE) �μ�Ʈ (�����ʹ�ȣ, �����ɹ�ȣ, �����ǹ�ȣ,����������ȣ,�����)
INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 1                                                     
, 991               -- ������ü  
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 1                 -- ��⵵ ����
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 28                 -- ������ ������
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 35                 -- ��󳲵� ������
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 45                 -- ���ϵ� ���̽�
, SYSDATE);
--------------------------------------------------------------------------------
--���� ��ȣ ������
CREATE SEQUENCE RECRUITSEQ
NOCACHE;

--�� �������� �μ�Ʈ��
--(�����ȣ, �������� �ɹ�ȣ, �����Ĺ�ȣ, ����, ����, �����, ������Ʈ ������, ������Ʈ ������)

--�� 1) ���� 1 ( ������) 8/6 ���� ��� , 19�� ������ 
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END) 
VALUES('RC'||TO_CHAR(RECRUITSEQ.NEXTVAL)
        ,'�������� �ɳѹ�'
        , 1                                         
        , '�ݷ����� ���縦 ���� Ŀ�´�Ƽ'               
        , '�ݷ����� ������� ���� ������ �����ϰ� ������ �� �ִ� Ŀ�´�Ƽ�� ��ȹ�ϰ� �ֽ��ϴ�..' 
        , SYSDATE                                    
        , TO_DATE('2023-08-25', 'YYYY-MM-DD')
        , TO_DATE('2023-10-25', 'YYYY-MM-DD'));

--�� 2) ���� 2 ( �����Ϸ�) 7/23 ���� ��� , 8/5�� ���� ����, 6�� �շ�üũ ��� �Ϸ� 
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END) 
VALUES('RC'||TO_CHAR(RECRUITSEQ.NEXTVAL)
        ,'�������� �ɳѹ�'
        , 0                                         
        , '������Ʈ ��ȹ���� �Բ��Ͻ� �е��� ���մϴ�.'               
        , '������Ʈ ������ ���ų� ���� �е鵵 �������ϴ�. �� ���� �� 3������..' 
        , SYSDATE                                    
        , TO_DATE('2023-08-10', 'YYYY-MM-DD')
        , TO_DATE('2023-10-10', 'YYYY-MM-DD'));


--------------------------------------------------------------------------------
--�� ������ 1 (����1(������) �� ������ ������(�ڵ�ó��))
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0001' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , '���������ɹ�ȣ' -- ������ �� ��ȣ(=������)
        ,'����' -- ����
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')     -- ������ (���� ����Ͻÿ� ����) ������ SYSDATE�� 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD'));     -- ó���� (���� ����Ͻÿ� ����) ������ SYSDATE�� 

--�� ������ 2 (����1(������) �� �������� ������
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0002' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , '���������ɹ�ȣ' -- ������ �� ��ȣ
        ,'�ȳ��ϼ���. ������ �� ������ Ű��� �ִ� �����Դϴ�! �ݷ������μ� ������ ������..' -- ����
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')     -- ������ (���� ����Ͻÿ� ����) ������ SYSDATE�� 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD'));     -- ó���� (���� ����Ͻÿ� ����) ������ SYSDATE�� 

--�� ������ 3 (����2(���� �Ϸ�) �� ������ ������(�ڵ�ó��)
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0003' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , '���������ɹ�ȣ' -- (= ������ �ɹ�ȣ)
        ,'����' -- ����
        , TO_DATE('2023-07-23', 'YYYY-MM-DD')     -- ������ (���� ����Ͻÿ� ����) ������ SYSDATE�� 
        , TO_DATE('2023-07-23', 'YYYY-MM-DD'));    -- ó���� (���� ����Ͻÿ� ����) ������ SYSDATE�� 


--�� ������ 4 (����2(���� �Ϸ�) �� ������1 ������(�հ�, �շ� �Ϸ�)
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0004' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , '���������ɹ�ȣ' -- (= ������ �ɹ�ȣ)
        ,'������Ʈ ������ ������ ����Ʈ���忡 ������ ���� �̷����� �κ��� ���������� �����ϰ� �ֽ��ϴ�. ���� Ŭ�� �ڵ�����..' -- ����
        , TO_DATE('2023-07-24', 'YYYY-MM-DD')     -- ������  ������ SYSDATE�� 
        , TO_DATE('2023-07-24', 'YYYY-MM-DD'));    -- ó���� ������ SYSDATE�� 


--�� ������ 5 (����2(���� �Ϸ�) �� ������2 ������(�հ�, �շ� �Ϸ�)
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0005' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , '���������ɹ�ȣ' -- (= ������ �ɹ�ȣ)
        ,'������Ʈ ������ 1ȸ �ְ� �⺻���� ��� ���ַ� ������ �Խ����̾����ϴ�. �ɼ������� ������..' -- ����
        , TO_DATE('2023-07-25', 'YYYY-MM-DD')     -- ������  ������ SYSDATE�� 
        , TO_DATE('2023-07-25', 'YYYY-MM-DD'));    -- ó���� ������ SYSDATE�� 

--------------------------------------------------------------------------------

--�� ������Ʈ (���� 2�� ���� ����, �ο� 3�� )
--(������Ʈ ��ȣ, �����ȣ, ������Ʈ ������)

INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES('PJ'||TO_CHAR(PROJECTSEQ.NEXTVAL)
    , '����2�� �����ȣ'
    , TO_DATE('2023-08-06', 'YYYY-MM-DD')); -- �շ� üũ �Ϸ��� (������ SYSDATE)
    
    
--------------------------------------------------------------------------------
--==>> ������� ����, �ݿ��Ϸ�.

