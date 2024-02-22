/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Image;

/**
 *
 * @author admin
 */
@WebServlet(name = "ImageController", urlPatterns = {"/manageImage"})
public class ImageController extends HttpServlet {

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
            out.println("<title>Servlet ImageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImageController at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        int id;
        ImageDAO cdb = new ImageDAO();
        try {
            id = Integer.parseInt(id_raw);
            List<Image> list = cdb.getAllImageByID(id);
            request.setAttribute("listP", list);
            request.setAttribute("id", id);
            request.getRequestDispatcher("ManageImage.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            request.setAttribute("error", e);
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
        ImageDAO imd = new ImageDAO();
        // Xử lý việc tải lên hình ảnh
        String id_raw = request.getParameter("id");
        String description = request.getParameter("description");
        String fileName = request.getParameter("file");
        int id;
        int userId = 1;//(int)session.getAttribute("userId");
        // Lấy ngày giờ hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        try {
            String createdAt = currentDateTime.format(formatter);
            id = Integer.parseInt(id_raw);
            imd.insert(fileName, id, createdAt, userId, createdAt, userId, description);
            // Thông báo thành công sau khi tải lên
            response.getWriter().println("Hình ảnh đã được tải lên thành công!");
            response.sendRedirect("productlist");
        } catch (IOException | NumberFormatException e) {
            // Xử lý lỗi nếu không tìm thấy file
            response.getWriter().println("Lỗi: " + e.getMessage());
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
