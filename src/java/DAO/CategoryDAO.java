/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import beans.Category;
import database.Db_Connection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class CategoryDAO {
    public static ArrayList<Category> getListCategory()
    {
        ArrayList<Category> ds = new ArrayList<>();
           try
           {
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();
            String sql = "select * from category";
            
            Statement stm = myconnection.createStatement();
             ResultSet rs = stm.executeQuery(sql);
             
             while(rs.next())
             {
                 Category c = new Category();
                 c.setCategoryID(rs.getInt("category_id"));
                 c.setCategoryName(rs.getString("category_name"));
                 
                 ds.add(c);
             }
            
           }
           catch(Exception ex)
           {
               
           }
        
        
        
        
        return ds;
    }
}
