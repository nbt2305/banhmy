/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Account;
import models.Product;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class CheckPaymentForgot extends HttpServlet {
   
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
        
        String ProductID = request.getParameter("ProductID");
        
        int id = Integer.parseInt(ProductID);
        
        
        ProductDAO p = new ProductDAO();
        Product product = p.getProductByID(id);
        
        OrderDAO o = new OrderDAO();
        
        HttpSession session = request.getSession();
        String AccountName = (String) session.getAttribute("AccountName");
        
        AccountDAO a = new AccountDAO();
//        Account account = a.getAccountByAccountName(AccountName);
        
        if((o.checkProduct(id, AccountName))){
            a.changePass(AccountName, "0");
            List<Product> getListProducts = p.getListProducts();
            request.setAttribute("getListProducts", getListProducts);
//            session.setAttribute("AccountName", AccountName);
            request.setAttribute("bell", "Reset Mật Khẩu Thành Công!");
            request.getRequestDispatcher("checkPaymentForgot.jsp").forward(request, response);
        }
        else{
            List<Product> getListProducts = p.getListProducts();
            int count = (int)session.getAttribute("count");
            count--;
            if(count!=0){
                request.setAttribute("getListProducts", getListProducts);
                session.setAttribute("count", count);
                session.setAttribute("AccountName", AccountName);
                request.setAttribute("bellCount", "Bạn còn lại "+count+" lần chọn!");
                request.setAttribute("bell", "Reset Mật Khẩu Không Thành Công!");
                request.getRequestDispatcher("checkPaymentForgot.jsp").forward(request, response);
            }
            else{
                a.removeAccountUser(AccountName);
                request.setAttribute("bellCount", "Bạn còn lại "+count+" lần chọn!");
                request.setAttribute("bell", "Tài khoản của bạn tạm thời bị khóa!");
                request.getRequestDispatcher("checkPaymentForgot.jsp").forward(request, response);
            }
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
