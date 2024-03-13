/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductMenuDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.ProductMenu;

/**
 *
 * @author admin
 */
@WebServlet(name = "fashionShopServlet", urlPatterns = {"/fashionshop"})
public class ProductListViewClient extends HttpServlet {

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
        try {
            request.setCharacterEncoding("UTF-8");
            ProductMenuDAO dao = new ProductMenuDAO();
            CategoryDAO cd = new CategoryDAO();
            List<Category> clist = cd.getAllCategory();
            List<ProductMenu> list = dao.getAllProductMenu();
            request.setAttribute("listC", clist);
            request.setAttribute("listP", list);
            request.getRequestDispatcher("productShop.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
        processRequest(request, response);
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
        ProductMenuDAO dao = new ProductMenuDAO();
        String category = request.getParameter("categoryFilter");
        int cateId;
        try {
            CategoryDAO cd = new CategoryDAO();
            List<Category> clist = cd.getAllCategory();
            cateId = Integer.parseInt(category);
            List<ProductMenu> list = dao.getAllProductMenu();
            if (cateId != 0) {
                list = dao.getProductByCategory(cateId);
            }
            request.setAttribute("cid", cateId);
            request.setAttribute("listC", clist);
            request.setAttribute("listP", list);
            request.getRequestDispatcher("productShop.jsp").forward(request, response);
        } catch (NumberFormatException e) {
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
