/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.ProductMenuDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.LineItem;
import model.Product;
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
            HttpSession session = request.getSession();
            List<LineItem> lsCart = (List<LineItem>) session.getAttribute("cart");
            request.setCharacterEncoding("UTF-8");
            ProductMenuDAO dao = new ProductMenuDAO();
            List<ProductMenu> list = dao.getAllProductMenu();
            request.setAttribute("listP", list);

            String action = request.getParameter("action");
            String productParam = request.getParameter("productId");
            String quantityParam = request.getParameter("quantity");
            int productId = 0;
            int quantity = 0;
            if (productParam != null && !productParam.isEmpty()) {
                try {
                    productId = Integer.parseInt(productParam);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }

            if (quantityParam != null && !quantityParam.isEmpty()) {
                try {
                    quantity = Integer.parseInt(quantityParam);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            // return product page
            if (action != null && action.equalsIgnoreCase("cart")) {
                LineItem lineitem = new LineItem();
                Product product = null;

                if (lsCart == null) {
                    lsCart = new ArrayList<>();
                    session.setAttribute("cart", lsCart);
                }

                boolean productExists = false;
                for (LineItem item : lsCart) {
                    if (item.getProduct().getId() == productId) {
                        item.setQuantity(item.getQuantity() + quantity);
                        productExists = true;
                        break;
                    }
                }
                if (!productExists) {
                    ProductDAO p = new ProductDAO();
                    product = p.getProductById(productId);
                    if (product != null) {
                        lineitem.setProduct(product);
                        lineitem.setQuantity(quantity);
                        lsCart.add(lineitem);
                    }
                }

                System.out.println("Size" + lsCart.size());
                ProductMenuDAO menuDAO = new ProductMenuDAO();
                List<ProductMenu> menuList = menuDAO.getAllProductMenu();
                request.setAttribute("listP", menuList);
                request.getRequestDispatcher("fashionShop.jsp").forward(request, response);
                return;

            } // return home
            else if (action != null && action.equalsIgnoreCase("cart1")) {
                LineItem lineitem = new LineItem();
                Product product = null;

                if (lsCart == null) {
                    lsCart = new ArrayList<>();
                    session.setAttribute("cart", lsCart);
                }

                boolean productExists = false;
                for (LineItem item : lsCart) {
                    if (item.getProduct().getId() == productId) {
                        item.setQuantity(item.getQuantity() + quantity);
                        productExists = true;
                        break;
                    }
                }
                if (!productExists) {
                    ProductDAO p = new ProductDAO();
                    product = p.getProductById(productId);
                    if (product != null) {
                        lineitem.setProduct(product);
                        lineitem.setQuantity(quantity);
                        lsCart.add(lineitem);
                    }
                }

                System.out.println("Size" + lsCart.size());
                ProductMenuDAO menuDAO = new ProductMenuDAO();
                List<ProductMenu> menuList = menuDAO.getAllProductMenu();
                request.setAttribute("listP", menuList);
                request.getRequestDispatcher("index").forward(request, response);
                return;
            } else if (action != null && action.equalsIgnoreCase("deleteCart")) {
                int id = Integer.parseInt(request.getParameter("productId"));
                lsCart.remove(productId);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
            request.getRequestDispatcher("fashionShop.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void decrementQuantity(List<LineItem> lsCart, int productId) {
        for (int i = 0; i < lsCart.size(); i++) {
            LineItem item = lsCart.get(i);
            if (i == productId) {
                int newQuantity = item.getQuantity() - 1;
                if (newQuantity >= 0) {
                    item.setQuantity(newQuantity);
                }
                break;
            }
        }
    }

    private void incrementQuantity(List<LineItem> lsCart, int productId) {
        for (int i = 0; i < lsCart.size(); i++) {
            LineItem item = lsCart.get(i);
            if (i == productId) {
                item.setQuantity(item.getQuantity() + 1);
                break;
            }
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
        try {
            HttpSession session = request.getSession();
            List<LineItem> lsCart = (List<LineItem>) session.getAttribute("cart");
            String action = request.getParameter("action");
            String productParam = request.getParameter("productId");
            int productId = 0;
            if (productParam != null && !productParam.isEmpty()) {
                try {
                    productId = Integer.parseInt(productParam);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            if (action != null) {
                if (action.equalsIgnoreCase("decrement")) {
                    decrementQuantity(lsCart, productId);

                } else if (action.equalsIgnoreCase("increment")) {
                    incrementQuantity(lsCart, productId);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("cart.jsp");

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