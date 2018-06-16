package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import beans.User;
import javax.servlet.http.HttpSession;

public class RegisterController extends HttpServlet 
{
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
                User user = new User();
     
                user.setFirst_name(request.getParameter("first_name"));
                user.setLast_name(request.getParameter("last_name"));
                user.setUser(request.getParameter("user"));
                user.setPwd(request.getParameter("pwd"));
                user.setAddress(request.getParameter("address"));
                user.setEmail(request.getParameter("email"));
                user.setCountry(request.getParameter("country"));
                user.setCity(request.getParameter("city"));
                user.setPhone(request.getParameter("phone"));

                boolean isUserExist = user.GetUser();
                if (isUserExist) {
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request,response);
                } else {
                    
                
                user.RegisterUser();

                HttpSession sessionUser = request.getSession();
                sessionUser.setAttribute("register", "SUCCESS");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request,response);
                }
            } finally {out.close();}
        }
           
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            processRequest(request, response);
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            processRequest(request, response);
        }
        
        @Override
        public String getServletInfo() 
        {
            return "Short description";
        }
}   
