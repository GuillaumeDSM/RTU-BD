create table people(
id integer,
name varchar2(30),
surname varchar2(30),
education varchar2(30),
way_of_living varchar2(30),
life_expectation integer
);



create or replace JAVA source named "People" as
import java.sql.*;
import java.io.*;
import java.lang.Math;
import oracle.jdbc.*;
public class People{
	
  private static String someWaysToDie[]={"starving","the next war","a bullet in the head from a crazy guy","a disease","the latvian mafia revenge"};
	
  public static void PeopleInsert (int id, String name, String surname, String education, String way_of_living) throws SQLException {
      String sql = "insert into PEOPLE values (?,?,?,?,?,?)";
      Connection conn = DriverManager.getConnection("jdbc:default:connection:");
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, id);
      pstmt.setString(2, name);
      pstmt.setString(3, surname);
      pstmt.setString(4, education);
      pstmt.setString(5, way_of_living);
      int lE=computeIE(education,way_of_living);
      pstmt.setInt(6, lE);
      pstmt.executeUpdate(); 
      pstmt.close(); 
  }  
  
  private static int computeIE(String education, String way_of_living){
    int iE=generateNumber(50);
    if(education.equals("None") || education.equals("")){
      iE+=30;
    }else if(education.equals("Bachelor")){
      iE+=80;
    }else if(education.equals("Master")){
      iE+=90;
    }else if(education.equals("PHD")){
      iE+=100;
    }else{
      iE+=55;
    }
    if(!way_of_living.equals("Citizen")){
      if(way_of_living.equals("Rigan")){
        iE+=10;
      }else{
        iE-=11;
      }
    }
    return iE;
  }
  
  private static int generateNumber(int a){
	    double rand = Math.random()*a;
	    int i=(int)Math.round(rand);
	    return i;
  }

  public static void PeopleForesee(String id) throws SQLException{
  String sql="select a.name, a.surname, a.education, a.way_of_living, a.life_expectation from people a where id = ?";
  try{
    Connection conn = DriverManager.getConnection("jdbc:default:connection:");
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rrset = pstmt.executeQuery();
    foresee(rrset);
    rrset.close();
    pstmt.close(); 
    }catch(Exception e){System.err.println(e.getMessage());}
  }
	  
  
  public static void PeopleSelect(String id) throws SQLException{
  String sql="select a.name, a.surname, a.education, a.way_of_living, a.life_expectation from people a where id = ?";
  try{
    Connection conn = DriverManager.getConnection("jdbc:default:connection:");
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rrset = pstmt.executeQuery();
    display(rrset);
    rrset.close();
    pstmt.close(); 
    }catch(Exception e){System.err.println(e.getMessage());}
  }
  
  private static void display(ResultSet rset) throws SQLException{
    String tmp="";
    ResultSetMetaData meta = rset.getMetaData();
    int cols = meta.getColumnCount(), rows = 0;
    for (int i = 1; i <= cols; i++){
      int size = meta.getPrecision(i);
      String label = meta.getColumnLabel(i);
      if (label.length() > size) size = label.length();
      while (label.length() < size) label += " ";
      tmp = tmp + label + "  "; 
    }
    tmp = tmp+ "\n";
    while (rset.next()) {
      rows++;
      for (int i = 1; i <= cols; i++) {
          int size = meta.getPrecision(i);
          String label = meta.getColumnLabel(i);
          String value = rset.getString(i);
          if (label.length() > size) size = label.length();
          while (value.length() < size) value += " ";
          tmp = tmp + value + "  ";  
      }
      tmp = tmp + "\n";   
    }
    if (rows == 0) tmp = "No data found!\n";
    System.out.println(tmp);
  }
  

  private static String getWayToDie(String where){
	  double rand = Math.random();
	  int foresee=(int)Math.round(rand*rand*rand*(someWaysToDie.length-1));
	  if (where.equals("Countryside")){
		  return someWaysToDie[foresee];
	  }
	  return someWaysToDie[someWaysToDie.length-1-foresee];
  }
  
  private static void foresee(ResultSet rset) throws SQLException{
    String tmp="Here is Nostrudamas the seer ... I can see your future !\n You ";
    String[][] vals=new String[6][2];
    ResultSetMetaData meta = rset.getMetaData();
    int cols = meta.getColumnCount(), rows = 0;
    while (rset.next()) {
      rows++;
      for (int i = 1; i <= cols; i++) {
          int size = meta.getPrecision(i);
          vals[i-1][0] = meta.getColumnLabel(i);
          vals[i-1][1] = rset.getString(i);
      }
    }
    tmp+=vals[0][1]+" "+vals[1][1]+" you will live a ";
    if(Integer.parseInt(vals[4][1])>60){
    	tmp+="long life of "+vals[4][1];
    }else{
    	tmp+="short life of "+vals[4][1];
    }
    if(vals[3][1].equals("Rigan")){
    	tmp+=" beautiful years.";
    }else{
    	tmp+=" years.";
    }
    tmp+=" Finally, you will die beacause of "+getWayToDie(vals[3][1])+".";
    if (rows == 0) tmp = "No data found!\n";
    System.out.println(tmp);
  }
}
;