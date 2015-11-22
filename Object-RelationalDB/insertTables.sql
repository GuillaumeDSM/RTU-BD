delete from environements;
delete from animaux;
delete from visiteurs;
delete from parents;
delete from villes;
delete from zoos;

--villes
insert into villes values(ville('Vincennes','France'));
insert into villes values(ville('Blois','France'));

--parents
insert into parents values(animal('alonzoTheFirst','lion','250,0',null));
insert into parents values(animal('gaspartTheFirst','ours','500,0',null));

--animaux
insert into animaux values(animal('alonzo','lion','250,0',null));
insert into animaux values(animal('alonzi','lion','250,0',null));
insert into animaux values(animal('gaspart','ours','500,0',null));
insert into animaux values(animal('koyë','poisson rouge','0,1',null));
insert into animaux values(animal('zouyé','langouste','0,4',null));
insert into animaux values(animal('gyum','moineau','0,6',null));
insert into animaux values(animal('minette','elephant','1200',null));
insert into animaux values(animal('tiger','tigre','100',null));
insert into animaux values(animal('kokoko','crabe','1',null));

--parents 2
declare
par   ref   animal;
begin

select ref(A) into par  from  parents  A  where A.nom = 'alonzoTheFirst';
update  animaux B set B.parent = par  where B.nom ='alonzo';

select ref(A) into par  from  parents  A  where A.nom = 'gaspartTheFirst';
update  animaux B set B.parent = par  where B.nom ='gaspart';

end;