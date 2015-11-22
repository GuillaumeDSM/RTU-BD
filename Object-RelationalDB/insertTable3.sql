declare
  cursor cursor_animaux1 is select * from animaux a where a.espece='lion' or a.espece='tigre' or a.espece='elephant';
  cursor cursor_animaux2 is select * from animaux a where a.espece='ours' or a.espece='moineau';
  cursor cursor_animaux3 is select * from animaux a where a.espece='poisson rouge' or a.espece='langouste' or a.espece='crabe';
  i number default 1;
  refville ref ville;
  refa1 animal;
  refa2 animal;
  refa3 animal;
  refa4 animal;
begin
--equipes and visiteurs
select ref(a) into refville from villes a where a.nom='Vincennes';
select a.habitant into refa1 from environements a where a.habitant.nom='alonzo';
select a.habitant into refa2 from environements a where a.habitant.nom='alonzi';
select a.habitant into refa3 from environements a where a.habitant.nom='gaspart';
select a.habitant into refa4 from environements a where a.habitant.nom='minette';
insert into zoos values(
refville,
equipe(gardien('paul',refa1),gardien('andre',refa2),gardien('paulette',refa4),gardien('henriette',refa3))
);

insert into visiteurs values(visiteur('boulanger',30,refville,1));
insert into visiteurs values(visiteur('tondeur',18,refville,3));
insert into visiteurs values(visiteur('retraite',75,refville,4));

select a.habitant into refa1 from environements a where a.habitant.nom='koyë';
select a.habitant into refa2 from environements a where a.habitant.nom='zouyé';
select a.habitant into refa3 from environements a where a.habitant.nom='kokoko';

select ref(a) into refville from villes a where a.nom='Blois';
insert into zoos values(
refville,
equipe(gardien('fred',refa1),gardien('jules',refa2),gardien('pauline',refa3))
);

insert into visiteurs values(visiteur('plombier',40,refville,8));
end;