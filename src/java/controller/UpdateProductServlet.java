/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/updateProduct"})
public class UpdateProductServlet extends HttpServlet {
    
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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO cdb = new ProductDAO();
        id = Integer.parseInt(id_raw);
        Product p = cdb.getProductById(id);
        request.setAttribute("product", p);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
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
        // Lấy đối tượng HttpSession từ request
        HttpSession session = request.getSession();
        // Lấy ID của người dùng từ session hoặc tạo mới nếu không tồn tại
        int userId = 1;//(int)session.getAttribute("userId");

        String name_raw = request.getParameter("name");
        String description_raw = request.getParameter("description");
        String basePrice_raw = request.getParameter("basePrice");
        String price_raw = request.getParameter("price");
        String discount_raw = request.getParameter("discount");
        String quantity_raw = request.getParameter("quantity");
        String style_raw = request.getParameter("style");
        String publishedAt_raw = request.getParameter("publishedAt");
        String state_raw = request.getParameter("state");
        String startsAt_raw = request.getParameter("startsAt");
        String endsAt_raw = request.getParameter("endsAt");
        float basePrice, price, discount;
        int quantity;
        byte state;
        ProductDAO dao = new ProductDAO();

        // Lấy ngày giờ hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();
        // Định dạng ngày giờ
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String modifiedAt = currentDateTime.format(formatter);

        String id_raw = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(id_raw);
            basePrice = Float.parseFloat(basePrice_raw);
            price = Float.parseFloat(price_raw);
            discount = Float.parseFloat(discount_raw);
            quantity = Integer.parseInt(quantity_raw);
            state = Byte.parseByte(state_raw);
            dao.update(id, name_raw, description_raw, basePrice, price, discount, quantity,modifiedAt, publishedAt_raw,
                    state, startsAt_raw, endsAt_raw, style_raw, userId);
            response.sendRedirect("productlist");
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
