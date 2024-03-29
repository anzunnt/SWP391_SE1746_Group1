/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.VerifyCode;
import dal.userDAO;
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
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import model.user;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

/**
 *
 * @author admin
 */
@WebServlet(name = "profileSettingServlet", urlPatterns = {"/profileSetting"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, // 3MB
        maxFileSize = 1024 * 1024 * 40, // 40MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class profileSettingServlet extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            user u = (user) session.getAttribute("account");
            request.setAttribute("user", u);
            request.getRequestDispatcher("profileSetting.jsp").forward(request, response);
        } catch (ServletException | IOException e) {

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
        InputStream inputStream = null; // Để lưu trữ dữ liệu đầu vào hình ảnh.

        Part filePart = request.getPart("image");
        if (filePart != null) {
            // Lấy tên file.
            String fileName = filePart.getSubmittedFileName();
            // Lấy InputStream của file.
            inputStream = filePart.getInputStream();

            // Thiết lập thư mục lưu trữ file ảnh trên máy chủ.
            String uploadPath = getServletContext().getRealPath("") + File.separator + "assets/images/customer";
            // Tạo thư mục nếu nó không tồn tại.
            File directory = new File(uploadPath);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            try ( // Ghi file vào thư mục đã thiết lập.
                OutputStream outputStream = new FileOutputStream(new File(uploadPath + File.separator + fileName))) {
                int bytesRead = 0;
                byte[] buffer = new byte[4096];
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
            inputStream.close();

            // Lưu đường dẫn của file vào cơ sở dữ liệu.
            String filePath = "assets/images/customer" + File.separator + fileName;
            try {
                HttpSession session = request.getSession();
                userDAO ud = new userDAO();
                user u = (user) session.getAttribute("account");
                user un = ud.GetUserById(u.getId());

                un.setFullname(request.getParameter("fullname"));
                un.setUsername(un.getUsername());
                un.setEmail(request.getParameter("email"));
                un.setPhone(request.getParameter("phone"));
                un.setImage(filePath);
                un.setDob(Date.valueOf(request.getParameter("dob")));
                un.setAddress(request.getParameter("address"));

                un.setModified_on(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));

                ud.UpdateUser(un);
                session.setAttribute("account", un);
                response.sendRedirect("userprofile");
            } catch (IOException e) {
                request.setAttribute("messregis", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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
