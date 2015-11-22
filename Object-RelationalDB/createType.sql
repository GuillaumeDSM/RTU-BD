create or replace type animal as object(
nom varchar2(30),
espece varchar2(30),
poids number(5,1),
parent ref animal);



