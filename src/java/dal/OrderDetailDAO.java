/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.OrderDetail;
import models.Product;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class OrderDetailDAO extends DBContext{
    
    // Lay danh sach orderDetail
    public List<OrderDetail> getListOrderDetails(){
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from OrderDetails_HE160006";
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
            
            while(rs.next()){
                OrderDetail od = new OrderDetail();
                String AccountName = rs.getString(2);
                String CustomerName = rs.getString(3);
                String Address = rs.getString(4);
                String Phone = rs.getString(5);
                int Payments = rs.getInt(6);
                double TotalPrice = rs.getDouble(7);
                String Note = rs.getString(8);
                String Date = rs.getString(9);
                String Details = rs.getString(10);
                
                od = new OrderDetail(AccountName, CustomerName, Address, Phone, Payments, TotalPrice, Note, Date, Details);
                list.add(od);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    // Them orderdetail 
    public void insertNewOrderDetail(String AccountName, String CustomerName, String Address, String Phone, int Payments, double TotalPrice, String Note, String Date, String Details){
        String sql = "Insert into [OrderDetails_HE160006] values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.setString(2, CustomerName);
            ps.setString(3, Address);
            ps.setString(4, Phone);
            ps.setInt(5, Payments);
            ps.setDouble(6, TotalPrice);
            ps.setString(7, Note);
            ps.setString(8, Date);
            ps.setString(9, Details);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        OrderDetailDAO od = new OrderDetailDAO();
        od.insertNewOrderDetail("user2", "Trung", "Hanoi", "00000", 0, 20000, "De vo",java.time.LocalDateTime.now().toString(), "2 banh");
        List<OrderDetail> list = od.getListOrderDetails();
        for (OrderDetail orderDetail : list) {
            System.out.println(orderDetail.toString());
        }
    }
}
