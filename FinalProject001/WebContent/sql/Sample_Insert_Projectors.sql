SELECT USER
FROM DUAL;
--==>> PROJECTORS

------------------------------------------------------------ �� ������ ������ Ȯ��
SELECT SEQUENCE_NAME, LAST_NUMBER
FROM USER_SEQUENCES;
/*  2023.08.09 10�� 30�� ����
ADMINNOSEQ	3
ADMINNOTICENOSEQ	3
APPLYNOSEQ	21
FAQNOSEQ	5
FINALNOSEQ	8
FIRSTCKSEQ	8
LOGINRECSEQ	2
LOGOUTRECSEQ	1
PROFILENOSEQ	21
PROJECTNOSEQ	3
QUESTIONNOSEQ	13
QUITADMINNOSEQ	1
RECRUITDELSEQ	1
RECRUITNOSEQ	10
RECRUITPOSSEQ	24
RECRUITRESULTNOSEQ	2
REPRECNOSEQ	3
RTOOLNOSEQ	26
USERNOSEQ	25
USERPINSEQ	29
UTOOLNOSEQ	36
WDUSERNOSEQ	21
*/
------------------------------------------------------------ �� ������ ����
--�� ���� �ɹ�ȣ(������ȣ)
CREATE SEQUENCE USERPINSEQ
NOCACHE;

--�� ȸ����ȣ
CREATE SEQUENCE USERNOSEQ
NOCACHE;

--�� Ż���� ȸ����ȣ
CREATE SEQUENCE WDUSERNOSEQ;
NOCACHE;

--�� �����ʹ�ȣ
CREATE SEQUENCE PROFILENOSEQ
NOCACHE;

--�� ���� ����� ��ȣ (������ ����)
CREATE SEQUENCE UTOOLNOSEQ
NOCACHE;

--�� ���������ȣ
CREATE SEQUENCE RECRUITNOSEQ
NOCACHE;

--�� �������� ������ ��ȣ
CREATE SEQUENCE RECRUITPOSSEQ
NOCACHE;

--�� �������� ��뵵�� ��ȣ
CREATE SEQUENCE RTOOLNOSEQ
NOCACHE;

--�� ������ �������� ��ȣ
CREATE SEQUENCE RECRUITDELSEQ
NOCACHE;

--��  ������ ��ȣ
CREATE SEQUENCE APPLYNOSEQ
NOCACHE;

--�� 1�� �շ��� ��ȣ
CREATE SEQUENCE FIRSTCKSEQ
NOCACHE;

--�� ���� �շ��� ��ȣ
CREATE SEQUENCE FINALNOSEQ
NOCACHE;

--�� ������Ʈ ��ȣ(�������̽�)
CREATE SEQUENCE PROJECTNOSEQ
NOCACHE;

--�� �����ڹ�ȣ
CREATE SEQUENCE ADMINNOSEQ
NOCACHE;

--�� �׸��� ������ ��ȣ
CREATE SEQUENCE QUITADMINNOSEQ
NOCACHE;

--�� ������ ������ ��ȣ
CREATE SEQUENCE ADMINNOTICENOSEQ
NOCACHE;

--�� �α��� �α� ��ȣ
CREATE SEQUENCE LOGINRECSEQ
NOCACHE;

--�� �α׾ƿ� �α� ��ȣ
CREATE SEQUENCE LOGOUTRECSEQ
NOCACHE;

--�� 
CREATE SEQUENCE REPRECNOSEQ
NOCACHE;

--�� 
CREATE SEQUENCE RECRUITRESULTNOSEQ
NOCACHE;

--�� 
CREATE SEQUENCE FAQNOSEQ
NOCACHE;

--�� 
CREATE SEQUENCE QUESTIONNOSEQ
NOCACHE;





COMMIT;

--==================================================================

/*
������             �� AD||SEQ
ȸ���ĺ���ȣ       �� UP||SEQ
����               �� US||SEQ
������             �� PF||SEQ
���� ��� ����      �� UT||SEQ
����               �� NT||SEQ
����               �� RC||SEQ
������             �� AP||SEQ
������Ʈ           �� PJ||SEQ
���� ������ ��ȣ    �� RP||SEQ
1�� �շ� ��ȣ       �� FS||SEQ
���� �շ� ��ȣ      �� FN||SEQ
*/
------------------------------------------------------------ �� �⺻ ȯ�� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';


------------------------------------------------------------ �� ��ȣ ���� ��Ģ
/*
������             �� AD||SEQ
ȸ���ĺ���ȣ       �� UP||SEQ
����               �� US||SEQ
������             �� PF||SEQ
���� ��� ����      �� UT||SEQ
����               �� NT||SEQ
����               �� RC||SEQ
������             �� AP||SEQ
������Ʈ           �� PJ||SEQ
���� ������ ��ȣ    �� RP||SEQ
1�� �շ� ��ȣ       �� FS||SEQ
���� �շ� ��ȣ      �� FN||SEQ
*/


------------------------------------------------------------ �� �Ѿ��� ���õ����� ����
-- ���� �ɹ�ȣ ����
INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
-- ���� ��ȣ ������ ����
CREATE SEQUENCE USERNOSEQ
NOCACHE;



--�� ȸ�� ���̺�(USERS) �μ�Ʈ (������ȣ, �����ɹ�ȣ, ���̵�, ���, �г���, ����) 

INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM USER_PIN;
--==>>UP1	2023-08-06 17:57:18

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES
('US'||TO_CHAR(USERNOSEQ.NEXTVAL)        --������ȣ
,(SELECT PIN_NO FROM USER_PIN WHERE PIN_NO='UP1')          -- ���� �ɹ�ȣ
, 'doolahyeon@gmail.com'  -- ���̵�(�̸���)
, 'user0001' -- ��й�ȣ(��ȣȭ)
, '�ζ���'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url

--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM USER_PIN;
--==>>UP1	2023-08-06 17:57:18

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES
('US'||TO_CHAR(USERNOSEQ.NEXTVAL)       --������ȣ
,(SELECT PIN_NO FROM USER_PIN WHERE PIN_NO='UP2')           -- ���� �ɹ�ȣ
, 'sedahyeon@gmail.com'                     -- ���̵�(�̸���)
, 'user0002'    -- ��й�ȣ(��ȣȭ)
, '������'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM USER_PIN;
--==>>UP3	2023-08-06 17:57:18


INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES
('US'||TO_CHAR(USERNOSEQ.NEXTVAL)          --������ȣ
,(SELECT PIN_NO FROM USER_PIN WHERE PIN_NO='UP3')          -- ���� �ɹ�ȣ
, 'nedahyeon@gmail.com'                     -- ���̵�(�̸���)
, 'user0003'    -- ��й�ȣ(��ȣȭ)
, '�״���'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url


SELECT *
FROM USERS;
/*
US1	UP1	doolahyeon@gmail.com	user0001	�ζ���	images/defaultPhoto.jpg
US2	UP2	sedahyeon@gmail.com	user0002	������	images/defaultPhoto.jpg
US3	UP3	nedahyeon@gmail.com	user0003	�״���	images/defaultPhoto.jpg
*/

INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM USER_PIN;
--==>UP4	2023-08-06 18:29:33

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES
('US'||TO_CHAR(USERNOSEQ.NEXTVAL)          --������ȣ
,(SELECT PIN_NO FROM USER_PIN WHERE PIN_NO='UP4')         -- ���� �ɹ�ȣ
, 'ohahyeon@gmail.com'                     -- ���̵�(�̸���)
,'user0004'    -- ��й�ȣ(��ȣȭ)
, '������'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM USERS;
/*
US1	UP1	doolahyeon@gmail.com	user0001	�ζ���	images/defaultPhoto.jpg
US2	UP2	sedahyeon@gmail.com	user0002	������	images/defaultPhoto.jpg
US3	UP3	nedahyeon@gmail.com	user0003	�״���	images/defaultPhoto.jpg
US4	UP4	ohahyeon@gmail.com	user0004	������	images/defaultPhoto.jpg
*/

INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM USER_PIN;
--==>UP5	2023-08-06 18:32:44


INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES
('US'||TO_CHAR(USERNOSEQ.NEXTVAL)          --������ȣ
,(SELECT PIN_NO FROM USER_PIN WHERE PIN_NO='UP5')           -- ���� �ɹ�ȣ
, 'ugahyeon@gmail.com'                     -- ���̵�(�̸���)
, 'user0005'    -- ��й�ȣ(��ȣȭ)
, '������'                                  -- �г���
, 'images/defaultPhoto.jpg');                -- �����ʻ��� url


SELECT *
FROM USERS;
/*
US1	UP1	doolahyeon@gmail.com	user0001	�ζ���	images/defaultPhoto.jpg
US2	UP2	sedahyeon@gmail.com	user0002	������	images/defaultPhoto.jpg
US3	UP3	nedahyeon@gmail.com	user0003	�״���	images/defaultPhoto.jpg
US4	UP4	ohahyeon@gmail.com	user0004	������	images/defaultPhoto.jpg
US5	UP5	ugahyeon@gmail.com	user0005	������	images/defaultPhoto.jpg
*/
--==============================================================================
--------------------------------------------------------------------------------
--�� ������ �μ�Ʈ��


-- ������(PROFILE) �μ�Ʈ (�����ʹ�ȣ, �����ɹ�ȣ, �����ǹ�ȣ,����������ȣ,�����)
INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES
('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
,'UP1'
, 1                                                     
, 991               -- ������ü  
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM PROFILE;
--==>> PF1	UP1	1	991	2023-08-06 18:39:57


INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES
('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
,'UP2'
, 2                                                       
, 1                 -- ��⵵ ����
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM PROFILE;
--==>> PF2	UP2	2	1	2023-08-06 18:41:07

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES
('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
,'UP3'
, 2                                                       
, 28                 -- ������ ������
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM PROFILE;
--==>> PF3	UP3	2	28	2023-08-06 18:41:52



INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES
('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
,'UP4'
, 2                                                       
, 35                 -- ��󳲵� ������
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.




INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES
('PF5'
,'UP5'
, 2                                                       
, 45                 -- ���ϵ� ���̽�
, SYSDATE);
--==>> �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM PROFILE;
/*
PF1	UP1	1	991	2023-08-06 18:39:57
PF2	UP2	2	1	2023-08-06 18:41:07
PF3	UP3	2	28	2023-08-06 18:41:52
PF4	UP4	2	35	2023-08-06 18:42:48
PF5	UP5	2	45	2023-08-06 18:45:49
*/

--==============================================================================
--------------------------------------------------------------------------------

--�� �������� �μ�Ʈ��
--(�����ȣ, �������� �ɹ�ȣ, �����Ĺ�ȣ, ����, ����, �����, ������Ʈ ������, ������Ʈ ������)

--�� 1) ���� 1 ( ������) 8/6 ���� ��� , 19�� ������ 
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END) 
VALUES('RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL)
        ,'UP1'
        , 1                                         
        , '�ݷ����� ���縦 ���� Ŀ�´�Ƽ'               
        , '�ݷ����� ������� ���� ������ �����ϰ� ������ �� �ִ� Ŀ�´�Ƽ�� ��ȹ�ϰ� �ֽ��ϴ�..' 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')                                    
        , TO_DATE('2023-08-25', 'YYYY-MM-DD')
        , TO_DATE('2023-10-25', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� 2) ���� 2 ( �����Ϸ�) 7/23 ���� ��� , 8/5�� ���� ����, 6�� �շ�üũ ��� �Ϸ� 
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END) 
VALUES('RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL)
        ,'UP2'
        , 0                                         
        , '������Ʈ ��ȹ���� �Բ��Ͻ� �е��� ���մϴ�.'               
        , '������Ʈ ������ ���ų� ���� �е鵵 �������ϴ�. �� ���� �� 3������..' 
        , TO_DATE('2023-07-23', 'YYYY-MM-DD')                                    
        , TO_DATE('2023-08-10', 'YYYY-MM-DD')
        , TO_DATE('2023-10-10', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--------------------------------------------------------------------------------
--�� ������ 1 (����1(������) �� ������ ������(�ڵ�ó��))
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 


-- ���� ������ ��ȣ
DESC RECRUIT_POS ;
/*
RECRUIT_POS_NO NOT NULL VARCHAR2(20) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
POS_NO         NOT NULL NUMBER(2)   
*/

SELECT * FROM RECRUIT;

--1
INSERT INTO RECRUIT_POS
(RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
,'RC1'
,1);
--2
INSERT INTO RECRUIT_POS
(RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
,'RC1'
,2);
--3
INSERT INTO RECRUIT_POS
(RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
,'RC2'
,1);
--4
INSERT INTO RECRUIT_POS
(RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
,'RC2'
,2);
--5
INSERT INTO RECRUIT_POS
(RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
,'RC2'
,2);
--===>> 1 �� ��(��) ���ԵǾ����ϴ�. *5
SELECT * FROM RECRUIT_POS;
/*
RP1	RC1	1
RP2	RC1	2
RP3	RC2	1
RP4	RC2	2
RP5	RC2	2
*/

--===============================================================================
SELECT * FROM RECRUIT;

SELECT *
FROM RECRUIT;



INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
        , 'RP1' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , 'UP1' -- ������ �� ��ȣ(=������)
        ,'����' -- ����
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')     -- ������ (���� ����Ͻÿ� ����) ������ SYSDATE�� 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD'));     -- ó���� (���� ����Ͻÿ� ����) ������ SYSDATE�� 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



--�� ������ 2 (����1(������) �� �������� ������
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
        , 'RP2' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , 'UP3' -- ������ �� ��ȣ
        ,'�ȳ��ϼ���. ������ �� ������ Ű��� �ִ� �����Դϴ�! �ݷ������μ� ������ ������..' -- ����
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')     -- ������ (���� ����Ͻÿ� ����) ������ SYSDATE�� 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD'));     -- ó���� (���� ����Ͻÿ� ����) ������ SYSDATE�� 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� ������ 3 (����2(���� �Ϸ�) �� ������ ������(�ڵ�ó��)
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 
SELECT * FROM RECRUIT_POS;
/*
RP1	RC1	1
RP2	RC1	2
RP3	RC2	1
RP4	RC2	2
RP5	RC2	2
*/
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
        , 'RP3' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , 'UP2' -- (= ������ �ɹ�ȣ)
        ,'����' -- ����
        , TO_DATE('2023-07-23', 'YYYY-MM-DD')     -- ������ (���� ����Ͻÿ� ����) ������ SYSDATE�� 
        , TO_DATE('2023-07-23', 'YYYY-MM-DD'));    -- ó���� (���� ����Ͻÿ� ����) ������ SYSDATE�� 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ������ 4 (����2(���� �Ϸ�) �� ������1 ������(�հ�, �շ� �Ϸ�)
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
        , 'RP4' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , 'UP4' -- (= ������ �ɹ�ȣ)
        ,'������Ʈ ������ ������ ����Ʈ���忡 ������ ���� �̷����� �κ��� ���������� �����ϰ� �ֽ��ϴ�. ���� Ŭ�� �ڵ�����..' -- ����
        , TO_DATE('2023-07-24', 'YYYY-MM-DD')     -- ������  ������ SYSDATE�� 
        , TO_DATE('2023-07-24', 'YYYY-MM-DD'));    -- ó���� ������ SYSDATE�� 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ������ 5 (����2(���� �Ϸ�) �� ������2 ������(�հ�, �շ� �Ϸ�)
-- (���� ��ȣ, ������ �������� �����ǹ�ȣ, �������� �ɹ�ȣ, ����, ������, ó���Ͻ�(����/����) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
        , 'RP5' -- ���� (������ �������� ������ ��ȣ)(����ڰ� ������ ��)
        , 'UP5' -- (= ������ �ɹ�ȣ)
        ,'������Ʈ ������ 1ȸ �ְ� �⺻���� ��� ���ַ� ������ �Խ����̾����ϴ�. �ɼ������� ������..' -- ����
        , TO_DATE('2023-07-25', 'YYYY-MM-DD')     -- ������  ������ SYSDATE�� 
        , TO_DATE('2023-07-25', 'YYYY-MM-DD'));    -- ó���� ������ SYSDATE�� 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

SELECT * FROM APPLY;
/*
AP1	RP1	UP1	����	2023-08-06 00:00:00	2023-08-06 00:00:00
AP2	RP2	UP3	�ȳ��ϼ���. ������ �� ������ Ű��� �ִ� �����Դϴ�! �ݷ������μ� ������ ������..	2023-08-06 00:00:00	2023-08-06 00:00:00
AP3	RP3	UP2	����	2023-07-23 00:00:00	2023-07-23 00:00:00
AP4	RP4	UP4	������Ʈ ������ ������ ����Ʈ���忡 ������ ���� �̷����� �κ��� ���������� �����ϰ� �ֽ��ϴ�. ���� Ŭ�� �ڵ�����..	2023-07-24 00:00:00	2023-07-24 00:00:00
AP5	RP5	UP5	������Ʈ ������ 1ȸ �ְ� �⺻���� ��� ���ַ� ������ �Խ����̾����ϴ�. �ɼ������� ������..	2023-07-25 00:00:00	2023-07-25 00:00:00
*/

--------------------------------------------------------------------------------



--�� ������Ʈ (���� 2�� ���� ����, �ο� 3�� )
--(������Ʈ ��ȣ, �����ȣ, ������Ʈ ������)

INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES('PJ'||TO_CHAR(PROJECTNOSEQ.NEXTVAL)
    , 'RC2'
    , TO_DATE('2023-08-06', 'YYYY-MM-DD')); -- �շ� üũ �Ϸ��� (������ SYSDATE)

--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM PROJECT;
--==>> PJ1	RC2	2023-08-06 00:00:00

------------------------------------------------------------ �� ���غ� ���õ����� ����
--===============[ȸ�� ���� INSERT]
INSERT INTO USER_PIN
(PIN_NO, JOIN_DATE) 
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT * FROM USER_PIN;
SELECT * FROM USERS;

INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US'||TO_CHAR(USERNOSEQ.NEXTVAL)  
, 'UP6'
, '���󿡸�@naver.com'
, 'java002$'
, '���󿡸�'
, 'c://WebStudy');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_PIN
(PIN_NO, JOIN_DATE) 
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
, 'UP7'
, '������@naver.com'
, 'java002$'
, '������'
, 'c://WebStudy');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO USER_PIN
(PIN_NO, JOIN_DATE) 
VALUES
( 'UP'||TO_CHAR(USERPINSEQ.NEXTVAL)
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.;


INSERT INTO USERS
( USER_NO
, PIN_NO
, ID
, PW
, NICKNAME
, PHOTOURL)
VALUES
( 'US'||TO_CHAR(USERNOSEQ.NEXTVAL)  
, 'UP8'
, '�����@naver.com'
, 'java002$'
, '�����'
, 'c://WebStudy');
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO USER_PIN
(PIN_NO, JOIN_DATE) 
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
, 'UP9'
, '������@naver.com'
, 'java002$'
, '������'
, 'c://WebStudy');
--===>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_PIN
(PIN_NO, JOIN_DATE) 
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
, 'UP10'
, '�̽���@naver.com'
, 'java002$'
, '�̽���'
, 'c://WebStudy');
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM USERS;
/*
US6	UP6	���󿡸�@naver.com	java002$	���󿡸�	c://WebStudy
US7	UP7	������@naver.com	java002$	������	c://WebStudy
US8	UP8	�����@naver.com	java002$	�����	c://WebStudy
US9	UP9	������@naver.com	java002$	������	c://WebStudy
US10	UP10	�̽���@naver.com	java002$	�̽���	c://WebStudy
*/

--[ȸ�� ������ INSERT]====================

INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, (SELECT PIN_NO
  FROM USERS
  WHERE NICKNAME='���󿡸�')
, 1
, 16
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM PROFILE
LEFT JOIN USERS ON PROFILE.PIN_NO = USERS.PIN_NO ;

INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, (SELECT PIN_NO
  FROM USERS
  WHERE NICKNAME='������')
, 2
, 30
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, (SELECT PIN_NO
  FROM USERS
  WHERE NICKNAME='�����')
, 3
, 7
, SYSDATE);
--===>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, (SELECT PIN_NO
  FROM USERS
  WHERE NICKNAME='������')
, 4
, 12
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO PROFILE
( PROFILE_NO
, PIN_NO
, POS_NO
, SUB_REGION_NO
, PROFILE_DATE)
VALUES
( 'PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL)
, (SELECT PIN_NO
  FROM USERS
  WHERE NICKNAME='�̽���')
, 2
, 41
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM PROFILE;
/*
PF6	UP6	1	16	2023-08-06 19:32:33
PF7	UP7	2	30	2023-08-06 19:34:33
PF8	UP8	3	7	2023-08-06 19:34:56
PF9	UP9	4	12	2023-08-06 19:35:11
PF10	UP10	2	41	2023-08-06 19:35:27
*/


--[���� ��� ��� + ȯ��]===========================

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='���󿡸�'))
,1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='���󿡸�'))
,11);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'|| TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='���󿡸�'))
,21);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='������'))
,2);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='������'))
,12);
--===>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='������'))
,22);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='�����'))
,3);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='�����'))
,13);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='�����'))
,23);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='������'))
,4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='������'))
,14);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='������'))
,24);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='�̽���'))
,5);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='�̽���'))
,15);
--===>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_TOOL
( UTOOL_NO
, PROFILE_NO
, TOOL_NO)
VALUES
( 'UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL)
, (SELECT PROFILE_NO
    FROM PROFILE
    WHERE PIN_NO =(SELECT PIN_NO
                   FROM USERS
                   WHERE NICKNAME='�̽���'))
,25);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM USER_TOOL;
/*
UT1	PF6	1
UT2	PF6	11
UT3	PF6	21
UT4	PF7	2
UT5	PF7	12
UT6	PF7	22
UT7	PF8	3
UT8	PF8	13
UT9	PF8	23
UT10	PF9	4
UT11	PF9	14
UT12	PF9	24
UT13	PF10	5
UT14	PF10	15
UT15	PF10	25
*/

