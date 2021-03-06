-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- USER_CATEGORY Table Create SQL
CREATE TABLE USER_CATEGORY
(
    NO         NUMBER          NOT NULL, 
    TYPE       CHAR(1)         NOT NULL, 
    CONTENT    VARCHAR2(20)    NOT NULL, 
    CONSTRAINT USER_CATEGORY_PK PRIMARY KEY (NO)
)
/



CREATE SEQUENCE USER_CATEGORY_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER USER_CATEGORY_NO_AI_TRG
BEFORE INSERT ON USER_CATEGORY 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT USER_CATEGORY_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/


-- USERS Table Create SQL
CREATE TABLE USERS
(
    NO          NUMBER          NOT NULL, 
    ID          VARCHAR2(20)    NOT NULL, 
    PASSWORD    VARCHAR2(20)    NOT NULL, 
    NAME        VARCHAR2(20)    NOT NULL, 
    TEL         VARCHAR2(13)    NOT NULL, 
    EMAIL       VARCHAR2(20)    NOT NULL, 
    BIRTHDAY    VARCHAR2(10)    NOT NULL, 
    TYPE        CHAR(1)         NOT NULL, 
    REG_DATE    DATE            NOT NULL, 
    CONSTRAINT USERS_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE USERS_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER USERS_NO_AI_TRG
BEFORE INSERT ON USERS 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT USERS_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE USERS
    ADD CONSTRAINT FK_USERS_TYPE_USER_CATEGORY_TY FOREIGN KEY (TYPE)
        REFERENCES USER_CATEGORY (TYPE)
/


-- HOUSE Table Create SQL
CREATE TABLE HOUSE
(
    NO             NUMBER            NOT NULL, 
    USER_NO        NUMBER            NOT NULL, 
    HOUSE_NAME     VARCHAR2(90)      NOT NULL, 
    ADDR           VARCHAR2(300)     NOT NULL, 
    TEL            VARCHAR2(13)      NOT NULL, 
    ROOM_CNT       NUMBER            NOT NULL, 
    BBQ            CHAR(1)           NOT NULL, 
    POOL           CHAR(1)           NOT NULL, 
    PARKING        CHAR(1)           NOT NULL, 
    SINGING        CHAR(1)           NOT NULL, 
    FOOTBALL       CHAR(1)           NOT NULL, 
    PICKUP         CHAR(1)           NOT NULL, 
    HOMEPAGE       VARCHAR2(300)     NULL, 
    HOT_START      varchar2(10)      NULL, 
    HOT_END        varchar2(10)      NULL, 
    PHOTO          VARCHAR2(50)      NULL, 
    BLIND_STATE    CHAR(1)           NOT NULL, 
    CHECKIN        VARCHAR2(20)      NOT NULL, 
    CHECKOUT       VARCHAR2(20)      NOT NULL, 
    CONTENT        VARCHAR2(4000)    NOT NULL, 
    REG_DATE       DATE              NOT NULL, 
    CONSTRAINT HOUSE_PK PRIMARY KEY (NO)
)


/
CREATE SEQUENCE HOUSE_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER HOUSE_NO_AI_TRG
BEFORE INSERT ON HOUSE 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT HOUSE_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE HOUSE
    ADD CONSTRAINT FK_HOUSE_USER_NO_USERS_NO FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/


-- ROOM Table Create SQL
CREATE TABLE ROOM
(
    NO                 NUMBER            NOT NULL, 
    HOUSE_NO           NUMBER            NOT NULL, 
    ROOM_NAME          VARCHAR2(90)      NOT NULL, 
    STYLE              VARCHAR2(90)      NULL, 
    ROOM_SIZE               VARCHAR2(30)      NULL, 
    PERSON_MIN         NUMBER            NOT NULL, 
    PERSON_MAX         NUMBER            NOT NULL, 
    H_WEEK_PRICE       NUMBER            NULL, 
    H_WEEKEND_PRICE    NUMBER            NULL, 
    N_WEEK_PRICE       NUMBER            NULL, 
    N_WEEKEND_PRICE    NUMBER            NULL, 
    OVER_PRICE         NUMBER            NULL, 
    CONTENT            VARCHAR2(4000)    NULL, 
    REG_DATE           DATE              NOT NULL, 
    CONSTRAINT ROOM_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE ROOM_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ROOM_NO_AI_TRG
BEFORE INSERT ON ROOM 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT ROOM_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE ROOM
    ADD CONSTRAINT FK_ROOM_HOUSE_NO_HOUSE_NO FOREIGN KEY (HOUSE_NO)
        REFERENCES HOUSE (NO)
/


-- HOUSE_COMMENT Table Create SQL
CREATE TABLE HOUSE_COMMENT
(
    NO             NUMBER           NOT NULL, 
    HOUSE_NO       NUMBER           NOT NULL, 
    USER_NO        NUMBER           NOT NULL, 
    CONTENT        VARCHAR2(600)    NOT NULL, 
    SCORE          NUMBER           NULL, 
    BLIND_STATE    CHAR(1)          NOT NULL, 
    REG_DATE       DATE             NOT NULL, 
    CONSTRAINT HOUSE_COMMENT_PK PRIMARY KEY (NO)
)

alter table HOUSE_COMMENT modify (REG_DATE default sysdate);
/
select * from house_comment
CREATE SEQUENCE HOUSE_COMMENT_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER HOUSE_COMMENT_NO_AI_TRG
BEFORE INSERT ON HOUSE_COMMENT 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT HOUSE_COMMENT_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE HOUSE_COMMENT
    ADD CONSTRAINT FK_HOUSE_COMMENT_USER_NO_USERS FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/

ALTER TABLE HOUSE_COMMENT
    ADD CONSTRAINT FK_HOUSE_COMMENT_HOUSE_NO_HOUS FOREIGN KEY (HOUSE_NO)
        REFERENCES HOUSE (NO)
/


-- ROOM_PHOTO Table Create SQL
CREATE TABLE ROOM_PHOTO
(
    NO         NUMBER          NOT NULL, 
    ROOM_NO    NUMBER          NOT NULL, 
    PHOTO      VARCHAR2(50)    NOT NULL, 
    CONSTRAINT ROOM_PHOTO_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE ROOM_PHOTO_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ROOM_PHOTO_NO_AI_TRG
BEFORE INSERT ON ROOM_PHOTO 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT ROOM_PHOTO_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE ROOM_PHOTO
    ADD CONSTRAINT FK_ROOM_PHOTO_ROOM_NO_ROOM_NO FOREIGN KEY (ROOM_NO)
        REFERENCES ROOM (NO)
/


-- RESERVATION Table Create SQL
CREATE TABLE RESERVATION
(
    NO             NUMBER           NOT NULL,
    HOUSE_NO		NUMBER			NOT NULL,
    ROOM_NO        NUMBER           NOT NULL, 
    USER_NO        NUMBER           NOT NULL, 
    RES_START      DATE             NOT NULL, 
    RES_END        DATE             NOT NULL, 
    PERSON_CNT     NUMBER           NOT NULL, 
    TOTAL_PRICE    NUMBER           NOT NULL, 
    CONTENT        VARCHAR2(900)    NULL, 
    REG_DATE       DATE             NOT NULL, 
    CONSTRAINT RESERVATION_PK PRIMARY KEY (NO)
)
/
drop table reservation
CREATE SEQUENCE RESERVATION_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER RESERVATION_NO_AI_TRG
BEFORE INSERT ON RESERVATION 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT RESERVATION_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE RESERVATION
    ADD CONSTRAINT FK_RESERVATION_ROOM_NO_ROOM_NO FOREIGN KEY (ROOM_NO)
        REFERENCES ROOM (NO)
/

ALTER TABLE RESERVATION
    ADD CONSTRAINT FK_RESERVATION_USER_NO_USERS_N FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/


-- HOUSE_QNA Table Create SQL
CREATE TABLE HOUSE_QNA
(
    NO            NUMBER            NOT NULL, 
    HOUSE_NO      NUMBER            NOT NULL, 
    USER_NO       NUMBER            NOT NULL, 
    QUESTION      VARCHAR2(4000)    NOT NULL, 
    ANSWER        VARCHAR2(4000)    NOT NULL, 
    OPEN_STATE    CHAR(1)           NOT NULL, 
    REG_DATE      DATE              NOT NULL, 
    CONSTRAINT HOUSE_QNA_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE HOUSE_QNA_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER HOUSE_QNA_NO_AI_TRG
BEFORE INSERT ON HOUSE_QNA 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT HOUSE_QNA_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE HOUSE_QNA
    ADD CONSTRAINT FK_HOUSE_QNA_HOUSE_NO_ROOM_NO FOREIGN KEY (HOUSE_NO)
        REFERENCES ROOM (NO)
/

ALTER TABLE HOUSE_QNA
    ADD CONSTRAINT FK_HOUSE_QNA_USER_NO_USERS_NO FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/


-- APPROVE Table Create SQL
CREATE TABLE APPROVE
(
    NO               NUMBER          NOT NULL, 
    USER_NO          NUMBER          NOT NULL, 
    APPROVE_STATE    VARCHAR2(9)     NOT NULL, 
    APPROVE_KEY      VARCHAR2(60)    NOT NULL, 
    REG_DATE         DATE            NOT NULL, 
    CONSTRAINT APPROVE_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE APPROVE_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER APPROVE_NO_AI_TRG
BEFORE INSERT ON APPROVE 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT APPROVE_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE APPROVE
    ADD CONSTRAINT FK_APPROVE_USER_NO_USERS_NO FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/


-- ZZIM Table Create SQL
CREATE TABLE ZZIM
(
    NO          NUMBER    NOT NULL, 
    HOUSE_NO    NUMBER    NOT NULL, 
    USER_NO     NUMBER    NOT NULL, 
    REG_DATE    DATE      NOT NULL, 
    CONSTRAINT ZZIM_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE ZZIM_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ZZIM_NO_AI_TRG
BEFORE INSERT ON ZZIM 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT ZZIM_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE ZZIM
    ADD CONSTRAINT FK_ZZIM_USER_NO_USERS_NO FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/

ALTER TABLE ZZIM
    ADD CONSTRAINT FK_ZZIM_HOUSE_NO_HOUSE_NO FOREIGN KEY (HOUSE_NO)
        REFERENCES HOUSE (NO)
/


-- HOUSE_BLIND Table Create SQL
CREATE TABLE HOUSE_BLIND
(
    NO          NUMBER    NOT NULL, 
    HOUSE_NO    NUMBER    NOT NULL, 
    USER_NO     NUMBER    NOT NULL, 
    REG_DATE    DATE      NOT NULL, 
    CONSTRAINT HOUSE_BLIND_PK PRIMARY KEY (NO)
)
/

CREATE SEQUENCE HOUSE_BLIND_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER HOUSE_BLIND_NO_AI_TRG
BEFORE INSERT ON HOUSE_BLIND 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT HOUSE_BLIND_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE HOUSE_BLIND
    ADD CONSTRAINT FK_HOUSE_BLIND_USER_NO_USERS_N FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/

ALTER TABLE HOUSE_BLIND
    ADD CONSTRAINT FK_HOUSE_BLIND_HOUSE_NO_HOUSE_ FOREIGN KEY (HOUSE_NO)
        REFERENCES HOUSE (NO)
/


-- COMMENT_BLIND Table Create SQL
CREATE TABLE COMMENT_BLIND
(
    NO            NUMBER    NOT NULL, 
    COMMENT_NO    NUMBER    NOT NULL, 
    USER_NO       NUMBER    NOT NULL, 
    REG_DATE      DATE      NOT NULL, 
    CONSTRAINT COMMENT_BLIND_PK PRIMARY KEY (NO)
)
/
CREATE SEQUENCE COMMENT_BLIND_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER COMMENT_BLIND_NO_AI_TRG
BEFORE INSERT ON COMMENT_BLIND 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT COMMENT_BLIND_SEQ.NEXTVAL
    INTO: NEW.NO
    FROM DUAL;
END;
/

ALTER TABLE COMMENT_BLIND
    ADD CONSTRAINT FK_COMMENT_BLIND_USER_NO_USERS FOREIGN KEY (USER_NO)
        REFERENCES USERS (NO)
/

ALTER TABLE COMMENT_BLIND
    ADD CONSTRAINT FK_COMMENT_BLIND_COMMENT_NO_HO FOREIGN KEY (COMMENT_NO)
        REFERENCES HOUSE_COMMENT (NO)
/


