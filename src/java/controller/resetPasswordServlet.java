/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EnCryptPassword;
import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import model.user;

/**
 *
 * @author admin
 */
@WebServlet(name = "resetPasswordServlet", urlPatterns = {"/changepassword"})
public class resetPasswordServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        user u = (user) session.getAttribute("account");
        if (u != null) {
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
        try {
            HttpSession session = request.getSession();
            userDAO ud = new userDAO();
            EnCryptPassword ecp = new EnCryptPassword();
            user u = (user) session.getAttribute("account");
            String mess = "Password wrong!";

            String password = request.getParameter("password");
            String newpassword = request.getParameter("new password");
            String renewpassword = request.getParameter("reenter new passowrd");
            String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

            if (ecp.hashPassword(password).equals(u.getPassword())) {
                if (password.equals(newpassword)) {
                    mess = "The new password can not be the same with the current password!";
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                } else {
                    if (!newpassword.equals(renewpassword)) {
                        mess = "The reenter new password must be the same with the new password!";
                        request.setAttribute("mess", mess);
                        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                    } else {
                        u.setPassword(newpassword);
                        u.setModified_on(currentDate);
                        u.setModified_by(u.getId());
                        ud.UpdateUser(u);
                        request.getRequestDispatcher("changePassSuccess.jsp").forward(request, response);
                    }
                }
            } else {
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
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