-- ���� ���� ����==============
--RECRUITNOSEQ.NEXTVAL

INSERT INTO RECRUIT
( RECRUIT_NO
, PIN_NO
, DO_TYPE_NO
, TITLE
, CONTENT
, CREATED_DATE
, PRJ_START
, PRJ_END)
VALUES
( 'RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL)
, (SELECT PIN_NO
   FROM USERS
   WHERE NICKNAME='���󿡸�')
, 1 
, '���� �ý��� ������Ʈ'
, '���� �ý��� ������Ʈ�� ���õ� ����'
, TO_DATE('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-08-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-09-20 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

DESC RECRUIT_POS;

-- ��� ������ ������ ����
INSERT INTO RECRUIT_POS
( RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
( 'RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
, (SELECT RECRUIT_NO
  FROM RECRUIT
  WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='���󿡸�'))
, 1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO RECRUIT_POS
( RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
( 'RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
, (SELECT RECRUIT_NO
  FROM RECRUIT
  WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='���󿡸�'))
, 2);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO RECRUIT_POS
( RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
( 'RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
, (SELECT RECRUIT_NO
  FROM RECRUIT
  WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='���󿡸�'))
, 3);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- ���� �ڵ� ���� �� 1�� �հݱ���

SELECT RP.RECRUIT_POS_NO, R.RECRUIT_NO , U.PIN_NO, U.NICKNAME
FROM RECRUIT_POS RP LEFT JOIN RECRUIT R ON RP.RECRUIT_NO = R.RECRUIT_NO
LEFT JOIN USERS U ON U.PIN_NO = R.PIN_NO; 
/*
RP2	RC1	UP1	�ζ���
RP1	RC1	UP1	�ζ���
RP5	RC2	UP2	������
RP4	RC2	UP2	������
RP3	RC2	UP2	������
RP8	RC3	UP6	���󿡸� --> ���� ������
RP7	RC3	UP6	���󿡸�
RP6	RC3	UP6	���󿡸�
*/

INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, APPLY_DATE)
VALUES
( 'AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
, 'RP8'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='���󿡸�')
, '������ �ڵ� ���� ó��'
, TO_DATE('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM APPLY;

INSERT INTO FIRST_CK
(FIRST_CK_NO
, APPLY_NO
, PASS_DATE)
VALUES
( 'FS'||FIRSTCKSEQ.NEXTVAL
, 'AP6'
, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO RECRUIT
( RECRUIT_NO
, PIN_NO
, DO_TYPE_NO
, TITLE
, CONTENT
, CREATED_DATE
, PRJ_START
, PRJ_END)
VALUES
( 'RC'||RECRUITNOSEQ.NEXTVAL
, (SELECT PIN_NO
   FROM USERS
   WHERE NICKNAME='������')
, 1 
, '�޽��� �ý��� ������Ʈ'
, '�޽��� �ý��� ������Ʈ�� ���õ� ����'
, TO_DATE('2023-07-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
, TO_DATE('2023-11-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- ���� �ڵ� ���� �� 1�� �հݱ���

SELECT * FROM RECRUIT_POS RP LEFT JOIN RECRUIT R ON RP.RECRUIT_NO = R.RECRUIT_NO 
LEFT JOIN USERS U ON R.PIN_NO = U.PIN_NO;

DESC RECRUIT_POS;

SELECT * FROM RECRUIT R LEFT JOIN USERS U ON R.PIN_NO = U.PIN_NO;

INSERT INTO RECRUIT_POS
( RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
, 'RC4'
,1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

INSERT INTO RECRUIT_POS
( RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
, 'RC4'
,2);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

INSERT INTO RECRUIT_POS
( RECRUIT_POS_NO
, RECRUIT_NO
, POS_NO)
VALUES
('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL)
, 'RC4'
,2);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

SELECT *
FROM RECRUIT_POS;
/*
RP1	RC1	1
RP2	RC1	2
RP3	RC2	1
RP4	RC2	2
RP5	RC2	2
RP6	RC3	1
RP7	RC3	2
RP8	RC3	3
RP9	RC4	1
RP10	RC4	2
RP11	RC4	2
*/

SELECT PIN_NO FROM USERS WHERE NICKNAME='������';

SELECT * FROM RECRUIT_POS;

INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, APPLY_DATE)
VALUES
( 'AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
, 'RP9'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='������')
, '���� �ڵ� ����(������)'
,  TO_DATE('2023-07-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO FIRST_CK
(FIRST_CK_NO
, APPLY_NO
, PASS_DATE)
VALUES
( 'FS'||FIRSTCKSEQ.NEXTVAL
, 'AP9'
,  TO_DATE('2023-07-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM APPLY ;

==============
-- ������ 3�ο� ���� ������ ó��

SELECT *
FROM RECRUIT_POS;

INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, APPLY_DATE)
VALUES
( 'AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
, 'RP7'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='������')
, '���󿡸� ���� ���� �������� ����'
, TO_DATE('2023-08-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>>1 �� ��(��) ���ԵǾ����ϴ�.


SELECT * FROM RECRUIT_POS;
INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, APPLY_DATE)
VALUES
( 'AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
, 'RP10'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='�����')
, '������ ���� ���� ������� ����'
, TO_DATE('2023-07-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO APPLY
( APPLY_NO
, RECRUIT_POS_NO
, PIN_NO
, CONTENT
, APPLY_DATE)
VALUES
( 'AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL)
, 'RP11'
, (SELECT PIN_NO FROM USERS WHERE NICKNAME='�̽���')
, '�������� ���� ���� �̽����� ����'
, TO_DATE('2023-07-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--== ������ �������� �ִ� ����̿� �̽��̸� 1�� �հݿ� �ø�



INSERT INTO FIRST_CK
(FIRST_CK_NO
, APPLY_NO
, PASS_DATE)
VALUES
( 'FS'||TO_CHAR(FIRSTCKSEQ.NEXTVAL)
, (SELECT APPLY_NO FROM APPLY WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='�����'))
, TO_DATE('2023-07-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--===>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO FIRST_CK
(FIRST_CK_NO
, APPLY_NO
, PASS_DATE)
VALUES
( 'FS'||FIRSTCKSEQ.NEXTVAL
, (SELECT APPLY_NO FROM APPLY WHERE PIN_NO = (SELECT PIN_NO FROM USERS WHERE NICKNAME='�̽���'))
,TO_DATE('2023-07-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM FIRST_CK;

DESC FINAL;

--== ������ ���� 1�� �հ��� ������, �����, �̽����� ���� �շ� �����ϴ� ��
INSERT INTO FINAL(FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL), 'FS2', TO_DATE('2023-07-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO FINAL(FINAL_NO, FIRST_CK_NO,FINAL_CK_DATE)
VALUES('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL),'FS3', TO_DATE('2023-07-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO FINAL(FINAL_NO, FIRST_CK_NO,FINAL_CK_DATE)
VALUES('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL),'FS4', TO_DATE('2023-07-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--===>> 1 �� ��(��) ���ԵǾ����ϴ�. *3


------------------------------------------------------------ �� ���ֿ� ���õ����� ����

INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-06-30', 'YYYY-MM-DD'));

SELECT * FROM USER_PIN;
/*
UP11	2023-06-30 00:00:00
UP12	2023-06-30 00:00:00
UP13	2023-06-30 00:00:00
UP14	2023-06-30 00:00:00
UP15	2023-06-30 00:00:00
*/

-- �߰� 2023.08.09
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-07-16', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-07-16', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-07-16', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-07-16', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||TO_CHAR(USERPINSEQ.NEXTVAL), TO_DATE('2023-07-16', 'YYYY-MM-DD'));

SELECT * FROM USER_PIN ORDER BY JOIN_DATE;
/*
UP24	2023-07-16 00:00:00
UP25	2023-07-16 00:00:00
UP26	2023-07-16 00:00:00
UP27	2023-07-16 00:00:00
UP28	2023-07-16 00:00:00
*/

----------------------------------------------------------------------------------------------------------- �� INSERT (ȸ������)
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP11', 'test999@test.com','java002' ,'��ö��', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP12', 'test998@test.com', 'java002' ,'�迵��', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP13', 'test997@test.com', 'java002' ,'��μ�', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP14', 'test996@test.com', 'java002' ,'�����', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP15', 'test995@test.com', 'java002' ,'������', 'images/defaulfPhoto.jpg');

SELECT * FROM USERS;
/*
US11	UP11	test999@test.com	java002	��ö��	images/defaulfPhoto.jpg
US12	UP12	test998@test.com	java002	�迵��	images/defaulfPhoto.jpg
US13	UP13	test997@test.com	java002	��μ�	images/defaulfPhoto.jpg
US14	UP14	test996@test.com	java002	�����	images/defaulfPhoto.jpg
US15	UP15	test995@test.com	java002	������	images/defaulfPhoto.jpg
*/


-- �߰�
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP24', 'test994@test.com','java002' ,'ȣ����', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP25', 'test993@test.com', 'java002' ,'�䳢', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP26', 'test992@test.com', 'java002' ,'�罿', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP27', 'test991@test.com', 'java002' ,'�޹���', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES ('US'||TO_CHAR(USERNOSEQ.NEXTVAL), 'UP28', 'test990@test.com', 'java002' ,'����', 'images/defaulfPhoto.jpg');

SELECT * FROM USERS;
/*
US20	UP24	test994@test.com	java002	ȣ����	images/defaulfPhoto.jpg
US21	UP25	test993@test.com	java002	�䳢	images/defaulfPhoto.jpg
US22	UP26	test992@test.com	java002	�罿	images/defaulfPhoto.jpg
US23	UP27	test991@test.com	java002	�޹���	images/defaulfPhoto.jpg
US24	UP28	test990@test.com	java002	����	images/defaulfPhoto.jpg
*/

----------------------------------------------------------------------------------------------------------- �� INSERT (�������ۼ�)
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP11', 1, 76,TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP12', 2, 15, TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP13', 5, 2, TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP14', 1, 3,TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP15', 6, 991,TO_DATE('2023-07-01', 'YYYY-MM-DD'));

SELECT * FROM PROFILE;
/*
PF11	UP11 1	76	2023-07-01 00:00:00
PF12	    UP12	 2	15	2023-07-01 00:00:00
PF13	UP13	 5	2	2023-07-01 00:00:00
PF14	UP14	 1	3	2023-07-01 00:00:00
PF15	UP15	 6	991	2023-07-01 00:00:00
*/

-- �߰�
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP24', 1, 76, TO_DATE('2023-07-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP25', 2, 15, TO_DATE('2023-07-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP26', 5, 12, TO_DATE('2023-07-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP27', 1, 13, TO_DATE('2023-07-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES ('PF'||TO_CHAR(PROFILENOSEQ.NEXTVAL), 'UP28', 6, 991,TO_DATE('2023-07-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM PROFILE;
/*
PF16	UP24	 1	76	2023-07-22 10:00:00
PF17	UP25	 2	15	2023-07-22 10:00:00
PF18	UP26	 5	12	2023-07-22 10:00:00
PF19	UP27	 1	13	2023-07-22 10:00:00
PF20    	UP28	 6	991	2023-07-22 10:00:00
*/


----------------------------------------------------------------------------------------------------------- �� INSERT (������ ���� ��뵵�� �߰�)
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF11', 1);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF11', 5);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF12', 12);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF12', 13);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF13', 16);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF13', 19);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF14', 30);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF14', 3);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF15', 6);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF15', 18);


INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF16', 5);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF16', 15);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF17', 7);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF17', 17);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF18', 16);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF18', 18);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF19', 21);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF19', 24);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF20', 4);
INSERT INTO USER_TOOL (UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES ('UT'||TO_CHAR(UTOOLNOSEQ.NEXTVAL), 'PF20', 1);

SELECT * FROM USER_TOOL;
/*
UT16	PF11	1
UT17	PF11	5
UT18	PF12	    12
UT19	PF12    	13
UT20	PF13	16
UT21	PF13	19
UT22	PF14	30
UT23	PF14	3
UT24	PF15	6
UT25	PF15	18
UT26	PF16	5
UT27	PF16	15
UT28	PF17	7
UT29	PF17	17
UT30	PF18	16
UT31	PF18	18
UT32	PF19	21
UT33	PF19	24
UT34	PF20    	4
UT35	PF20    	1
*/

----------------------------------------------------------------------------------------------------------- �� INSERT (��������A ö��)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES ('RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL), 'UP11', 0, 'ġŲ ���� ���ø����̼�', 'ġŲ���� ���ø����̼� ������Ʈ�� ���� �Ͻ� �������� �����մϴ�.'
     , TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM RECRUIT;
--==>> RC5	UP11	0	ġŲ ���� ���ø����̼�	ġŲ���� ���ø����̼� ������Ʈ�� ���� �Ͻ� �������� �����մϴ�.

SELECT * FROM RECRUIT_POS;

INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 2);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 3);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 4);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 5);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 6);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC5', 6);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7



INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC5', 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC5', 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC5', 10);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC5', 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC5', 30);
--==>>  1 �� ��(��) ���ԵǾ����ϴ�. * 5


-------------------------------------------------- ���� �� ������ ���� (RC 1234)
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC1', 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC1', 5);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC1', 16);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC2', 13);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC2', 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC2', 19);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC3', 6);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC3', 8);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC3', 26);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC4', 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC4', 2);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC4', 9);

COMMIT;


SELECT *
FROM RECRUIT_POS;

----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ����)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES ('RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL), 'UP12', 1, '��ȭ �¼� ���� �� ����Ʈ', '��ȭ�� �¼��� �����ϴ� �ý����� ���� ����� ���� �������� �����մϴ�.'
     , TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM RECRUIT;


INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC6', 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC6', 2);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL),  'RC6', 5);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *  FROM RECRUIT_POS;
/*
RP19 	RC6	1
RP20 	RC6	2
RP21 	RC6	5
*/

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC6', 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC6', 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC6', 10);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC6', 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC6', 30);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC1', 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC1', 5);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC1', 16);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC2', 13);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC2', 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC2', 19);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC3', 6);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC3', 8);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC3', 26);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC4', 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC4', 2);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC4', 9);

