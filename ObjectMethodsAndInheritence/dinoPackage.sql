create or replace package dinoPackage as
  cris varchar2(300);
  function rugir(dino dinosaure) return varchar2;
  function nouveauRugir(anim descendant) return varchar2;
  procedure cri(espece varchar2);
  procedure nouveauCri(type varchar2);
end dinoPackage;

create or replace package body dinoPackage as 
  function rugir( dino dinosaure)return varchar2 is
    begin
      cri(dino.espece);
      return 'ATTENTION : '||  cris;
    end;
  function nouveauRugir( anim descendant)return varchar2 is
    begin
      nouveauCri(anim.type);
      return '** ATTENTION NOUVEAU RUGISSEMENT : '||  cris;
    end;
  procedure cri(espece varchar2) is
    begin
      if espece='triceratops' or espece='triceratops anorexique' or espece='stegosaure' or espece='yguanodon' then cris:= 'brraaaaaaaaaaaaaaaa';
        elsif espece='tyranosaure' or espece='alosaure' then cris:= 'cryyyyyייייייייייייייייייייייייייי';
        elsif espece='liopleurodon' or espece='megalodon' then cris:= '........ bloup ........... bloup ..... aaaaaaaaaaaaaaaaa ....';
        elsif espece='lezard' then cris:= 'gnnיייייייייי';
        else cris:= 'cuicui ?!';
      end if;
    end;
  procedure nouveauCri(type varchar2) is
    begin
      if type='maritime' then cris:= '... bloup ... plouf .... bloupbloup ...... .....';
        elsif type='terrestre' then cris:= 'sssssssssshhsssssssssssssss';
        elsif type='maritimezoui' then cris:= 'STAAAAAAAAN';
        else cris:= 'cuicui !!!!';
      end if;
    end;
end dinoPackage;