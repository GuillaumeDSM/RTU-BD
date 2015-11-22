SET SERVEROUTPUT ON;
drop table descendants;
drop table dinosaures;
create table dinosaures of dinosaure;

insert into dinosaures values(dinosaure('klouyé','triceratops anorexique'));
insert into dinosaures values(dinosaure('zouyé','tyrannosaure',5000,5));
insert into dinosaures values(dinosaure('natlya','archeopteryx',6,2));
insert into dinosaures values(dinosaure('ruslan','liopleurodon',100000,12));
insert into dinosaures values(dinosaure('francois','lezard',1,1));
insert into dinosaures values(dinosaure('holland','lezard',2,1));
insert into dinosaures values(dinosaure('putin','megalodon',50000,15));
insert into dinosaures values(dinosaure());

select value(a) from dinosaures a;
select a.* from dinosaures a;

select a.* from dinosaures a where taille > 0 order by value(a).grosseur();

drop table dinosaures2;

create table dinosaures2 of dinosaure2;

insert into dinosaures2 values(dinosaure2('klouyé','triceratops anorexique'));
insert into dinosaures2 values(dinosaure2('zouyé','tyrannosaure',5000,5));
insert into dinosaures2 values(dinosaure2('natlya','archeopteryx',6,2));
insert into dinosaures2 values(dinosaure2('ruslan','liopleurodon',100000,12));
insert into dinosaures2 values(dinosaure2('francois','lezard',1,1));
insert into dinosaures2 values(dinosaure2('holland','lezard',2,1));
insert into dinosaures2 values(dinosaure2('putin','megalodon',50000,15));
insert into dinosaures2 values(dinosaure2());

select value(a) from dinosaures2 a;

select value(a).nom, value(a).espece, value(a).predateur(c.obj) as peut_manger, c.obj.nom, c.obj.espece
from dinosaures2 a, ( select value(b) as obj
                      from dinosaures2 b where nom='natlya') c;


select value(a).nom, value(a).espece,value(a).crier() from dinosaures a;

select value(a).nom, value(a).espece,value(a).crier() from dinosaures a order by value(a).grosseur();


create table descendants of descendant;
insert into descendants values(descendant('zouyé','crocodile',50,2,'maritimezoui'));
insert into descendants values(descendant('gyum','fishkoyé','maritime'));
insert into descendants values(descendant('natlya','pigeon'));
insert into descendants values(descendant('klouyé','girafe',80,1,'terrestre'));
insert into descendants values(descendant('ruslan','moule',1,1,'maritime'));
insert into descendants values(descendant('angela','lion',150,1.5,'terrestre'));
insert into descendants values(descendant('merkel','anguille',1,3,'maritime'));
insert into descendants values(descendant('rimi','moineau',100,10,'aerien'));
insert into dinosaures values(descendant('grosRimi','dindon',40,4,'aerien'));

select a.* from descendants a ;

select value(a).nom, value(a).espece,value(a).crier() from descendants a;

select value(a).nom, value(a).espece,value(a).crier() from dinosaures a;

select value(a).nom, value(a).espece,value(a).crier(c.obj)
from descendants a, ( select value(b) as obj
                      from descendants b where nom='grosRimi') c;

select value(a).nom, value(a).espece, value(a).type,value(a).crier(c.obj)
from descendants a, ( select value(b) as obj
                      from descendants b where nom='ruslan') c;
                      
select value(a).nom, value(a).espece,value(a).crier() from dinosaures a;