COMMIT;


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ���� �μ�)
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES ('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL), 'RP21', 'UP13', '�ּ��� ���ϰڽ��ϴ�. :)', TO_DATE('2023-07-15', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ���� ����)
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES ('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL), 'RP19', 'UP14', '������ �ϰڽ��ϴ� ^^', TO_DATE('2023-07-16', 'YYYY-MM-DD'));
--==>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES ('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL), 'RP20', 'UP12', '����(�迵��) �ڵ� ����', TO_DATE('2023-07-10', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


----------------------------------------------------------------------------------------------------------- �� INSERT (��������C ����)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES ('RC'||TO_CHAR(RECRUITNOSEQ.NEXTVAL), 'UP15', 0
        , '������ ��ȣȸ ���ø����̼� ������Ʈ'
        , '������ ��ȣȸ ȸ������ �� ���� ���� ������ �ְ�ް� ���� ���� �� �ǽð� �� ������ ������ �� �ִ� ���ø����̼��� �����ϰ��� �մϴ�. �����ϰ� �ð��� ������ ������ ���̽ø� ���ڽ��ϴ�. ���� ���� ��Ź�帳�ϴ�.'
        , TO_DATE('2023-08-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
        , TO_DATE('2023-08-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
        , TO_DATE('2023-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC9', 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES ('RP'||TO_CHAR(RECRUITPOSSEQ.NEXTVAL), 'RC9', 2);


INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC9', 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC9', 6);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES ('RT'||TO_CHAR(RTOOLNOSEQ.NEXTVAL), 'RC9', 19);

----------------------------------------------------------------------------------------------------------- �� INSERT �շ� (��������C ���� ����(����) / ����)
-- ����
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES ('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL), 'RP22', 'UP15', '����(������) �ڵ� ����', TO_DATE('2023-08-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES ('AP'||TO_CHAR(APPLYNOSEQ.NEXTVAL), 'RP23', 'UP28', '�ּ��� ���ϰڽ��ϴ�!! ���� �̷��Ƶ� ü�µ� ���� �����մϴ�. ������������ ������ ���۸��ϰ� �����ϸ鼭 ��������ڽ��ϴ�. *^^*', TO_DATE('2023-08-09 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- 1��
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES ('FS'||TO_CHAR(FIRSTCKSEQ.NEXTVAL), 'AP19', TO_DATE('2023-08-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES ('FS'||TO_CHAR(FIRSTCKSEQ.NEXTVAL), 'AP20', TO_DATE('2023-08-09 10:50:00', 'YYYY-MM-DD HH24:MI:SS'));


-- ���� (�Ⱓ���� x)


------------------------------------------------------------ �� INSERT (��������B 1�� �շ�)
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES ('FS'||TO_CHAR(FIRSTCKSEQ.NEXTVAL), 'AP15', TO_DATE('2023-07-10', 'YYYY-MM-DD'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES ('FS'||TO_CHAR(FIRSTCKSEQ.NEXTVAL), 'AP13', TO_DATE('2023-07-18', 'YYYY-MM-DD'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES ('FS'||TO_CHAR(FIRSTCKSEQ.NEXTVAL), 'AP14', TO_DATE('2023-07-18', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3

SELECT * FROM FIRST_CK;
--==>>
/*
FS5	AP15	2023-07-10 00:00:00
FS6	AP13	2023-07-18 00:00:00
FS7	AP14	2023-07-18 00:00:00
*/
----------------------------------------------------------------------------------------------------------- �� INSERT (��������B �����շ�)
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES ('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL), 'FS5', TO_DATE('2023-07-24 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES ('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL), 'FS6', TO_DATE('2023-07-24 12:50:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES ('FN'||TO_CHAR(FINALNOSEQ.NEXTVAL), 'FS7', TO_DATE('2023-07-24 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3

----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ������Ʈ ����)
INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES ('PJ'||TO_CHAR(PROJECTNOSEQ.NEXTVAL), 'RC6', TO_DATE('2023-07-24 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM PROJECT;

DESC PROJECT;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
PRJ_NO     NOT NULL VARCHAR2(16) 
RECRUIT_NO NOT NULL VARCHAR2(16) 
PRJ_DATE            DATE
*/


COMMIT;
--==>> Ŀ�� �Ϸ�.

--========================================================================
--=============================����===========================================
-- �� ������ ���� INSERT ����

-- ȸ�� �ĺ���ȣ ����

SELECT * FROM USER_PIN;
-- ��

INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--==>> UP16	2023-08-06
INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES('UP'||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--==>> UP17

-- ������ ������ ����
CREATE SEQUENCE ADMINNOSEQ
NOCACHE;
--==>> Sequence ADMINNOSEQ��(��) �����Ǿ����ϴ�.

-- ������ INSERT ���� �� �� ���� �Ŀ� ��ȣ INSERT ���� �����ϱ�
-- ��
INSERT INTO ADMIN(ADMIN_NO, ADMIN_ID, ADMIN_PW, REG_DATE, PIN_NO) 
VALUES ('AD'||TO_CHAR(ADMINNOSEQ.NEXTVAL), 'admin001@gmail.com'
, 'admin001', SYSDATE, 'UP16');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--��
INSERT INTO ADMIN(ADMIN_NO, ADMIN_ID, ADMIN_PW, REG_DATE, PIN_NO) 
VALUES ('AD'||TO_CHAR(ADMINNOSEQ.NEXTVAL), 'admin002@gmail.com'
, 'admin002', SYSDATE, 'UP17');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * FROM ADMIN;
--==>>
/*
AD1	admin001@gmail.com	admin001	2023-08-06	UP16
AD2	admin002@gmail.com	admin002	2023-08-06	UP17
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.




- ���̵� �ߺ��˻縦 �� ����


CREATE OR REPLACE VIEW IDCHECK
AS
SELECT ID
FROM USERS 
UNION ALL 
SELECT ADMIN_ID AS ID
FROM ADMIN;

--==>> View IDCHECK��(��) �����Ǿ����ϴ�.
