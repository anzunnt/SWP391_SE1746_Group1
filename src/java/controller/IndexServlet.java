/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProductMenu;
import dal.ProductMenuDAO;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
@WebServlet(name="IndexServlet", urlPatterns={"/index"})
public class IndexServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ProductMenuDAO dao = new ProductMenuDAO();
        List<ProductMenu> listPopular = dao.getTop4PopularProduct();      
        request.setAttribute("listP", listPopular);
        List<ProductMenu> listSale = dao.getTop4SaledProduct();
        request.setAttribute("listS", listSale);
//        CategoryDAO cd = new CategoryDAO();
//        List<Category> categories = cd.GetCategories();
//        request.setAttribute("categories", categories);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 
//    
//    public static void main(String[] args) {
//        ProductMenuDAO pd = new ProductMenuDAO();
//        List<ProductMenu> products = pd.getAllProductMenu();
//        List<ProductMenu> pr = new ArrayList<>();
//        for (int i=0; i<4; i++)
//            pr.add(products.get(i));
//        for (int i=0; i<4; i++)
//            System.out.println(pr.get(i).getName());
//    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
