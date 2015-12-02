create or replace function say_hello return varchar2 as
language java name 'hello.hi () return java.lang.String';


create or replace package people_package as

  procedure PEOPLE_INSERT(id number, name varchar2, surname varchar2, education varchar2, way_of_living varchar2);
  procedure PEOPLE_SELECT(id varchar2);
  procedure PEOPLE_FORESEE(id varchar2);
end people_package;


create or replace package body people_package as 
  procedure PEOPLE_INSERT(id number, name varchar2, surname varchar2, education varchar2, way_of_living varchar2) as  
  language  JAVA name 'People.PeopleInsert(int, java.lang.String, java.lang.String, java.lang.String, java.lang.String)';
  
  procedure PEOPLE_SELECT(id varchar2) as  
  language  JAVA name 'People.PeopleSelect(java.lang.String)';
  
  procedure PEOPLE_FORESEE(id varchar2) as  
  language  JAVA name 'People.PeopleForesee(java.lang.String)';
  
end people_package;