package airline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conn {
    
    Connection c;
    Statement s;
    
    public conn(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJECT", "root", "Prem@2004");
            s = c.createStatement();
        } catch (SQLException e) {
            System.out.println("Connection Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
