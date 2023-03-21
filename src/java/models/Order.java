/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author msi
 */
public class Order {
    private int ProductID;
    private double UnitPrice;
    private String AccountName;
    private int Quantity;
    private int Status;

    public Order() {
    }

    public Order(int ProductID, double UnitPrice, String AccountName, int Quantity, int Status) {
        this.ProductID = ProductID;
        this.UnitPrice = UnitPrice;
        this.AccountName = AccountName;
        this.Quantity = Quantity;
        this.Status = Status;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public String getAccountName() {
        return AccountName;
    }

    public void setAccountName(String AccountName) {
        this.AccountName = AccountName;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Order{" + "ProductID=" + ProductID + ", UnitPrice=" + UnitPrice + ", AccountName=" + AccountName + ", Quantity=" + Quantity + ", Status=" + Status + '}';
    }
    
}
