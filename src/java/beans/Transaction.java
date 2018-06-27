package beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import database.Db_Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Transaction 
{
    private int transaction_id;
    private String username;
    public Transaction()
    {
        this.username = "";
    }  
    
    public Transaction(String username)
    {
        this.username = username;
    }        
 
    //----------------------------------//
    
    public int getTransactionId() 
    {
        return this.transaction_id;
    }
    
    public String getUserId() 
    {
        return this.username;
    }
    //----------------------------------//
    
    public void setUserId(String username) 
    {
        this.username = username;
    }
    
    public void setTransactionId(int transaction_id) 
    {
        this.transaction_id = transaction_id;
    }
    //----------------------------------//
      
    public void createTransaction()
    {
        try
        {    
            Db_Connection dbconn = new Db_Connection();
            Connection myconnection = dbconn.Connection();
            

            String SQL_INSERT = "INSERT INTO giaodich (username) VALUES (?)";
            
            PreparedStatement myStatement = myconnection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            
            myStatement.setString(1, this.username);
            try
            {    
                int affectedRows = myStatement.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Creating transaction failed, no rows affected.");
                }
                try (ResultSet generatedKeys = myStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        this.setTransactionId(generatedKeys.getInt(1));
                    }
                    else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(Transaction.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();}
        } catch (SQLException ex) {Logger.getLogger(Transaction.class.getName()).log(Level.SEVERE, null, ex);}  
    }
    
    //----------------------------------//
    
    public static boolean LoginUser(String user,String pwd) 
    {
            boolean check =false;
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                PreparedStatement ps1 =myconnection.prepareStatement("select * from users where username=? and password=?");

                ps1.setString(1, user);
                ps1.setString(2, pwd);
                ResultSet rs1 =ps1.executeQuery();
                check = rs1.next();

                myconnection.close();        
            }catch(Exception e){e.printStackTrace();}
            
            return check;    
    }
    
    //----------------------------------//
    
//    public boolean GetUser()
//    {
//            boolean check = false;
//            try 
//            {      
//                Db_Connection dbconn=new Db_Connection();
//                Connection myconnection= dbconn.Connection();                
//                String sqlString = "SELECT * FROM users WHERE username = '"+user+"'";
//                Statement myStatement = myconnection.createStatement();
//                ResultSet rs=myStatement.executeQuery(sqlString);
//
//                check = rs.next();
//                if (check) {
//                    first_name= rs.getString("first_name");
//                    last_name = rs.getString("last_name");
//                    user= rs.getString("username");
//                    pwd = rs.getString("password");
//                }
//                
//                
//                myStatement.close();
//                myconnection.close();
//            } catch (SQLException ex) {Logger.getLogger(Transaction.class.getName()).log(Level.SEVERE, null, ex);} 
//            return check;
//    }
    //----------------------------------//
}

