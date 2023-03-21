/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Order;

/**
 *
 * @author msi
 */
public class OrderDAO extends DBContext {
    

    // Lay danh sach Orders
    public List<Order> getListOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from Orders_HE160006";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                int ProductID = rs.getInt(1);
                double UnitPrice = rs.getDouble(2);
                String AccountName = rs.getString(3);
                int Quantity = rs.getInt(4);
                int Status = rs.getInt(5);
                o = new Order(ProductID, UnitPrice, AccountName, Quantity, Status);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    // Lay danh sach nhung order chua duoc dat hang
    public List<Order> getListOrdersInshoppingCart(String AccountName) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from Orders_HE160006 where AccountName=? and Status=0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                int ProductID = rs.getInt(1);
                double UnitPrice = rs.getDouble(2);
                AccountName = rs.getString(3);
                int Quantity = rs.getInt(4);
                int Status = rs.getInt(5);
                o = new Order(ProductID, UnitPrice, AccountName, Quantity, Status);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }
    // Them Product vao gi hang
    public void insertNewOrder(String ProductID, String UnitPrice, String AccountName, String Quantiity, String Status) {
        String sql = "Insert into Orders_HE160006 values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ProductID);
            ps.setString(2, UnitPrice);
            ps.setString(3, AccountName);
            ps.setString(4, Quantiity);
            ps.setString(5, Status);

            ps.execute();
        } catch (Exception e) {
        }

    }
    
    // Lay nhung san pham da Mua
    public boolean checkProduct(int ProductID, String AccountName){
        boolean check = false;
        AccountDAO a = new AccountDAO();
        List<Order> list = getListOrders();
        for (Order order : list) {
            if(order.getAccountName().equals(AccountName) && order.getProductID() == ProductID && order.getStatus()==1){
                check = true;
                break;
            }
        }
        return check;
    }

    // Lay so luong san pham trong gio hang
    public int quantityOfProductInOrder(String AccountName) {
        String sql = "select count(*) from Orders_HE160006 where AccountName=? and Status=0";
        int QuantityOfProductInOrder = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                QuantityOfProductInOrder = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return QuantityOfProductInOrder;
    }

    // Check ton tai order trong Gio hang
    public boolean checkOrderByID(int ProductID, String AccountName, ArrayList<Order> list) {
//        List<Order> list = getListOrders();
        for (Order order : list) {
            if (order.getProductID() == ProductID && AccountName.equals(order.getAccountName())) {
                return true;
            }
        }
        return false;
    }

    // Lay Order theo AccountName cho user
    public List<Order> getListOrderByAccountNameForUser(String AccountName) {
        List<Order> list = getListOrders();
        ArrayList<Order> listOrderByAccountName = new ArrayList<>();
        int size = list.size();
        int ProductID = 0;
        int Quantity = 0;
        int Status = 0;
        double UnitPrice = 0;
        
        AccountDAO a = new AccountDAO();
        Account account = a.getAccountByAccountName(AccountName);

        int[] note = new int[size];
        for (int i = 0; i < size; i++) {
            int count = 0;
            UnitPrice = 0;
            for (int j = 0; j < size; j++) {
                if (list.get(i).getProductID() == list.get(j).getProductID()
                        && list.get(i).getAccountName().equals(list.get(j).getAccountName())
                        && note[j] == 0 && list.get(i).getStatus() == list.get(j).getStatus() && list.get(i).getStatus() == 0) {
                    count++;
                    note[j] = 1;
                    ProductID = list.get(j).getProductID();
                    UnitPrice += list.get(j).getUnitPrice();
//                    AccountName = list.get(j).getAccountName();
                    Quantity = count;
                    Status = list.get(j).getStatus();
                }
            }
            if (!checkOrderByID(ProductID, AccountName, listOrderByAccountName)) {
                if (AccountName.equals(list.get(i).getAccountName()) && ProductID!=0 && UnitPrice!=0) {
                    listOrderByAccountName.add(new Order(ProductID, UnitPrice, AccountName, Quantity, Status));
                }
            }
        }
        return listOrderByAccountName;

    }

    // Lay Order sau khi nguoi dung dat hang
    public List<Order> getListOrderByAccountNameForUserAfterPayment(String AccountName) {
        List<Order> list = getListOrders();
        ArrayList<Order> listOrderByAccountNameAfterPayment = new ArrayList<>();
        int size = list.size();
        int ProductID = 0;
        int Quantity = 0;
        int Status = 1;
        double UnitPrice = 0;

        int[] note = new int[size];
        for (int i = 0; i < size; i++) {
            int count = 0;
            UnitPrice = 0;
            for (int j = 0; j < size; j++) {
                if (list.get(i).getProductID() == list.get(j).getProductID()
                        && list.get(i).getAccountName().equals(AccountName)
                        && list.get(i).getAccountName().equals(list.get(j).getAccountName())
                        && note[j] == 0 && list.get(i).getStatus() == list.get(j).getStatus() && list.get(i).getStatus() == 1) {
                    count++;
                    note[j] = 1;
                    ProductID = list.get(j).getProductID();
                    UnitPrice += list.get(j).getUnitPrice();
//                    AccountName = list.get(j).getAccountName();
                    Quantity = count;
                    Status = list.get(j).getStatus();
                }
            }
            if (!checkOrderByID(ProductID, AccountName, listOrderByAccountNameAfterPayment)) {
                if (AccountName.equals(list.get(i).getAccountName()) && ProductID!=0) {
                    listOrderByAccountNameAfterPayment.add(new Order(ProductID, UnitPrice, AccountName, Quantity, Status));
                }
            }
        }
        return listOrderByAccountNameAfterPayment;

    }

    // Xoa Order khoi gio hang
    public void removeOrderOfShoppingCart(int ProductID, String AccountName) {
        String sql = "delete from Orders_HE160006 where ProductID=? and AccountName=? and Status=0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ProductID);
            ps.setString(2, AccountName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

            }
        } catch (Exception e) {
        }
    }

    // Them Order vao don mua sau khi nguoi fung order
    public List<Order> insertNewOrderAfterPayment(String AccountName) {
        List<Order> list = getListOrderByAccountNameForUser(AccountName);
        List<Order> listOrderAfterPayment = new ArrayList<>();
        if (!list.isEmpty()) {
            for (int i = 0; i < list.size(); i++) {
                listOrderAfterPayment.add(new Order(list.get(i).getProductID(), list.get(i).getUnitPrice(), list.get(i).getAccountName(), 0, 1));
            }
            return listOrderAfterPayment;
        }
        return null;
    }

    // Lay Order theo id cua san pham danh cho admin
    public List<Order> getListOrderByIDandNameForAdmin() {
        List<Order> list = getListOrders();
        ArrayList<Order> listOrderByID = new ArrayList<>();
        int size = list.size();
        int ProductID = 0;
        int Quantity = 0;
        int Status = 0;
        double UnitPrice = 0;
        String AccountName = null;

        int[] note = new int[size];
        for (int i = 0; i < size; i++) {
            int count = 0;
            for (int j = 0; j < size; j++) {
                if (list.get(i).getProductID() == list.get(j).getProductID()
                        && list.get(i).getAccountName().equals(list.get(j).getAccountName())
                        && note[j] == 0 && list.get(i).getStatus() == list.get(j).getStatus()) {
                    count++;
                    note[j] = 1;
                    ProductID = list.get(j).getProductID();
                    UnitPrice = list.get(j).getUnitPrice();
                    AccountName = list.get(j).getAccountName();
                    Quantity = count;
                    Status = list.get(j).getStatus();
                }
            }
            if (!checkOrderByID(ProductID, AccountName, listOrderByID)) {
                listOrderByID.add(new Order(ProductID, UnitPrice, AccountName, Quantity, Status));
            }
        }
        return listOrderByID;
    }
    

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
//        System.out.println(o.checkProduct(4, "user1"));
//        o.insertNewOrder("1", "20000", "user1", "12", "0");
        List<Order> listOrders = o.getListOrderByAccountNameForUser("user2");
//        int quantity = o.quantityOfProductInOrder("user2");
//        System.out.println(quantity);
        for (Order order : listOrders) {
            System.out.println(order.toString());
        }
    }
}
