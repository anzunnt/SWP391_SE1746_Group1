/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.VerifyCode;
import dal.userDAO;
import model.user;
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

/**
 *
 * @author admin
 */
@WebServlet(name = "ManageUserServlet", urlPatterns = {"/manageUser"})
public class ManageUserServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
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
        String id_raw = request.getParameter("id");
        int id;
        userDAO ud = new userDAO();

        if (id_raw != null) {
            id = Integer.parseInt(id_raw);
            user u = ud.GetUserById(id);
            request.setAttribute("user", u);
            request.setAttribute("doing", "Update");
            request.getRequestDispatcher("manageUser.jsp").forward(request, response);
        } else {
            request.setAttribute("doing", "Add");
            request.getRequestDispatcher("manageUser.jsp").forward(request, response);
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
            String id = request.getParameter("id");
            String fullname = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String code = request.getParameter("code");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String image = request.getParameter("image");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String status = request.getParameter("status");
            String created_on = request.getParameter("created_on");

            String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.00").format(Calendar.getInstance().getTime());

            userDAO ud = new userDAO();
<<<<<<< Updated upstream
            if (!"".equals(id)) {
                ud.UpdateUser(fullname, username, password, code, email, phone, image, Date.valueOf(dob), address, (status.equals("active")?1:0), created_on, 1, 1, currentDate, Integer.parseInt(id));
=======
            if (id != null) {
                user u = new user(Integer.parseInt(id), fullname, username, password, code, email, phone, image, Date.valueOf(dob), address, (status.equals("active") ? 1 : 0), created_on, 1, 1, currentDate);
                ud.UpdateUser(u);
>>>>>>> Stashed changes
                response.sendRedirect("userlist");
            } else {
                request.setAttribute("error", "User is not existed: " + username);
                request.getRequestDispatcher("manageUser.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
