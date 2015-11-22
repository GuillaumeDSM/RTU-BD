
declare 
  cursor cursor_animaux1 is select * from animaux a where a.espece='lion' or a.espece='tigre' or a.espece='elephant';
  cursor cursor_animaux2 is select * from animaux a where a.espece='ours' or a.espece='moineau';
  cursor cursor_animaux3 is select * from animaux a where a.espece='poisson rouge' or a.espece='langouste' or a.espece='crabe';
  i number default 1;
  refville ref ville;
  a1 animal;
  a2 animal;
  refa3 animal;
  refa4 animal;
begin

--environements
select ref(a) into refville from villes a where a.nom='Vincennes';
for anim in cursor_animaux1 loop 
  insert into environements values (i,refville, 'savane', 25, animal(anim.nom,anim.espece,anim.poids,anim.parent));
  i:=i+1;
end loop;

for anim in cursor_animaux2 loop 
  insert into environements values (i,refville, 'foret', 14, animal(anim.nom,anim.espece,anim.poids,anim.parent));
  i:=i+1;
end loop;

select ref(a) into refville from villes a where a.nom='Blois';
for anim in cursor_animaux3 loop 
  insert into environements values (i,refville, 'eau', 15, animal(anim.nom,anim.espece,anim.poids,anim.parent));
  i:=i+1;
end loop;

end;