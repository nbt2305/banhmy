/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author ADMIN
 */
public class Product {
    private int ProductID;
    private String ProductName;
    private int CategoryID;
    private double UnitPrice;
    private int UnitInStock;
    private int UnitOnOrder;
    private String Picture;

    public Product() {
    }

    public Product(int ProductID, String ProductName, int CategoryID, double UnitPrice, int UnitInStock, int UnitOnOrder, String Picture) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.CategoryID = CategoryID;
        this.UnitPrice = UnitPrice;
        this.UnitInStock = UnitInStock;
        this.UnitOnOrder = UnitOnOrder;
        this.Picture = Picture;
    }

   

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getUnitInStock() {
        return UnitInStock;
    }

    public void setUnitInStock(int UnitsInStock) {
        this.UnitInStock = UnitsInStock;
    }

    public int getUnitOnOrder() {
        return UnitOnOrder;
    }

    public void setUnitOnOrder(int UnitOnOrder) {
        this.UnitOnOrder = UnitOnOrder;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

    @Override
    public String toString() {
        return "Product{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", CategoryID=" + CategoryID + ", UnitPrice=" + UnitPrice + ", UnitInStock=" + UnitInStock + ", UnitOnOrder=" + UnitOnOrder + ", Picture=" + Picture + '}';
    }

    
    
}
