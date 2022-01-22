--SYSTEMユーザーから権限付与
GRANT CREATE SEQUENCE TO usr1;

--CREATE
CREATE SEQUENCE seqTest
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 1000
  NOCYCLE;

--テストテーブル
CREATE TABLE TBLseq(
    no NUMBER(3),
    name varchar2(10),
    CONSTRAINT TBLseq PRIMARY KEY(no)
);


--PROCEDURE
CREATE OR REPLACE PROCEDURE SeqPro
IS 
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO TBLseq
        VALUES(seqTest.nextval,
               dbms_random.string('A',10));
    END LOOP
END;