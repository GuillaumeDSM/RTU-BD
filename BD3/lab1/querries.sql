--1 Retrieve all courses that are smaller than 4 CP.
select * from courses where C_C_POINTS<4;

--2 Retrieve names of the courses together with the names of their teachers.
select C_TITLE, T_NAME from courses, teachers where C_TEACHER=T_ID;

--3 Retrieve information needed in student’s individual plan (teacher, name of the course and grade for each course that the student has passed). Do it for any student ID number.
select ST_ID, T_NAME, C_TITLE, G_GRADE from courses, teachers, grades, students where C_TEACHER=T_ID and ST_ID=G_STUDENT and G_COURSE=C_ID;

--4 Retrieve all students and sort them according to the average grade, so that the best student is shown first.
select ST_ID, AVG(G_GRADE) from students, grades where ST_ID=G_STUDENT group by ST_ID order by AVG(G_GRADE) desc;

--5 Find all students that have passed all (6) exams and received at least 4.
select ST_ID from students, grades where ST_ID=G_STUDENT and G_GRADE>=4 group by ST_ID having count(G_ID)=6 ;

--6 Calculate the average marks of each teacher and each course. Do it in the same query!
select T_ID, C_ID, avg(G_GRADE) from teachers, courses, grades where G_COURSE=C_ID and C_TEACHER=t_id group by cube(T_ID,C_ID)
having(( grouping(T_ID)=1 or grouping(C_ID)=1) and (grouping(T_ID)=0 or grouping(C_ID)=0))
;

--7 Retrieve all students whose average mark is higher than the average mark of the student with ID “061RDB121”.
select s.ST_ID, avg(g.G_GRADE)
from students s, grades g 
where s.ST_ID=g.G_STUDENT 
group by s.ST_ID
having avg(g.G_GRADE)>(select avg(r.G_GRADE) from grades r, students t where t.ST_ID=r.G_STUDENT and t.ST_ID_NUM='061RDB121');

--8 Delete any grade from the table GRADES, by specifying student and course.
delete from grades where G_STUDENT='2' and G_COURSE='4';

--9 Change students ID number of any student.
update students set ST_ID_NUM='xxxxxxxxx' where ST_ID_NUM='051RDB131';

--10 Add one column to any table.
ALTER TABLE STUDENTS
ADD ST_FRANCAIS INTEGER;