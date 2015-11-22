--1.	 (Easy) How many different grades each student has received?
select g_student, count(g_grade) 
from grades
group by g_student;

--2.	 (Easy) Find all grades that have been received in first ten days of the month.
select * 
from grades
where g_date < '2010.06.11';

--3.	(Easy) Sort courses according to length of their names.
select * 
from courses
order by length(c_title);

--4.	(Medium) Find how many full months ago has each grade been received.
select floor(months_between(sysdate,g_date))
from grades;

--5.	(Medium) Find average marks of all students and round them
  --a.	Till the tenth of the grade.
  select g_student, round(avg(g_grade),1) 
  from grades
  group by g_student;
  
  --b.	To the nearest integer smaller than the average mark, for example from 7.9 to 7.
  select g_student, floor(avg(g_grade)) 
  from grades
  group by g_student;
  
  --c.	To the nearest integer grater than the average mark, for example from 7.05 to 8.
  select g_student, ceil(avg(g_grade)) 
  from grades
  group by g_student;
  
--6.	(Medium) Retrieve students together with years they started learning in RTU. Hint: first two numbers of students ID mean the year when the student started learning in RTU.
select ST_ID, '20' || substr(st_id_num,1,2) as starting_year
from students;

--7.	(Hard) Do the same as in the previous query, but sort the results according to the years students entered RTU. 
select ST_ID, '20' || substr(st_id_num,1,2) as starting_year
from students
order by starting_year;

--8.	(Hard) Calculate the average marks of each teacher and each course. Do it in the same query!
select T_ID, C_ID, avg(G_GRADE) 
from teachers, courses, grades 
where G_COURSE=C_ID and C_TEACHER=t_id group by cube(T_ID,C_ID)
having(( grouping(T_ID)=1 or grouping(C_ID)=1) and (grouping(T_ID)=0 or grouping(C_ID)=0));

--9.	(Hard) Find which teachers have the average marks that differ the most from the average mark in the whole DB?
select a.C_TEACHER, avg(b.G_GRADE)
from courses a, grades b
where b.G_COURSE=a.C_ID
group by a.C_TEACHER
having (abs(avg(b.G_GRADE)-(select avg(c.G_GRADE) 
                            from grades c)))>=(select (max(abs(avg(e.G_GRADE)-(select avg(f.G_GRADE) from grades f))))
                                                      from courses d, grades e
                                                      where e.G_COURSE=d.C_ID
                                                      group by d.C_TEACHER)
;
