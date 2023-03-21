/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Order;
import models.OrderDetail;
import models.Product;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class PaymentControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String customerName = request.getParameter("customerName");
        String Address = request.getParameter("address");
        String Phone = request.getParameter("phone");
        String Note = request.getParameter("note");
        double totalPrice = Double.parseDouble(request.getParameter("total"));
//        LocalDateTime Date = java.time.LocalDateTime.now();
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String AccountName = account.getAccountName();
        
        ProductDAO p = new ProductDAO();
        OrderDAO o = new OrderDAO();
//        o.changeStatus(AccountName);
//        List<Order> listOrderByAccountName = o.getListOrderByAccountNameForUser(AccountName);
        
        OrderDetailDAO od = new OrderDetailDAO();
//        OrderDetail orderDetail = new OrderDetail(AccountName, customerName, Address, Phone, 0, totalPrice, Note);
        
        
        
        
        List<Order> listOrders = o.getListOrdersInshoppingCart(AccountName);
        List<Order> listOrdersByAccountName = o.getListOrderByAccountNameForUser(AccountName);
        
        String Details = "";
        for(int i=0; i<listOrdersByAccountName.size(); i++){
            Product product = p.getProductByID(listOrdersByAccountName.get(i).getProductID());
            if(listOrdersByAccountName.get(i).getQuantity() != 0)
                Details += "" + listOrdersByAccountName.get(i).getQuantity() + " - " + product.getProductName() +"\n";
        }
        
        od.insertNewOrderDetail(AccountName, customerName, Address, Phone, 0, totalPrice, Note, java.time.LocalDateTime.now().toString(), Details);
        
        for(int i=0; i<listOrders.size(); i++){
            String ProductID = ""+listOrders.get(i).getProductID();
            String UnitPrice = "" + listOrders.get(i).getUnitPrice();
            o.insertNewOrder(ProductID, UnitPrice, AccountName, "0", "1");
        }
        List<Order> listOrderByAccountNameAfterPayment = o.getListOrderByAccountNameForUserAfterPayment(AccountName);
//        ProductDAO p = new ProductDAO();
        List<Product> listProductOfOrder = new ArrayList<>();
        
        for(int i=0; i<listOrderByAccountNameAfterPayment.size(); i++){
            Product product = p.getProductByID(listOrderByAccountNameAfterPayment.get(i).getProductID());
            listProductOfOrder.add(product);
        }
        
//        int quantity = o.quantityOfProductAfterBuy(AccountName);
        
        request.setAttribute("listOrderByAccountNameAfterPayment", listOrderByAccountNameAfterPayment);
        request.setAttribute("listProductOfOrder", listProductOfOrder);
        request.setAttribute("bell", "Đặt hàng thành công");
        request.getRequestDispatcher("shoppingCart").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
