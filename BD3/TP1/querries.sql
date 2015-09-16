--1 Retrieve all courses that are smaller than 4 CP.
select * from courses where C_C_POINTS<4;

--2 Retrieve names of the courses together with the names of their teachers.
select C_TITLE, T_NAME from courses, teachers where C_TEACHER=T_ID;

--3 Retrieve information needed in student’s individual plan (teacher, name of the course and grade for each course that the student has passed). Do it for any student ID number.
select ST_ID, T_NAME, C_TITLE, G_GRADE from courses, teachers, grades, students where C_TEACHER=T_ID and ST_ID=G_STUDENT and G_COURSE=C_ID;

--4 Retrieve all students and sort them according to the average grade, so that the best student is shown first.
select ST_NAME, AVERAGE(G_GRADE) from students, grades where ST_ID=G_STUDENT group by ST_ID order by AVERAGE(G_GRADE);