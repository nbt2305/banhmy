/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext{
    
    public List<Product> getListProducts(){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products_HE160006";
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
            
            while(rs.next()){
                Product p = new Product();
                int ProductID = rs.getInt(1);
                String ProductName = rs.getString(2);
                int CategoryID = rs.getInt(3);
                double UnitPrice = rs.getInt(4);
                int UnitInStock = rs.getInt(5);
                int UnitOnOrder = rs.getInt(6);
                String Picture = rs.getString(7);
                
                p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    // Lay products theo categoryID
    public List<Product> getListProductByCategoryID(int CategoryID){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products_HE160006 where CategoryID=?";
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, CategoryID);
                ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Product p = new Product();
                int ProductID = rs.getInt(1);
                String ProductName = rs.getString(2);
                CategoryID = rs.getInt(3);
                double UnitPrice = rs.getInt(4);
                int UnitInStock = rs.getInt(5);
                int UnitOnOrder = rs.getInt(6);
                String Picture = rs.getString(7);
                
                p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    // Lay product theo productID
    public Product getProductByID(int ProductID){
        String sql = "select * from Products_HE160006 where ProductID=?";
        Product p = new Product();
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, ProductID);
                ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                ProductID = rs.getInt(1);
                String ProductName = rs.getString(2);
                int CategoryID = rs.getInt(3);
                double UnitPrice = rs.getInt(4);
                int UnitInStock = rs.getInt(5);
                int UnitOnOrder = rs.getInt(6);
                String Picture = rs.getString(7);
                
                p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
            }
        } catch (Exception e) {
        }
        return p;
    }
    
