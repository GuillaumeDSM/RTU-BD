create or replace JAVA source named "hello" as
  public class hello {
    public static String hi(){
      return "Hello World";
    }
  }
;

create table firmas(
F_NUM integer,
F_NOS varchar2(30),
DIB_DAT varchar2(30)
);

create or replace JAVA source named "Firma" as
  import java.sql.*;
  import java.io.*;
  import oracle.jdbc.*;
  public class Firma{
    public static void FirmaInsert (int f_num, String f_nos, String dib_dat) throws SQLException {
      String sql = "insert into FIRMAS values (?,?,?)";
      try {
        Connection conn = 
        DriverManager.getConnection("jdbc:default:connection:");
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, f_num);
        pstmt.setString(2, f_nos);
        pstmt.setString(3, dib_dat);
        pstmt.executeUpdate(); 
        pstmt.close(); 
      } 
      catch (SQLException e) {
        System.err.println(e.getMessage());
      }  
    }  
  };


