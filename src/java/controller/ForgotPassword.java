/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Account;
import models.Product;

/**
 *
 * @author ADMIN
 */
public class ForgotPassword extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String AccountName = request.getParameter("name");
        String Email = request.getParameter("email");
        String Phone = request.getParameter("phone");
        
        int count = 3;
        
        ProductDAO p = new ProductDAO();
        AccountDAO a = new AccountDAO();
        Account account = a.getAccountForgotPass(AccountName, Email, Phone);
        
        if(account != null && account.getRole() == 2){
            List<Product> getListProducts = p.getListProducts();
                    
            request.setAttribute("getListProducts", getListProducts);
            
            HttpSession session = request.getSession();
            session.setAttribute("AccountName", AccountName);
            session.setAttribute("count", count);
            
            request.getRequestDispatcher("checkPaymentForgot.jsp").forward(request, response);
        }
        
        else if(account != null && account.getRole() == 1){
            request.setAttribute("status", "Không thể thay đổi admin!");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        }
        
        else{
            request.setAttribute("status", "Sai tên, email hoặc số điện thoại đăng ký!");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        }
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
