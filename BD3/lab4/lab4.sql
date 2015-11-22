--1.	(First&Mandatory for everyone) Create a view containing all fields of table STUDENT together with the average grade (field AVG_GRADE) of each student. Name the view STUD_GRADES.
create or replace view STUD_GRADES as select st_id, st_name, st_surname,st_id_num, st_group, avg(g_grade) as AVG_GRADE
from students, grades 
where st_id=g_student
group by st_id, st_name, st_surname,st_id_num, st_group;

select * from STUD_GRADES;

--2.	(Easy) Find how many group mates each student has.
select st_id, st_name, st_surname, st_group, (select count(
                                       b.st_id)
                                      from students b 
                                      where a.st_id<>b.st_id and 
                                      b.st_group=a.st_group
                                      ) as Mates
from students a;

--3.	(Easy) Assign ranks to students of each group by average grade. Student having the highest average grade in each group receives rank 1, the second one receives rank 2, and so on.
select st_id, st_name, st_surname,st_id_num, st_group,avg(g_grade),rank() over (partition by st_group order by avg(g_grade) DESC ) as Rank
from students, grades 
where st_id=g_student
group by st_id, st_name, st_surname,st_id_num, st_group;

--4.	(Easy) Find the difference between each student’s average grade and the best average grade in his group.
select st_id, st_name, st_surname,st_id_num, st_group,avg(g_grade), first_value(avg(g_grade)) over (
                            partition by st_group order by avg(g_grade) DESC )-avg(g_grade) as Difference,
                            rank() over (partition by st_group order by avg(g_grade) DESC ) as Rank
from students, grades 
where st_id=g_student
group by st_id, st_name, st_surname,st_id_num, st_group;

--5.	(Medium) For each student find
  --a.	Number of students that have at least the same average grade as he/she has.
select st_id, st_name, st_surname,st_id_num, st_group,avg(g_grade), count(*) over ( 
                          order by avg(g_grade) rows unbounded preceding )-1 as other
from students a, grades b
where st_id=g_student
group by st_id, st_name, st_surname,st_id_num, st_group;

  --b.	Number of the students that have average grade higher than their average grade by at least 1 mark.
select st_id, st_name, st_surname,st_id_num, st_group,avg_grade, count(*) over ( 
                          order by avg_grade range between 1 following and unbounded following)  other
from STUD_GRADES a;

--6.	(Medium) Find which grades differ the most from the corresponding teacher’s average grade.

create or replace view TEA_GRADES as select T_ID, T_NAME, T_TITLE, avg(g_grade) as AVG_GRADE
from teachers, grades, courses
where c_id=g_course and
c_teacher=t_id
group by T_ID, T_NAME, T_FIRSTNAME, T_TITLE;
select * from tea_grades;

select unique(teachers.T_ID), teachers.T_NAME, teachers.T_TITLE,first_value(g_grade) over( partition by teachers.t_id order by (abs(g_grade)-AVG_GRADE)) as  other
from teachers , grades, courses, TEA_GRADES
where c_id=g_course and
      c_teacher=teachers.t_id and
      teachers.t_id=TEA_GRADES.t_id;

--7.	(Hard) How many days after the first exam of each student was passed were the other exams passed by him?



--8.	(Hard) Find which grades differ more than 1 mark from the highest grade of the corresponding student.

--9.	(Hard) Divide students into four groups by their average nark. The first 25% of students have to be assigned to the first group, the second ones to the second and so on. 
