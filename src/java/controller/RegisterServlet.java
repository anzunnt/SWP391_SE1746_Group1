/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.EnCryptPassword;
import dal.VerifyCode;
import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import model.user;

/**
 *
 * @author admin
 */
@WebServlet(name="RegisterServlet", urlPatterns={"/register"})
public class RegisterServlet extends HttpServlet {
   
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
        try {
            
            EnCryptPassword ecp = new EnCryptPassword();
            user u = new user();
            u.setId(-1);
            u.setFullname(request.getParameter("fullname"));
            u.setUsername(request.getParameter("username"));
            u.setPassword(ecp.hashPassword(request.getParameter("password")));
            u.setEmail(request.getParameter("email"));
            u.setPhone(request.getParameter("phone"));
            u.setImage(request.getParameter("image"));
            u.setDob(Date.valueOf(request.getParameter("dob")));
            u.setAddress(request.getParameter("address"));

            VerifyCode vcdal = new VerifyCode();
            u.setCode_verify(vcdal.generateVerificationCode(6));
            String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
            u.setCreated_on(currentDate);
            u.setModified_on(currentDate);

            userDAO ud = new userDAO();
            user checkExist = ud.GetUserByUsername(request.getParameter("username"));
            if (checkExist == null) {
                ud.InsertUser(u);
                response.sendRedirect("login");
            } else {
                request.setAttribute("messregis", "Username is already existed!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            request.setAttribute("messregis", "Invalid input!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
