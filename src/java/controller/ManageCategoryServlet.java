/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Admin;
import model.Category;

/**
 *
 * @author admin
 */
@WebServlet(name = "ManageCategoryServlet", urlPatterns = {"/manageCategory"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, // 3MB
        maxFileSize = 1024 * 1024 * 40, // 40MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ManageCategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageCategoryServlet at " + request.getContextPath() + "</h1>");
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
        Admin u = (Admin) session.getAttribute("account");
        if (u == null) {
            response.sendRedirect("error.jsp");
        } else {
            String id_raw = request.getParameter("id");
            int id;
            CategoryDAO cdb = new CategoryDAO();

            if (id_raw != null) {
                id = Integer.parseInt(id_raw);
                Category p = cdb.getCategoryById(id);
                request.setAttribute("product", p);
                request.setAttribute("doing", "Update");
                request.getRequestDispatcher("ManageCategory.jsp").forward(request, response);
            } else {
                request.setAttribute("doing", "Add");
                request.getRequestDispatcher("ManageCategory.jsp").forward(request, response);
            }
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
        // Lấy ID của người dùng từ session
        CategoryDAO cd = new CategoryDAO();
        HttpSession session = request.getSession();
        Admin u = (Admin) session.getAttribute("admin");
        int userId = u.getId();
        String id_raw = request.getParameter("id");
        int id;
        // Lấy ngày giờ hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String name_raw = request.getParameter("name");
        Part filePart = request.getPart("file");
        InputStream inputStream = null;
        try {
            if (filePart != null) {
                // Lấy tên file.
                String fileName = filePart.getSubmittedFileName();
                // Lấy InputStream của file.
                inputStream = filePart.getInputStream();

                // Thiết lập thư mục lưu trữ file ảnh trên máy chủ.
                String uploadPath = getServletContext().getRealPath("") + File.separator + "assets/images/product";
                // Tạo thư mục nếu nó không tồn tại.
                File directory = new File(uploadPath);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                try ( // Ghi file vào thư mục đã thiết lập.
                         OutputStream outputStream = new FileOutputStream(new File(uploadPath + File.separator + fileName))) {
                    int bytesRead = -1;
                    byte[] buffer = new byte[4096];
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
                inputStream.close();

                // Lưu đường dẫn của file vào cơ sở dữ liệu.
                String filePath = "assets/images/product" + File.separator + fileName;
                String modifiedAt = currentDateTime.format(formatter);
                //Update a category
                if (!"".equals(id_raw)) {
                    id = Integer.parseInt(id_raw);
                    cd.update(name_raw, filePath, modifiedAt, userId, id);
                    response.sendRedirect("categorylist");
                } //Add a category
                else {
                    Category c = cd.getCategoryByName(name_raw);
                    if (c == null) {
                        cd.insert(name_raw, filePath, modifiedAt, userId, modifiedAt, userId);
                        response.sendRedirect("categorylist");
                    } else {
                        request.setAttribute("error", "Category is existed");
                        request.getRequestDispatcher("ManageCategory.jsp").forward(request, response);
                    }
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
