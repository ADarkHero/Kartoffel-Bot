import com.mysql.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Database {
    
            public static String database = "jdbc:mysql://localhost/bot";
            public static String user = "root";
            public static String password = "";

    
    public Database() throws SQLException{
        makeConnection();
    } 

    private Connection koneksi;  

     public  Connection makeConnection() throws SQLException {
        if (koneksi == null) {
             new Driver();
            // buat koneksi
             koneksi = DriverManager.getConnection(
                       database,
                       user,
                       password);
         }
         return koneksi;
     }  

     public static void write(String Database) {
         List<String> DataBackList = new ArrayList<String>();

         Connection con = null;
        PreparedStatement pst = null;
        
         try {
             Database c = new Database();
             
            con = DriverManager.getConnection(database, user, password);

            pst = con.prepareStatement(Database);
            pst.executeUpdate();
         }
         catch (SQLException e) {
             e.printStackTrace();
             System.err.println("Connection Failure");
         }  

    }
     
     
     
     
     
     public static String[] read(String Database, String Spalte) {
           List<String> DataBackList = new ArrayList<String>();

         Connection con = null;
        PreparedStatement pst = null;

        
         try {
             Database c = new Database();
             
            con = DriverManager.getConnection(database, user, password);
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(Database);
            
            while(rs.next()){
                DataBackList.add(rs.getString(Spalte));
            }

            String[] DataBack = DataBackList.toArray(new String[DataBackList.size()]);
          return (DataBack);                

      
         }
         catch (SQLException e) {
             e.printStackTrace();
             System.err.println("Connection Failure");
         }  
         
         return null;

    }

     
     
     
}