/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.adminDAO;
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
import model.Admin;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminDetailServlet", urlPatterns = {"/admindetail"})
public class AdminDetailServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        Admin adm = (Admin) session.getAttribute("admin");
        if (adm != null) {
            String id_raw = request.getParameter("id");
            int id;
            adminDAO ad = new adminDAO();

            if (id_raw != null) {
                id = Integer.parseInt(id_raw);
                Admin a = ad.GetAdminById(id);
                request.setAttribute("adminlist", a);
                request.setAttribute("doing", "Update");
                request.getRequestDispatcher("admindetail.jsp").forward(request, response);
            } else {
                request.setAttribute("doing", "Add");
                request.getRequestDispatcher("admindetail.jsp").forward(request, response);
            }
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Admin a = (Admin) session.getAttribute("admin");

        try {
            String id = request.getParameter("id");

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            adminDAO ad = new adminDAO();

            String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.00").format(Calendar.getInstance().getTime());

            if (!"".equals(id)) {
                Admin adm = ad.GetAdminById(Integer.parseInt(id));
                ad.UpdateAdmin(username, password, adm.getCreated_on(), adm.getCreated_by(), a.getId(), currentDate, Integer.parseInt(id));
                response.sendRedirect("adminlist");
            } //Add a Admin
            else {
                Admin p = ad.GetAdminByUsername(username);
                if (p == null) {
                    ad.InsertAdmin(username, password, currentDate, String.valueOf(a.getId()), String.valueOf(a.getId()), currentDate);
                    response.sendRedirect("adminlist");
                } else {
                    request.setAttribute("error", "Admin is existed");
                    request.getRequestDispatcher("admindetail.jsp").forward(request, response);
                }
            }
        } catch (ServletException | IOException | NumberFormatException e) {
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
