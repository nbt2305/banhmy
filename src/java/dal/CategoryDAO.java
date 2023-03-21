/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Category;
import models.Product;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends DBContext{
    public ArrayList<Category> getListCategories(){
        ArrayList<Category> list = new ArrayList<Category>();
        String sql = "select * from Categories_HE160006";
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
            
            while(rs.next()){
                Category c = new Category();
                int CategoryID = rs.getInt(1);
                String CategoryName = rs.getString(2);
                String Description = rs.getString(3);
                
                c = new Category(CategoryID, CategoryName, Description);
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Category getCategory(int CategoryID){
        String sql = "select * from Categories_HE160006 where CategoryID=?";
        Category c = new Category();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                CategoryID = rs.getInt(1);
                String CategoryName = rs.getString(2);
                String Description = rs.getString(3);
                c = new Category(CategoryID, CategoryName, Description);
            }
        } catch (Exception e) {
        }
        return c;
    }
    
    public static void main(String[] args) {
        CategoryDAO cd = new CategoryDAO();
        ArrayList<Category> list = cd.getListCategories();
        for (Category category : list) {
            System.out.println(category.toString());
        }
        Category c = cd.getCategory(2);
        System.out.println(c.toString());
    }
}
