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
import models.Product;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext {

    public List<Account> getListAccounts() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Accounts_HE160006";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                String AccountName = rs.getString(1);
                String Email = rs.getString(2);
                String Password = rs.getString(3);
                int Role = rs.getInt(4);
                String Name = rs.getString(5);
                String Phone = rs.getString(6);

                a = new Account(AccountName, Email, Password, Role, Name, Phone);
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    // Lay Account theo AccountName
    public Account getAccountByAccountName(String AccountName){
        List<Account> list = getListAccounts();
        Account account = new Account();
        for(int i=0; i<list.size(); i++){
            if(AccountName.equals(list.get(i).getAccountName())){
                account = list.get(i);
            }
        }
        return account;
    }
    
    // Check tai khoan de lay lai mat khau
    public Account getAccountForgotPass(String AccountName, String Email, String Phone){
        List<Account> list = getListAccounts();
        Account account = new Account();
        for(int i=0; i<list.size(); i++){
            if(AccountName.equals(list.get(i).getAccountName()) && Email.equals(list.get(i).getEmail()) && Phone.equals(list.get(i).getPhone())){
                account = list.get(i);
            }
        }
        return account;
    }
    
    // Thay dôi thong tin user
    public void changeInforUser(String AccountName, String Email, String Name,  String Phone){
        String sql = "update Accounts_HE160006 set Email=?, Name=?, Phone=? where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ps.setString(2, Name);
            ps.setString(3, Phone);
            ps.setString(4, AccountName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // Thay dôi thong tin user
    public void changePass(String AccountName, String Password){
        MD5 md5 = new MD5();
        String sql = "update Accounts_HE160006 set Password=? where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, md5.md5(Password));
            ps.setString(2, AccountName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    // Lay list user
    public List<Account> getListUsers(){
        List<Account> listUsers = new ArrayList<>();
        String sql = "select * from Accounts_HE160006 where Role=2";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Account a = new Account();
                String AccountName = rs.getString(1);
                String Email = rs.getString(2);
                String Password = rs.getString(3);
                int Role = rs.getInt(4);
                String Name = rs.getString(5);
                String Phone = rs.getString(6);

                a = new Account(AccountName, Email, Password, Role, Name, Phone);
                listUsers.add(a);
            }
        } catch (Exception e) {
        }
        return listUsers;
    }
    
    // Lay list admins

    public List<Account> getListAdmins(){
        List<Account> listUsers = new ArrayList<>();
        String sql = "select * from Accounts_HE160006 where Role=1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Account a = new Account();
                String AccountName = rs.getString(1);
                String Email = rs.getString(2);
                String Password = rs.getString(3);
                int Role = rs.getInt(4);
                String Name = rs.getString(5);
                String Phone = rs.getString(6);

                a = new Account(AccountName, Email, Password, Role, Name, Phone);
                listUsers.add(a);
            }
        } catch (Exception e) {
        }
        return listUsers;
    }
    
    // get account by accName and Password
    public Account getAccount(String AccountName, String Password) {
        String sql = "select * from [Accounts_HE160006] where AccountName=? and Password=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.setString(2, Password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AccountName = rs.getString(1);
                String Email = rs.getString(2);
                Password = rs.getString(3);
                int Role = rs.getInt(4);
                String Name = rs.getString(5);
                String Phone = rs.getString(6);
                Account a = new Account(AccountName, Email, Password, Role, Name, Phone);
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    // Check Account ton tai
    public Account checkAccountExist(String AccountName) {
        String sql = "select * from Accounts_HE160006 where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountName = rs.getString(1);
                String Email = rs.getString(2);
                String Password = rs.getString(3);
                int Role = rs.getInt(4);
                String Name = rs.getString(5);
                String Phone = rs.getString(6);
                Account a = new Account(AccountName, Email, Password, Role, Name, Phone);
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    // Thay doi mat khau khi quen
    public void changePassword(String AccountName,String Password){
        String sql = "update Accounts_HE160006 set Password=? where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Password);
            ps.setString(2, AccountName);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    // Change Info User
    public void changeInfoUser(String AccountName, String Name, String Email, String Phone, String Password){
        String sql = "Update Accounts_HE160006 set Name=?,Email=?,Phone=?,Password=? where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Email);
            ps.setString(3, Phone);
            ps.setString(4, Password);
            ps.setString(5, AccountName);
            ps.execute();
            
        } catch (Exception e) {
        }
    }
    
    // Change password of user
    public void changeUserPassword(String AccountName, String Password){
        String sql = "Update Accounts_HE160006 set Password=? where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Password);
            ps.setString(2, AccountName);
            ps.execute();
            
        } catch (Exception e) {
        }
    }

    // Insert new account
    public void insertNewAccount(String AccountName, String Email, String Password, int Role, String Name, String Phone) {
        String sql = "Insert into Accounts_HE160006 values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.setString(2, Email);
            ps.setString(3, Password);
            ps.setInt(4, Role);
            ps.setString(5, Name);
            ps.setString(6, Phone);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    // Xoa Account 
    public void removeAccountUser(String AccountName){
        String sql = "update Accounts_HE160006 set [Role]=0 where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // RestoreUser
    public void restoreUser(String AccountName){
        String sql = "update Accounts_HE160006 set [Role]=2 where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // Cap quyen Admin cho User
    public void upUserToAdmin(String AccountName){
        String sql = "update Accounts_HE160006 set [Role]=1 where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // Chuyen Admin thanh User
    public void downAdminToUser(String AccountName){
        String sql = "update Accounts_HE160006 set [Role]=2 where AccountName=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, AccountName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // Lay danh sach User bi cam
    public List<Account> getListUserLock(){
        List<Account> listUserLock = new ArrayList<>();
        String sql = "select * from Accounts_HE160006 where [Role]=0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                String AccountName = rs.getString(1);
                String Email = rs.getString(2);
                String Password = rs.getString(3);
                int Role = rs.getInt(4);
                String Name = rs.getString(5);
                String Phone = rs.getString(6);

                a = new Account(AccountName, Email, Password, Role, Name, Phone);
                listUserLock.add(a);
            }
        } catch (Exception e) {
        }
        return listUserLock;
    }

    // Check
    public static void main(String[] args) {
        AccountDAO aD = new AccountDAO();
        aD.changePass("user1", "0");
        System.out.println(aD.getAccountForgotPass("user1", "trungab2305@gmail.com", "011111111"));
//        aD.insertNewAccount("admin4", "1", "1", 1, "1", "1");
//        Account a = aD.checkAccountExist("admin1");
//        System.out.println(a);
//        aD.changePassword("1", "aaaaaa");
//        System.out.println(a.toString());
//        Account account = aD.getAccountByAccountName("user1");
//        System.out.println(account.toString());
//        List<Account> list = aD.getLis("user11");
//        for (Account account : list) {
//            System.out.println(account.toString());
//        }
        
//        aD.downAdminToUser("user1");

//        System.out.println(java.time.LocalDateTime.now());
    }
}
