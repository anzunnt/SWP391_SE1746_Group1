package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */



import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.LineItem;

/**
 *
 * @author Anh Dat
 */
@WebServlet(name="Payment", urlPatterns={"/payment"})
public class Payment extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("isLoggedIn") != null && (Boolean) session.getAttribute("isLoggedIn")) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
        } else {
            // Nếu người dùng đã đăng nhập, chuyển hướng đến trang checkout
            response.sendRedirect("payment.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Trích xuất thông tin sản phẩm từ bảng cart
        List<LineItem> lineItem = null;
       
        
        // Tính tổng số lượng sản phẩm và tổng thuế
        int totalQuantity = 0;
        double totalPrice = 0.0;
        for (LineItem item : lineItem) {
            totalQuantity += item.getQuantity();
            totalPrice += item.getTotal()* item.getQuantity();
        }
        // Tính thuế (ví dụ: 10%)
        double tax = totalPrice * 0.1;

        // Thêm thông tin vào bảng order
        /* Code để thêm thông tin vào bảng order */

        // Chuyển hướng người dùng đến trang checkout
        response.sendRedirect("payment.jsp?totalQuantity=" + totalQuantity + "&totalPrice=" + totalPrice + "&tax=" + tax);
        // Logic xác nhận thanh toán và đặt hàng thành công

        // Đặt thuộc tính vào session để xác định rằng đơn hàng đã được đặt thành công
        HttpSession session = request.getSession();
        session.setAttribute("orderSuccess", true);

        // Chuyển hướng người dùng đến trang checkout
        response.sendRedirect("payment.jsp");
        
         response.sendRedirect("orderDetails.jsp");
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
