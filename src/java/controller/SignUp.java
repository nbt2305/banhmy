/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import dal.CategoryDAO;
import dal.MD5;
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
import models.Category;
import models.Product;

/**
 *
 * @author ADMIN
 */
public class SignUp extends HttpServlet {
   
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
//        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String rePass = request.getParameter("passAgain");
        
        AccountDAO a = new AccountDAO();
        // Kiem tra account da ton tai chua
        Account account = a.checkAccountExist(user);
        
        if(account == null){
            if(name.isEmpty() || email.isEmpty() || phone.isEmpty() || user.isEmpty() || pass.isEmpty()){
                request.setAttribute("error", "Bắt buộc phải điền đầy đủ!");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            }
            
            else if(!(pass.equals(rePass))){
                request.setAttribute("error", "Xác nhận lại mật khẩu!");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            }
            
            else{
                MD5 md5 = new MD5();
                String password = md5.md5(pass);
                a.insertNewAccount(user, email, password, 2, name, phone);
//                HttpSession session = request.getSession();
//                session.setAttribute("account", a.getAccount(user, pass));

//                Cookie AccountName = new Cookie("user", user);
//                response.addCookie(AccountName);

                request.getRequestDispatcher("LogIn.jsp").forward(request, response);
            }
        }
        
        else{
            request.setAttribute("error", "Tài khoản đã tồn tại!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
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
