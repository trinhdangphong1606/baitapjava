/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Phong
 */
public class Db_Connection {
    public Connection Connection()
    {
        try 
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            String techworld3g = "jdbc:mysql://localhost:3306/website";
            Connection myConnection = DriverManager.getConnection(techworld3g, "root", "Phong123@");
          
            return myConnection;
            
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
}
