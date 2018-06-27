package beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import database.Db_Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TransactionDetail 
{
    private int soluong, product_id, giaodich_id;
    public TransactionDetail()
    {
        this.product_id = 0;
        this.soluong = 0;
        this.giaodich_id = 0;
    }        

    public TransactionDetail(Product product, Transaction transaction, int quantity) {
        this.product_id = product.getProductID();
        this.giaodich_id = transaction.getTransactionId();
        this.soluong = quantity;
    }
 
    //----------------------------------//
    
    //----------------------------------//
      
    public void save()
    {
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            

            String sqlString = "INSERT INTO chitietgiaodich(product_id, soluong, giaodich_id) VALUES (?, ?, ?)";
            
            PreparedStatement myStatement = myconnection.prepareStatement(sqlString);
            
            myStatement.setInt(1, this.product_id);
            myStatement.setInt(2, this.soluong);
            myStatement.setInt(3, this.giaodich_id);
            try
            {    
                int affectedRows = myStatement.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Creating transaction detail failed, no rows affected.");
                }
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(TransactionDetail.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();}
        } catch (SQLException ex) {Logger.getLogger(TransactionDetail.class.getName()).log(Level.SEVERE, null, ex);}  
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
//            } catch (SQLException ex) {Logger.getLogger(TransactionDetail.class.getName()).log(Level.SEVERE, null, ex);} 
//            return check;
//    }
    //----------------------------------//
}

