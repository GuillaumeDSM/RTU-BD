drop table dinosaures;
drop type descendant;

create or replace type dinosaure as object(
nom varchar2(30),
espece varchar2(30),
poids number(10,1),
taille number(5,1),
constructor function dinosaure return self as result,
constructor function dinosaure(nom varchar2, espece varchar2) return self as result,
constructor function dinosaure(nom varchar2, espece varchar2, poids number, taille number) return self as result,
map member function grosseur return number,
member function crier return varchar2
)not final;

create or replace type body dinosaure as 
  constructor function dinosaure return self as result is
    begin
      self.nom:='gyum';
      self.espece:='yguanodon';
      self.poids:=666;
      self.taille:=2;
      return;
    end;
  constructor function dinosaure(nom varchar2, espece varchar2) return self as result is
    begin
      self.nom:=nom;
      self.espece:=espece;
      self.poids:=0;
      self.taille:=0;
      return;
    end;
  constructor function dinosaure(nom varchar2, espece varchar2, poids number, taille number) return self as result is
    begin
      self.nom:=nom;
      self.espece:=espece;
      self.poids:=poids;
      self.taille:=taille;
      return;
    end;
  map member function grosseur return number is
    begin
      return (self.poids+1)/(self.taille+1);
    end;
  member function crier return varchar2 is
    begin
      return dinoPackage.rugir(self);
    end;
end;


drop table dinosaures2;

create or replace type dinosaure2 as object(
nom varchar2(30),
espece varchar2(30),
poids number(10,1),
taille number(5,1),
constructor function dinosaure2 return self as result,
constructor function dinosaure2(nom varchar2, espece varchar2) return self as result,
constructor function dinosaure2(nom varchar2, espece varchar2, poids number, taille number) return self as result,
order member function predateur(m_obj dinosaure2) return integer
);

create or replace type body dinosaure2 as 
  constructor function dinosaure2 return self as result is
    begin
      self.nom:='gyum';
      self.espece:='yguanodon';
      self.poids:=666;
      self.taille:=2;
      return;
    end;
  constructor function dinosaure2(nom varchar2, espece varchar2) return self as result is
    begin
      self.nom:=nom;
      self.espece:=espece;
      self.poids:=0;
      self.taille:=0;
      return;
    end;
  constructor function dinosaure2(nom varchar2, espece varchar2, poids number, taille number) return self as result is
    begin
      self.nom:=nom;
      self.espece:=espece;
      self.poids:=poids;
      self.taille:=taille;
      return;
    end;
  order member function predateur(m_obj dinosaure2) return integer is
    begin
      if self.poids*self.taille > m_obj.poids*m_obj.taille then 
          sys.dbms_output.put_line(self.nom || ' mange ' || m_obj.nom || ' !!!' );
          return -1;
        elsif self.poids*self.taille < m_obj.poids*m_obj.taille then return 1;
        else return 0;
      end if;
    end predateur;
end;
