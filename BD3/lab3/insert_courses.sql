
BEGIN
INSERT INTO COURSES (C_ID, C_TITLE, C_TEACHER, C_C_POINTS)
VALUES (SEQ_COU.NEXTVAL, 'Advanced Data Technologies',	2,4);
INSERT INTO COURSES (C_ID, C_TITLE, C_TEACHER, C_C_POINTS)
VALUES (SEQ_COU.NEXTVAL, 'Systems Theory',	3, 4);
INSERT INTO COURSES (C_ID, C_TITLE, C_TEACHER, C_C_POINTS)
VALUES (SEQ_COU.NEXTVAL, 'Knowledge Engineering',	4, 4);
INSERT INTO COURSES (C_ID, C_TITLE, C_TEACHER, C_C_POINTS)
VALUES (SEQ_COU.NEXTVAL, 'Grid Networking',	5, 2);
INSERT INTO COURSES (C_ID, C_TITLE, C_TEACHER, C_C_POINTS)
VALUES (SEQ_COU.NEXTVAL, 'AI in Business',	2, 4);
INSERT INTO COURSES (C_ID, C_TITLE, C_TEACHER, C_C_POINTS)
VALUES (SEQ_COU.NEXTVAL, 'Enterprise Architecture',	6, 2);
END;