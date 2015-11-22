--1 Retrieve list of students in the form of one field that contains both name and surname in the form “SURNAME, Name”.
select st_surname as SURNAME, st_name as Name from students;

--2 Find all curses whose names contain word “Data”.
select * from courses where C_title like '%Data%';

--3 Retrieve all students that have average mark above 8.
select st_id from students, grades where st_id=g_student group by st_id having avg(g_grade)>8;

--4 Retrieve all students that have at least one grade below 4.
select st_id from students, grades where st_id=g_student group by st_id having min(g_grade)<4;

--5 Add a constraint specifying that the grade must be between 1 and 10.
alter table grades drop constraint g_grade;
alter table grades add constraint g_grade CHECK ((g_grade >= 1) and (g_grade < 11)) ;

--6 Drop one table.
drop table grades;