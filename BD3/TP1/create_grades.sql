CREATE TABLE GRADES (
G_ID NUMBER PRIMARY KEY,
G_COURSE NUMBER,
G_STUDENT NUMBER,
G_GRADE NUMBER,
G_DATE DATE,
CONSTRAINT F_K_G_C FOREIGN KEY 
(G_COURSE) REFERENCES COURSES(C_ID),
CONSTRAINT F_K_G_S FOREIGN KEY 
(G_STUDENT) REFERENCES STUDENTS(ST_ID)
)