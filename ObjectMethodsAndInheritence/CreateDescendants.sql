drop table dinosaures;
drop table descendants;

create or replace type descendant under dinosaure(
type varchar2(20),
constructor function descendant(nom varchar2, espece varchar2) return self as result,
constructor function descendant(nom varchar2, espece varchar2, type varchar2) return self as result,
overriding member function crier return varchar2,
member function crier(d descendant) return varchar2
);

create or replace type body descendant as 
  member function crier(d descendant) return varchar2 is
    begin
      if self.type <> d.type then return ' .... .... .... .... ';
        elsif self.taille>d.taille then return self.nom || ' a gagné: zzbraaaaaaaaaaa ';
        elsif self.taille<d.taille then return self.nom || ' a perdu: ouiiinnnnnnnnnnn ' || d.nom || ' : mouahahahahaha !!!';
        else return ' paf paf paf paf ';
      end if;
    end;
  overriding member function crier return varchar2 is
    begin
      return dinoPackage.nouveauRugir(self);
    end;
  constructor function descendant(nom varchar2, espece varchar2) return self as result is
    begin
      self.nom:=nom;
      self.espece:=espece;
      self.poids:=0;
      self.taille:=0;
      self.type:='aerien';
      return;
    end;
  constructor function descendant(nom varchar2, espece varchar2, type varchar2) return self as result is
    begin
      self.nom:=nom;
      self.espece:=espece;
      self.poids:=0;
      self.taille:=0;
      self.type:=type;
      return;
    end;
end;