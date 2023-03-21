/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class OrderDetail {
    private String AccountName;
    private String CustomerName;
    private String Address;
    private String Phone;
    private int Payments;
    private double TotalPrice;
    private String Note;
    private String Date;
    private String Details;

    public OrderDetail() {
    }

    public OrderDetail(String AccountName, String CustomerName, String Address, String Phone, int Payments, double TotalPrice, String Note, String Date, String Details) {
        this.AccountName = AccountName;
        this.CustomerName = CustomerName;
        this.Address = Address;
        this.Phone = Phone;
        this.Payments = Payments;
        this.TotalPrice = TotalPrice;
        this.Note = Note;
        this.Date = Date;
        this.Details = Details;
    }

    public String getDetails() {
        return Details;
    }

    public void setDetails(String Details) {
        this.Details = Details;
    }

    

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public String getAccountName() {
        return AccountName;
    }

    public void setAccountName(String AccountName) {
        this.AccountName = AccountName;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public int getPayments() {
        return Payments;
    }

    public void setPayments(int Payments) {
        this.Payments = Payments;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "AccountName=" + AccountName + ", CustomerName=" + CustomerName + ", Address=" + Address + ", Phone=" + Phone + ", Payments=" + Payments + ", TotalPrice=" + TotalPrice + ", Note=" + Note + ", Date=" + Date + ", Details=" + Details + '}';
    }

   

    
    
    
    
}
