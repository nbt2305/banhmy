/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author ADMIN
 */
public class Account {
    private String AccountName;
    private String Email;
    private String Password;
    private int Role;
    private String Name;
    private String Phone;

    public Account() {
    }

    public Account(String AccountName, String Email, String Password, int Role, String Name, String Phone) {
        this.AccountName = AccountName;
        this.Email = Email;
        this.Password = Password;
        this.Role = Role;
        this.Name = Name;
        this.Phone = Phone;
    }

    public String getAccountName() {
        return AccountName;
    }

    public void setAccountName(String AccountName) {
        this.AccountName = AccountName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    @Override
    public String toString() {
        return "Accounts{" + "AccountName=" + AccountName + ", Email=" + Email + ", Password=" + Password + ", Role=" + Role + ", Name=" + Name + ", Phone=" + Phone + '}';
    }
    
}
