/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;
import model.Blog;
import model.BlogCategory;

/**
 *
 * @author ADMIN-PC
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/newlist"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024, // 5 MB
        maxRequestSize = 20 * 1024 * 1024) // 20 MB
public class NewServlet extends HttpServlet {

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
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (action != null) {
            switch (action) {
                case "addpage":
                    handleOpenAddPage(request, response);
                    break;
                case "update":
                    BlogDAO blog = new BlogDAO();
                    Blog listN = blog.getBlogById(id);
                    request.setAttribute("cate", listN);
                    List<String> blogCategorys = blog.getAllCategoryNames();
                    request.setAttribute("cateItem", blogCategorys);
                    request.getRequestDispatcher("updateNews.jsp").forward(request, response);
                    break;
                case "delete":
                    String[] idsToDelete = request.getParameterValues("deleteRow");
                    BlogDAO categoryDAO = new BlogDAO();

                    if (idsToDelete != null && idsToDelete.length > 0) {
                        BlogDAO blogDAO = new BlogDAO();
                        blogDAO.deleteBlogsByIds(idsToDelete);
                    }
                    String deid = request.getParameter("id");
                    if (id != null && !id.isEmpty()) {
                        try {
                            int cateId = Integer.parseInt(deid);
                            categoryDAO.deleteBlog(cateId);
                        } catch (NumberFormatException e) {
                            e.printStackTrace();
                        }
                    }
                    response.sendRedirect("newlist");
                    break;

                default:
                    break;
            }
        } else {
            handleGetAll(request, response);
        }
    }

    private void handleInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Part banner = request.getPart("banner");
            String title = request.getParameter("title");
            String categoryId = request.getParameter("category");
            String body = request.getParameter("body");
            Part img = request.getPart("img1");
            String dob = request.getParameter("dob");

            System.out.println("banner: " + banner);
            System.out.println("title: " + title);
            System.out.println("categoryId: " + categoryId);
            System.out.println("img: " + img);
            System.out.println("dob: " + dob);

            BlogDAO blogDAO = new BlogDAO();
            int cateId = blogDAO.getCategoryIdByName(categoryId);
            String imgPath = saveImage(img, request);
            String bannerPath = saveImage(banner, request);

            System.out.println("imgPath: " + imgPath);
            Blog blog = new Blog();
            blogDAO.insertNewBlog(bannerPath, title, cateId, body, imgPath, dob);
            response.sendRedirect("newlist");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   private String saveImage(Part imgPart, HttpServletRequest request) throws IOException {
    if (imgPart == null || imgPart.getSize() == 0) {
        // Không có file được chọn
        return null;
    }

    String fileName = UUID.randomUUID().toString() + ".jpg"; // Thêm đuôi file, ví dụ: ".jpg"

    // Lấy root path của ứng dụng
    ServletContext context = request.getServletContext();
    String rootPath = context.getRealPath("/");

    // Tạo thư mục "file" nếu nó chưa tồn tại
    String uploadsPath = rootPath + File.separator + "file";
    File uploadsDir = new File(uploadsPath);
    if (!uploadsDir.exists()) {
        if (uploadsDir.mkdirs()) {
            System.out.println("Thư mục đã được tạo: " + uploadsPath);
        } else {
            System.out.println("Không thể tạo thư mục: " + uploadsPath);
        }
    }

    // Sử dụng Path thay vì chuỗi đường dẫn
    Path targetPath = Paths.get(uploadsPath, fileName);
    try (InputStream input = imgPart.getInputStream(); OutputStream output = Files.newOutputStream(targetPath)) {
        byte[] buffer = new byte[1024];
        int length;
        while ((length = input.read(buffer)) != -1) {
            output.write(buffer, 0, length);
        }
    }

    return fileName;
}


  private void handleUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
    try {
        // Lấy các tham số từ request
        String idString = request.getParameter("id");
        String title = request.getParameter("title");
        String categoryId = request.getParameter("category");
        String body = request.getParameter("body");
        
        // Lấy các Part từ request để xử lý file upload
        Part bannerPart = request.getPart("banner");
        Part imgPart = request.getPart("img1");
        
        if (idString != null && idString.matches("\\d+")) {
            int id = Integer.parseInt(idString);
            BlogDAO blogDAO = new BlogDAO();
            Blog existingBlog = blogDAO.getBlogById(String.valueOf(id));

            if (existingBlog != null) {
                existingBlog.setBlog_title(title);
                existingBlog.setBlog_body1(body);
                int newCategoryId = blogDAO.getCategoryIdByName(categoryId);
                existingBlog.getBlogCategory().setId(newCategoryId);
                
                // Kiểm tra xem bannerPart có dữ liệu được gửi lên không
                if (bannerPart != null && bannerPart.getSize() > 0) {
                    String bannerPath = saveImage(bannerPart, request);
                    existingBlog.setBanner(bannerPath);
                }

                // Kiểm tra xem imgPart có dữ liệu được gửi lên không
                if (imgPart != null && imgPart.getSize() > 0) {
                    String imgPath = saveImage(imgPart, request);
                    existingBlog.setImg1(imgPath);
                }

                blogDAO.updateBlog(existingBlog);
                response.sendRedirect("newlist");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Blog not found");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid blog id");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
    }
}


    private void handleGetAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String num_raw = request.getParameter("pageNumber");
        int num;
        try {
            if (num_raw == null) {
                num = 5;
            } else {
                num = Integer.parseInt(num_raw);
            }
            request.setCharacterEncoding("UTF-8");
            BlogDAO dao = new BlogDAO();
            //Product p = dao.getProductById(id);
            int totalProduct = dao.getTotalBlogCount();
            int numberPage = (int) Math.ceil((double) totalProduct / num);
            int index;
            String currentPage = request.getParameter("index");
            if (currentPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(currentPage);
            }
            List<Blog> list = dao.getNewestBlogsByPage(index, num);
            for (Blog blog : list) {
                String relativeBannerPath = blog.getBanner(); // Đường dẫn tương đối từ database
                String absoluteBannerPath = request.getContextPath() + "/file/"+ relativeBannerPath;
                String relativeImgPath = blog.getImg1();
                String absoluteImgPath = request.getContextPath() + "/file/"+ relativeImgPath;
                System.out.println("duogn dan 1 " + absoluteBannerPath);
                System.out.println("duong dan 2" + absoluteImgPath);
                blog.setBanner(absoluteBannerPath);
                blog.setImg1(absoluteImgPath);
            }
            request.setAttribute("num", num);
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("listP", list);
            request.getRequestDispatcher("newlist.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void handleOpenAddPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        BlogDAO dao = new BlogDAO();
        List<String> blogCategorys = dao.getAllCategoryNames();
        request.setAttribute("cateItem", blogCategorys);
        request.getRequestDispatcher("manageNews.jsp").forward(request, response);
    }

    private void handleSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num_raw = request.getParameter("pageNumber");
        String keyword = request.getParameter("keyword");
        int num;
        try {
            if (num_raw == null) {
                num = 5;
            } else {
                num = Integer.parseInt(num_raw);
            }
            request.setCharacterEncoding("UTF-8");
            BlogDAO dao = new BlogDAO();

            int totalSearchResults = dao.countTotalSearchResults(keyword);

            int numberPage = (int) Math.ceil((double) totalSearchResults / num);

            int index;
            String currentPage = request.getParameter("index");
            if (currentPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(currentPage);
            }

            List<Blog> blogList = dao.searchBlogsByPage(keyword, index, num);

            request.setAttribute("num", num);
            request.setAttribute("numberPage", numberPage);
            request.setAttribute("listP", blogList);
            request.setAttribute("totalSearchResults", totalSearchResults);

            RequestDispatcher dispatcher = request.getRequestDispatcher("newlist.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "insert":
                    handleInsert(request, response);
                    break;
                case "update":
                    handleUpdate(request, response);
                    break;
                case "search":
                    handleSearch(request, response);
                    break;
                default:
                    response.getWriter().println("Invalid action");
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