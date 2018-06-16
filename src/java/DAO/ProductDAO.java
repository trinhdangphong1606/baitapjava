/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import beans.Product;
import database.Db_Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class ProductDAO {
    public static ArrayList<Product> getListProduct(int categoryID)
    {
        ArrayList<Product> ds = new ArrayList<>();
        
        
        try
        {
            Db_Connection dbcon = new Db_Connection();
            Connection conn = dbcon.Connection();
            
            String sql = "select * from product where category_id = '"+ categoryID +"'";
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next())
            {
                Product p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setCategoryID(rs.getInt("category_id"));
                p.setProductName(rs.getString("product_name"));
                p.setProductImage(rs.getString("product_image"));
                p.setProductPrice(rs.getFloat("product_price"));
                p.setProductDescription(rs.getString("product_description"));
                
                ds.add(p);
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        
        return ds;
    }
    
    
    public static ArrayList<Product> getListProductPerPage(int categoryID, int start, int total)
    {
        ArrayList<Product> ds = new ArrayList<>();
        
           try
        {
            Db_Connection dbcon = new Db_Connection();
            Connection conn = dbcon.Connection();
            
            String sql = "select * from product limit ?, ? where category_id = ?";          
          
            PreparedStatement stm = null;       
            stm = conn.prepareStatement(sql);
            stm.setInt(1, start-1);
            stm.setInt(2, total);
            stm.setInt(3, categoryID);
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next())
            {
                Product p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setCategoryID(rs.getInt("category_id"));
                p.setProductName(rs.getString("product_name"));
                p.setProductImage(rs.getString("product_image"));
                p.setProductPrice(rs.getFloat("product_price"));
                p.setProductDescription(rs.getString("product_description"));
                
                ds.add(p);
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        
        
        
        
        
        return ds;
    }
    
    
    public static Product getProductByID(int productID)
    {
        Product p = new Product();
        
        try
        {
              Db_Connection dbcon = new Db_Connection();
            Connection conn = dbcon.Connection();
            
            String sql = "select * from product where product_id = '"+ productID +"'";
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
                while(rs.next())
                {
                p.setProductID(rs.getInt("product_id"));
                p.setCategoryID(rs.getInt("category_id"));
                p.setProductName(rs.getString("product_name"));
                p.setProductImage(rs.getString("product_image"));
                p.setProductPrice(rs.getFloat("product_price"));
                p.setProductDescription(rs.getString("product_description"));
                }
               
        }
        
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        
        return p;
    }
}
