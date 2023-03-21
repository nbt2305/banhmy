/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;

/**
 *
 * @author ADMIN
 */
public class AddProduct extends HttpServlet {
   
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
        String ProductID = request.getParameter("id");
        String ProductName = request.getParameter("name");
        String CategoryID = request.getParameter("cid");
        String UnitPrice = request.getParameter("price");
        String UnitsInStock = request.getParameter("unitStock");
        String Picture = request.getParameter("picture");
        
        int id = Integer.parseInt(ProductID.trim());
        
//        request.setAttribute("id", ProductID);
//        request.setAttribute("name", ProductName);
//        request.setAttribute("cid", CategoryID);

        
        ProductDAO p = new ProductDAO();
        p.getListProducts();
        Product product = p.getProductByID(id);
        if(product != null){
            p.insertNewProduct(ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock, null, Picture);
            request.getRequestDispatcher("manageProduct").forward(request, response);
        }
        else{
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
        
        
//        Product product = p.getProductByID(ProductID);
//        if(product == null){
//            if(ProductID.isEmpty() || ProductName.isEmpty() || CategoryID.isEmpty() || UnitPrice.isEmpty() || UnitsInStock.isEmpty() || Picture.isEmpty()){
//                request.setAttribute("error", "thieu");
//                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
//            }
//            p.insertNewProduct(ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock, null, Picture);
//            response.sendRedirect("manageProduct");
//        }
//        else{
//            request.setAttribute("error", "ID đã tồn tại!"+product.getCategoryID());
//            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
//        }
        
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
