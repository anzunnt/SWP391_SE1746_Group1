/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author Anh Dat
 */
@WebServlet(name="orderServlet", urlPatterns={"/orderServlet"})
public class orderServlet extends HttpServlet {
   
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (userName == null || password == null) {

			response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
                        return;
		}

                  Date currentTime = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String time = sdf.format(currentTime);

    
   
    
		double paidAmount = Double.parseDouble(request.getParameter("amount"));
		String status = new OrderDAO().paymentSuccess(userName, paidAmount);
                
           
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");

		RequestDispatcher rd = request.getRequestDispatcher("orderDetails.jsp");

		rd.include(request, response);
                response.sendRedirect("orderDetails.jsp?time=" + URLEncoder.encode(time, "UTF-8") + "&status=" + URLEncoder.encode(status, "UTF-8"));
		pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
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
