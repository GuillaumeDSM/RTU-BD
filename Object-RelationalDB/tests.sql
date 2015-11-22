drop table zoos;
create table zoos(
ville varchar2(30),
equipes_gardiens equipe)
nested table equipes_gardiens store as gardiden;