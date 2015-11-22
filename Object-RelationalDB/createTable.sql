--row type
create table visiteurs of visiteur;
create table animaux of animal;
create table parents of animal;
create table villes of ville;

--column object type
create table environements(
id number(4) primary key,
ville ref ville,
milieu varchar(50),
temperature number(3),
habitant animal);


--collection 
create table zoos(
ville ref ville,
equipes_gardiens equipe)
nested table equipes_gardiens store as pets;

--object view
create or replace view animaux_de_la_savane of animal with object id(nom)
as
select a.*
from animaux a, environements b
where a.nom=b.habitant.nom and
b.milieu='savane';

--view of 1 to n relation
create or replace view one_ville_to_many_animaux as
select b.nom as ville_one, a.habitant.nom as animal_many
from villes b, environements a
where 
b.nom=a.ville.nom
;


--view
create or replace view panneau_de_controle as 
select v.nom as ville, e.milieu as milieu, e.habitant.nom as nom, e.habitant.espece as espece, a.profession as visiteur, value(u).nom as gardien
from villes v, visiteurs a, environements e, zoos z, table(z.equipes_gardiens) u
where a.villevisite.nom=v.nom and
e.ville.nom=v.nom and
a.lieu=e.id and
u.anim.nom=e.habitant.nom
order by v.nom
;