//    public Product getProductByID(String ProductID){
//        String sql = "select * from Products_HE160006 where ProductID=?";
//        Product p = new Product();
//        try {
//                PreparedStatement ps = connection.prepareStatement(sql);
//                ps.setString(1, ProductID);
//                ResultSet rs = ps.executeQuery();
//            
//            while(rs.next()){
//                ProductID = rs.getString(1);
//                String ProductName = rs.getString(2);
//                int CategoryID = rs.getInt(3);
//                double UnitPrice = rs.getInt(4);
//                int UnitInStock = rs.getInt(5);
//                int UnitOnOrder = rs.getInt(6);
//                String Picture = rs.getString(7);
//                
//                p = new Product(Integer.parseInt(ProductID), ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
//            }
//        } catch (Exception e) {
//        }
//        return p;
//    }
    
    // Tim kiem product theo productName
    public List<Product> getListProductsByProductName(String search){
        String sql = "select * from Products_HE160006 where ProductName like ?";
        List<Product> list = new ArrayList<>();
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, "%"+search+"%");
                ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Product p = new Product();
                int ProductID = rs.getInt(1);
                String ProductName = rs.getString(2);
                int CategoryID = rs.getInt(3);
                double UnitPrice = rs.getInt(4);
                int UnitInStock = rs.getInt(5);
                int UnitOnOrder = rs.getInt(6);
                String Picture = rs.getString(7);
                
                p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    //Tim kiem Product cho Admin
    public List<Product> getListProductsForAdminSearch(String nameSearch, String minPrice, String maxPrice){
        String sql1 = "select * from Products_HE160006 where ProductName like ?";
        String sql2 = "select * from Products_HE160006 where ProductName like ? and UnitPrice>=?";
        String sql3 = "select * from Products_HE160006 where ProductName like ? and UnitPrice<=?";
        String sql4 = "select * from Products_HE160006 where UnitPrice>=? and UnitPrice<=?";
        String sql5 = "select * from Products_HE160006 where ProductName like ? and UnitPrice>=? and UnitPrice<=?";
        List<Product> list = new ArrayList<>();
        try {
                if((minPrice)=="")
                    (minPrice) = "-1";
                if((maxPrice)=="")
                    (maxPrice) = "-1";
                PreparedStatement ps = connection.prepareStatement(sql5);
                ps.setString(1, "%"+nameSearch+"%");
                ps.setDouble(2, Double.parseDouble(minPrice));
                ps.setDouble(3, Double.parseDouble(maxPrice));
                
                // minPrice và maxPrice khong dc nhap
                if(Double.parseDouble(minPrice)<0 && Double.parseDouble(maxPrice)<0){
                    ps = connection.prepareStatement(sql1);
                    ps.setString(1, "%"+nameSearch+"%");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Product p = new Product();
                        int ProductID = rs.getInt(1);
                        String ProductName = rs.getString(2);
                        int CategoryID = rs.getInt(3);
                        double UnitPrice = rs.getInt(4);
                        int UnitInStock = rs.getInt(5);
                        int UnitOnOrder = rs.getInt(6);
                        String Picture = rs.getString(7);
                        p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                        list.add(p);
                    }
                }
                
                // Khong nhap maxPrice
                else if(Double.parseDouble(minPrice)>0 && Double.parseDouble(maxPrice)<0){
                    ps = connection.prepareStatement(sql2);
                    ps.setString(1, "%"+nameSearch+"%");
                    ps.setDouble(2, Double.parseDouble(minPrice));
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Product p = new Product();
                        int ProductID = rs.getInt(1);
                        String ProductName = rs.getString(2);
                        int CategoryID = rs.getInt(3);
                        double UnitPrice = rs.getInt(4);
                        int UnitInStock = rs.getInt(5);
                        int UnitOnOrder = rs.getInt(6);
                        String Picture = rs.getString(7);
                         p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                        list.add(p);
                    }
                }
                
                // Khong nhap minPrice
                else if(Double.parseDouble(minPrice)<0 && Double.parseDouble(maxPrice)>0){
                    ps = connection.prepareStatement(sql3);
                    ps.setString(1, "%"+nameSearch+"%");
                    ps.setDouble(2, Double.parseDouble(maxPrice));
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Product p = new Product();
                        int ProductID = rs.getInt(1);
                        String ProductName = rs.getString(2);
                        int CategoryID = rs.getInt(3);
                        double UnitPrice = rs.getInt(4);
                        int UnitInStock = rs.getInt(5);
                        int UnitOnOrder = rs.getInt(6);
                        String Picture = rs.getString(7);
                         p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                        list.add(p);
                    }
                }
                
                // Khong nhap nameSearch
                else if(nameSearch==null){
                    ps = connection.prepareStatement(sql4);
                    ps.setDouble(1, Double.parseDouble(minPrice));
                    ps.setDouble(2, Double.parseDouble(maxPrice));
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Product p = new Product();
                        int ProductID = rs.getInt(1);
                        String ProductName = rs.getString(2);
                        int CategoryID = rs.getInt(3);
                        double UnitPrice = rs.getInt(4);
                        int UnitInStock = rs.getInt(5);
                        int UnitOnOrder = rs.getInt(6);
                        String Picture = rs.getString(7);
                         p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                        list.add(p);
                    }
                }
                
                // Nhap day du nameSearch, minPrice, maxPrice
                else{
                    ps = connection.prepareStatement(sql5);
                    ps.setString(1, "%"+nameSearch+"%");
                    ps.setDouble(2, Double.parseDouble(minPrice));
                    ps.setDouble(3, Double.parseDouble(maxPrice));
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Product p = new Product();
                        int ProductID = rs.getInt(1);
                        String ProductName = rs.getString(2);
                        int CategoryID = rs.getInt(3);
                        double UnitPrice = rs.getInt(4);
                        int UnitInStock = rs.getInt(5);
                        int UnitOnOrder = rs.getInt(6);
                        String Picture = rs.getString(7);
                         p = new Product(ProductID, ProductName, CategoryID, UnitPrice, UnitInStock, UnitOnOrder, Picture);
                        list.add(p);
                    }
                }
        } catch (Exception e) {
        }
        return list;
    }
    
    // Xoa san pham
    public void removeProductByID(int ProductID) {
        String sql = "delete from Products_HE160006 where ProductID = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ProductID);
            ps.execute();
        } catch (Exception e) {
        }
        
    }
    
    // Chinh sua thong tin san pham
    public void changeProductByID(int ProductID, String ProductName, String CategoryID, String UnitPrice, String UnitsInStock, String UnitOnOrder, String Picture) {
        String sql = "Update Products_HE160006 set ProductName=?,CategoryID=?,UnitPrice=?,UnitsInStock=?,UnitOnOrder=?,Picture=? where ProductID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ProductName);
            ps.setString(2, CategoryID);
            ps.setString(3, UnitPrice);
            ps.setString(4, UnitsInStock);
            ps.setString(5, UnitOnOrder);
            ps.setString(6, Picture);
            ps.setInt(7, ProductID);
            ps.execute();
            
        } catch (Exception e) {
        }
    }
    
    // Them product 
    public void insertNewProduct(String ProductID, String ProductName, String CategoryID, String UnitPrice, String UnitsInStock, String UnitOnOrder, String Picture){
        String sql = "Insert into Products_HE160006 values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.setString(2, ProductName);
            ps.setString(3, CategoryID);
            ps.setString(4, UnitPrice);
            ps.setString(5, UnitsInStock);
            ps.setString(6, UnitOnOrder);
            ps.setString(7, Picture);
            ps.execute();
        } catch (Exception e) {
        }

    }
    
    // Kiem tra
    public static void main(String[] args) {
        ProductDAO pD = new ProductDAO();
//        pD.insertNewProduct("13", "1", "1", "1", "", null, "123");
//        pD.changeProductByID("1", "trung", "2", "20000", "100",null,"images/product/tradao.jpg");
        List<Product> list = pD.getListProducts();
//        Product p = pD.getProductByID(2);
//        System.out.println(p);
        for (Product product : list) {
            System.out.println(product.toString());
        }
        
//        Product product = pD.getProductByID("10");
//        System.out.println(product.toString());
//        System.out.println(list.size());
//        for(int i=0; i<list.size(); i++){
//            System.out.println(list.get(i).toString());
//        }
//        for (Product product : list) {
//            System.out.println(product.toString());
//        }
    }
    
}


