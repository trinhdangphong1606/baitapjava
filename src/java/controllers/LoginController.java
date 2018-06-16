package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.User;
import java.io.InputStreamReader;
import javax.servlet.http.HttpSession;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.StringReader;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

public class LoginController extends HttpServlet 
{
	public static final String url = "https://www.google.com/recaptcha/api/siteverify";
	public static final String secret = "6LeKM14UAAAAADjkOfxSMUQak_I_xhFeRMvBTBj4";
	private final static String USER_AGENT = "Mozilla/5.0";
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
                User user = new User();

                user.setUser(request.getParameter("user"));
                user.setPwd(request.getParameter("pwd"));
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
                    HttpSession sessionUser = request.getSession();
                    sessionUser.setAttribute("captcha", "Captcha is not correct!");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request,response);
                    return;
		}
		URL obj = new URL(url);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		String postParams = "secret=" + secret + "&response="
				+ gRecaptchaResponse;

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();

		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer captchaResponse = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
                    captchaResponse.append(inputLine);
		}
		in.close();
		
		//parse JSON response and return 'success' value
		JsonReader jsonReader = Json.createReader(new StringReader(captchaResponse.toString()));
		JsonObject jsonObject = jsonReader.readObject();
		jsonReader.close();
		
		boolean isCaptchaCorrect = jsonObject.getBoolean("success");
                if (!isCaptchaCorrect) {
                    HttpSession sessionUser = request.getSession();
                    sessionUser.setAttribute("captcha", "Captcha is not correct!");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request,response);
                    return;
		}
                if(User.LoginUser(request.getParameter("user"),request.getParameter("pwd")))
                {
                    User us = new User();
                    us.setUser(String.valueOf(request.getParameter("user")));
                    us.GetUser();

                    HttpSession sessionUser = request.getSession();
                    sessionUser.setAttribute("user",us.getUser());
                    

                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request,response);
                }  
                else
                {
                    out.println("Either username or password is incorrect!");
                    out.println("<a href=\"login.jsp\">Try again...</a>");
                }    
            } finally {out.close();}
        }
        
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
                    HttpSession sessionUser = request.getSession();
                    sessionUser.setAttribute("user","");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request,response);
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