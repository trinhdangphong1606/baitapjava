package beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import database.Db_Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User 
{
    private String first_name,last_name,user,pwd;
    private String email,address,country,city,phone;
        public User()

    {
        first_name="";
        last_name="";
        user="";
        pwd="";
        email="";
        address="";
        city="";
        country="";
        phone="";
    }        
 
    //----------------------------------//
    
    public String getFirst_name() 
    {
        return first_name;
    }
    
    public String getLast_name() 
    {
        return last_name;
    }

    public String getUser() 
    {
        return user;
    }

    public String getPwd() 
    {
        return pwd;
    }
    public String getAddress()
    {
        return address;
    }
    public String getCity()
    {
        return city;
    }
    public String getCountry()
    {
        return country;
    }
    public String getPhone()
    {
        return phone;
    }
    //----------------------------------//
    
    public void setFirst_name(String first_name) 
    {
        this.first_name =first_name;
    }

    public void setLast_name(String last_name) 
    {
        this.last_name =last_name;
    }

    public void setUser(String user) 
    {
        this.user=user;
    }

    public void setPwd(String pwd) 
    {
        this.pwd=pwd;
    }
    
    public void setAddress(String address) 
    {
        this.address=address;
    }
    
    public void setEmail(String email) 
    {
        this.email=email;
    }
    public void setCountry(String country) 
    {
        this.country=country;
    }
    public void setCity(String city) 
    {
        this.city=city;
    }
    public void setPhone(String phone) 
    {
        this.phone=phone;
    }
    //----------------------------------//
      
    public void RegisterUser()
    {
        try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            

            String sqlString="INSERT INTO users (first_name,last_name,username,password,email,address,country,city,phone) VALUES ('"+first_name+"','"+last_name+"','"+user+"','"+pwd+"','"+email+"','"+address+"','"+country+"','"+city+"','"+phone+"')";
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();}
        } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}  
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
    
    public boolean GetUser()
    {
            boolean check = false;
            try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();                
                String sqlString = "SELECT * FROM users WHERE username = '"+user+"'";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);

                check = rs.next();
                if (check) {
                    first_name= rs.getString("first_name");
                    last_name = rs.getString("last_name");
                    user= rs.getString("username");
                    pwd = rs.getString("password");
                }
                
                
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);} 
            return check;
    }
    //----------------------------------//
}

