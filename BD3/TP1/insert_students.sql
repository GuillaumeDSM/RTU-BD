BEGIN
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Janis',	'Koks',	'101RDB001',	1);
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Peteris',	'Zars',	'071RDB111',	2);
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Juris',	'Celms',	'061RDB121',	1);
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Ivars',	'Lauks',	'051RDB131',	2);
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Anna',	'Sakne',	'081RDB141',	3);
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Ivo',	'Osis',	'071RDB151',	1);
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_SURNAME, ST_ID_NUM, ST_GROUP)
VALUES (SEQ_STU.NEXTVAL, 'Ilze',	'Ose',	'071RDB161',	2);
END;