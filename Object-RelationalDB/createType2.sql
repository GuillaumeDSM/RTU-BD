create or replace type visiteur as object(
profession varchar(30),
age number(3),
villevisite ref ville,
lieu number
);