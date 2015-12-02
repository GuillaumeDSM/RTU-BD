set serveroutput ON;
call  DBMS_JAVA.SET_OUTPUT(7000);


select  OBJECT_NAME, OBJECT_TYPE, STATUS
from  USER_OBJECTS
where CREATED >= TO_DATE('24-11-2015', 'DD-MM-YYYY');


select say_hello from dual;


delete from people;


call people_package.PEOPLE_INSERT(1, 'Jean', 'Paul','PHD', 'Rigan');
call people_package.PEOPLE_INSERT(1, 'Jean2', 'Paul','Master', 'Countryside');
call people_package.PEOPLE_INSERT(1, 'Jean3', 'Paul',' ', 'Somewhere');

select name, surname, education, way_of_living,life_expectation from people where id=1;
call people_package.PEOPLE_SELECT(1);


call people_package.PEOPLE_INSERT(1, 'Jean', 'Paul','PHD', 'Rigan');
call people_package.PEOPLE_INSERT(2, 'Salut', 'Fred','Bachelor', 'Citizen');
call people_package.PEOPLE_INSERT(3, 'Sauss', 'Isson',' ', 'Countryside');
call people_package.PEOPLE_INSERT(4, 'Bou', 'Teille','Master', 'Somewhere');
call people_package.PEOPLE_INSERT(5, 'Ger', 'Trudes','Master', 'Rigan');
call people_package.PEOPLE_INSERT(6, 'Camen', 'Bert','Bachelor', 'Countryside');
call people_package.PEOPLE_INSERT(7, 'Gou', 'Da',' ', 'Countryside');
call people_package.PEOPLE_INSERT(8, 'Emen', 'Tal',' ', 'Countryside');
select a.* from people a;


call people_package.PEOPLE_FORESEE(1);
call people_package.PEOPLE_FORESEE(2);
call people_package.PEOPLE_FORESEE(3);
call people_package.PEOPLE_FORESEE(4);
call people_package.PEOPLE_FORESEE(5);
call people_package.PEOPLE_FORESEE(6);
call people_package.PEOPLE_FORESEE(7);
call people_package.PEOPLE_FORESEE(8);