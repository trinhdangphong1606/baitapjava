/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import DAO.ProductDAO;
import beans.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

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
            int categoryID = 0;
            if (request.getParameter("categoryID") != null) {
                categoryID = Integer.valueOf(request.getParameter("categoryID"));
            }
            int pageID = 1;
            if (request.getParameter("page") != null) {
                pageID = Integer.valueOf(request.getParameter("page"));
            }  
            int sex = 0;
            if (request.getParameter("sex") != null) {
                sex = Integer.valueOf(request.getParameter("sex"));
            }  
            ArrayList<Product> dssp = ProductDAO.getListProduct(categoryID, sex);
            int numofproperpage = 9;
            int numberOfPage = 0;
            if(dssp.size() % numofproperpage == 0)
                numberOfPage = dssp.size()/numofproperpage;
            else
                numberOfPage = dssp.size()/numofproperpage + 1;
            int start = pageID - 1;
            if(pageID > 1)
            {
                start = (pageID-1)*numofproperpage;
            }
            ArrayList<Product> productperpage = new ArrayList<>();
            
            int end = start + numofproperpage;
            if(end >dssp.size())
                end = dssp.size();
            for(int i = start; i < end; i++)
            {
                productperpage.add(dssp.get(i));
            }
            request.setAttribute("dssp", productperpage.toArray(new Product[productperpage.size()])); 
            request.setAttribute("categoryID", categoryID);
            request.setAttribute("numberOfPage", numberOfPage);
            request.setAttribute("sex", sex);
            request.setAttribute("page", pageID);
            RequestDispatcher rd=request.getRequestDispatcher("/shop.jsp");  
            rd.forward(request, response);  
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
