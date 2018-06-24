/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import DAO.ProductDAO;
import beans.Cart;
import beans.Item;
import beans.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String command = request.getParameter("command");
            int productID = Integer.parseInt(request.getParameter("productID"));
            
            Cart cart = (Cart) session.getAttribute("cart");
           
            if(cart == null)
            {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            try
            {
                
                Product p = ProductDAO.getProductByID(productID);
                switch(command)
                {
                    case "plus":
                        if(cart.getCartItems().containsKey(productID))
                        {
                            Item item = new Item();
                            item.setProduct(p);
                            item.setQuantity(cart.getCartItems().get(productID).getQuantity());
                            cart.inserttoCard(productID, item);
                        }
                        else
                        {
                              Item item = new Item();
                              item.setProduct(p);
                              item.setQuantity(1);
                              cart.inserttoCard(productID, item);
                        }
                        break;
                    case "delete":
                    {
                        
                        cart.removeToCart(productID);
                        session.setAttribute("cart", cart);
                        RequestDispatcher rd=request.getRequestDispatcher("/checkout.jsp");  
                        rd.forward(request, response);  
                        return;
                        
                    }
                }
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/ProductController");
            }
            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/ProductController");
        }
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
