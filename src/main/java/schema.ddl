
    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.CLASS (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.CLASS (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       CLASSID integer not null,
        STUDENTID integer not null,
        primary key (CLASSID, STUDENTID)
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        EMAIL varchar(250),
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        GENDER varchar(100),
        NAME varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.FK629VEOJBURWPYON023V4TR08K_INDEX_9 on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.FK8M5INV1D6Y0RAX77SWD393BR1_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.FKFP95LYTREVBAQKHUJQ6KGV7WF_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);
create index TESTDB.PUBLIC.FKCDBMRBKFINQ94C1CSI0AF4YRS_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint FK629VEOJBURWPYON023V4TR08K 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint FK8M5INV1D6Y0RAX77SWD393BR1 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint FKFP95LYTREVBAQKHUJQ6KGV7WF 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint FKCDBMRBKFINQ94C1CSI0AF4YRS 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);

    create table TESTDB.PUBLIC.CAR (
       PK_CAR_ID integer not null,
        BRAND varchar(100),
        MODEL varchar(100),
        primary key (PK_CAR_ID)
    );

    create table TESTDB.PUBLIC.COUNTRY (
       PK_COUNTRY_ID integer not null,
        NAME varchar(100),
        OFFICIALLANG varchar(100),
        SIZE integer,
        primary key (PK_COUNTRY_ID)
    );

    create table TESTDB.PUBLIC.ENGINEER (
       PK_ENGINEER_ID integer not null,
        FULLNAME varchar(100),
        MOBILENO varchar(11),
        FK_CAR_ID integer not null,
        primary key (PK_ENGINEER_ID)
    );

    create table TESTDB.PUBLIC.STUDENT (
       STUDENTID integer not null,
        NAME varchar(100),
        primary key (STUDENTID)
    );

    create table TESTDB.PUBLIC.STUDENT_CLASS (
       CLASSID integer not null,
        COURSE varchar(100),
        primary key (CLASSID)
    );

    create table TESTDB.PUBLIC.STUDENTCLASSRELATION (
       STUDENTID integer not null,
        CLASSID integer not null
    );

    create table TESTDB.PUBLIC.TBL_EMPLOYEES (
       ID integer not null,
        FIRST_NAME varchar(250) not null,
        LAST_NAME varchar(250) not null,
        EMAIL varchar(250),
        primary key (ID)
    );

    create table TESTDB.PUBLIC.UNREPRESENTATIVE (
       PK_UNREPRESENTATIVE_ID integer not null,
        NAME varchar(100),
        GENDER varchar(100),
        FK_COUNTRY_ID integer not null,
        primary key (PK_UNREPRESENTATIVE_ID)
    );
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9B on TESTDB.PUBLIC.ENGINEER (FK_CAR_ID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_6 on TESTDB.PUBLIC.STUDENTCLASSRELATION (STUDENTID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_67 on TESTDB.PUBLIC.STUDENTCLASSRELATION (CLASSID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_INDEX_679 unique (STUDENTID, CLASSID);
create index TESTDB.PUBLIC.CONSTRAINT_INDEX_9 on TESTDB.PUBLIC.UNREPRESENTATIVE (FK_COUNTRY_ID);

    alter table TESTDB.PUBLIC.ENGINEER 
       add constraint CONSTRAINT_9B2 
       foreign key (FK_CAR_ID) 
       references TESTDB.PUBLIC.CAR (PK_CAR_ID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_67 
       foreign key (STUDENTID) 
       references TESTDB.PUBLIC.STUDENT (STUDENTID);

    alter table TESTDB.PUBLIC.STUDENTCLASSRELATION 
       add constraint CONSTRAINT_679 
       foreign key (CLASSID) 
       references TESTDB.PUBLIC.STUDENT_CLASS (CLASSID);

    alter table TESTDB.PUBLIC.UNREPRESENTATIVE 
       add constraint CONSTRAINT_9C 
       foreign key (FK_COUNTRY_ID) 
       references TESTDB.PUBLIC.COUNTRY (PK_COUNTRY_ID);
