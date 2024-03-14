
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.*;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public ArrayList<BlogCategory> getBlogCategory() {
        ArrayList<BlogCategory> list = new ArrayList<>();
        try {
            String sql = "    select * from BlogCategory ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BlogCategory u = new BlogCategory(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Blog> getBlogs(String cateId, String name, int index) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "    select * from [Blog] b , BlogCategory c\n"
                    + "  where b.blog_category = c.id and b.status =1  and b.blog_category like   '%" + cateId + "%'"
                    + " and b.blog_title like '%" + name + "%'  order by b.id ASC  OFFSET ? ROWS FETCH NEXT 9  ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog u = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getInt(8), rs.getBoolean(9), new BlogCategory(rs.getInt(10), rs.getString(11)));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int countBlogs(String cateId, String name) {
        try {
            String sql = "    select count(*) from [Blog] b , BlogCategory c\n"
                    + "  where b.blog_category = c.id and b.status =1  and b.blog_category like   '%" + cateId + "%'"
                    + " and b.blog_title like '%" + name + "%' ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public BlogCategory getBlogCategoryId(String cid) {
        try {
            String sql = "    select * from BlogCategory where id = " + cid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BlogCategory u = new BlogCategory(rs.getInt(1), rs.getString(2));
                return u;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<Blog> getNewestBlogByCategory(String cateId, String name, int index) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "    select * from [Blog] b , BlogCategory c\n"
                    + "  where b.blog_category = c.id and b.status =1  and b.blog_category like   '%" + cateId + "%'"
                    + " and b.blog_title like '%" + name + "%'  order by b.id asc  OFFSET ? ROWS FETCH NEXT 80  ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 8);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog u = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getInt(8), rs.getBoolean(9), new BlogCategory(rs.getInt(10), rs.getString(11)));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Blog> getAllBlog() {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT b.*, c.category_name "
                    + "FROM Blog b "
                    + "JOIN BlogCategory c ON b.blog_category = c.id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog u = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getInt(8), rs.getBoolean(9), new BlogCategory(rs.getInt(10), rs.getString(11)));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //detal 
    public Blog getBlogById(String id) {
        try {
            String sql = "  select * from [Blog] b , BlogCategory c\n"
                    + "  where b.blog_category = c.id  and b.id = " + id;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog u = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getInt(8), rs.getBoolean(9), new BlogCategory(rs.getInt(10), rs.getString(11)));
                return u;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insertNewBlog(String banner, String tilte, int cateId, String body, String img, String dob) {
        try {
            String sql = "   insert into Blog ([banner],[blog_title] ,[blog_category] ,[blog_body1],[img1] ,[create_date] ,[viewCount] ,[status])\n"
                    + "  values (?,?,?,?,?,getdate(),0,1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, banner);
            stm.setString(2, tilte);
            stm.setInt(3, cateId);
            stm.setString(4, body);
            stm.setString(5, img);

            stm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCountViewBlog(String bid) {
        try {
            String sql = "   update Blog set  [viewCount] = viewCount + 1 where id = " + bid;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalBlogCount() {
        try {
            String sql = "SELECT COUNT(*) FROM Blog WHERE status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<Blog> getNewestBlogsByPage(int page, int pageSize) {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Blog b JOIN BlogCategory c ON b.blog_category = c.id "
                    + "WHERE b.status = 1 ORDER BY b.id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (page - 1) * pageSize);
            stm.setInt(2, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getInt(8), rs.getBoolean(9),
                        new BlogCategory(rs.getInt(10), rs.getString(11)));
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<String> getAllCategoryNames() {
        List<String> categoryNames = new ArrayList<>();

        try {
            String sql = "SELECT [category_name] FROM [FS_Thien].[dbo].[BlogCategory]";
            try ( PreparedStatement statement = connection.prepareStatement(sql);  ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    String categoryName = resultSet.getString("category_name");
                    categoryNames.add(categoryName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }

        return categoryNames;
    }

    // Method to convert category name to ID
    public int getCategoryIdByName(String categoryName) {
        int categoryId = -1; // Default value indicating failure

        try {
            String sql = "SELECT [id] FROM [FS_Thien].[dbo].[BlogCategory] WHERE [category_name] = ?";
            try ( PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, categoryName);
                try ( ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        categoryId = resultSet.getInt("id");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }

        return categoryId;
    }

    public void deleteBlog(int blogId) {
        try {
            String sql = "DELETE FROM Blog WHERE id = ?";
            try ( PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, blogId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBlog(Blog updatedBlog) {
        try {
            String sql = "UPDATE Blog SET [banner] = ?, [blog_title] = ?, [blog_category] = ?, "
                    + "[blog_body1] = ?, [img1] = ?, [create_date] = ?, [viewCount] = ?, [status] = ? "
                    + "WHERE id = ?";
            try ( PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, updatedBlog.getBanner());
                statement.setString(2, updatedBlog.getBlog_title());
                statement.setInt(3, updatedBlog.getBlogCategory().getId());
                statement.setString(4, updatedBlog.getBlog_body1());
                statement.setString(5, updatedBlog.getImg1());
                statement.setDate(6, new java.sql.Date(updatedBlog.getCreate_date().getTime()));
                statement.setInt(7, updatedBlog.getViewCount());
                statement.setBoolean(8, updatedBlog.isStatus());
                statement.setInt(9, updatedBlog.getId());

                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Blog> searchBlogsByPage(String keyword, int page, int pageSize) {
        ArrayList<Blog> searchResults = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Blog] b, BlogCategory c\n"
                    + "WHERE b.blog_category = c.id AND b.status = 1 AND (\n"
                    + "    b.blog_title LIKE ? OR\n"
                    + "    b.blog_body1 LIKE ? OR\n"
                    + "    c.category_name LIKE ?\n"
                    + ")\n"
                    + "ORDER BY b.id ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            // Calculate the offset based on the page and pageSize
            int offset = (page - 1) * pageSize;

            PreparedStatement stm = connection.prepareStatement(sql);
            String likeKeyword = "%" + keyword + "%";
            stm.setString(1, likeKeyword);
            stm.setString(2, likeKeyword);
            stm.setString(3, likeKeyword);
            stm.setInt(4, offset);
            stm.setInt(5, pageSize);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog u = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getInt(8), rs.getBoolean(9), new BlogCategory(rs.getInt(10), rs.getString(11)));
                searchResults.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchResults;
    }

    public int countTotalSearchResults(String keyword) {
        try {
            String countSql = "SELECT COUNT(*) FROM [Blog] b, BlogCategory c\n"
                    + "WHERE b.blog_category = c.id AND b.status = 1 AND (\n"
                    + "    b.blog_title LIKE ? OR\n"
                    + "    b.blog_body1 LIKE ? OR\n"
                    + "    c.category_name LIKE ?\n"
                    + ")";

            PreparedStatement countStatement = connection.prepareStatement(countSql);
            String likeKeyword = "%" + keyword + "%";
            countStatement.setString(1, likeKeyword);
            countStatement.setString(2, likeKeyword);
            countStatement.setString(3, likeKeyword);

            ResultSet countResult = countStatement.executeQuery();
            if (countResult.next()) {
                return countResult.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void deleteBlogsByIds(String[] blogIds) {
        try {
            StringBuilder deleteSql = new StringBuilder("DELETE FROM Blog WHERE id IN (");

            // Appending placeholders for each ID
            for (int i = 0; i < blogIds.length; i++) {
                deleteSql.append("?");
                if (i < blogIds.length - 1) {
                    deleteSql.append(",");
                }
            }

            deleteSql.append(")");

            try (PreparedStatement statement = connection.prepareStatement(deleteSql.toString())) {
                // Setting values for each placeholder
                for (int i = 0; i < blogIds.length; i++) {
                    statement.setInt(i + 1, Integer.parseInt(blogIds[i]));
                }

                // Execute the delete statement
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        BlogDAO blogCategoryDAO = new BlogDAO();
        List<String> categoryNames = blogCategoryDAO.getAllCategoryNames();
        System.out.println("All Category Names: " + categoryNames);
        String categoryNameToConvert = "Giảm giá";
        int categoryId = blogCategoryDAO.getCategoryIdByName(categoryNameToConvert);
        System.out.println("ID for category '" + categoryNameToConvert + "': " + categoryId);

        Blog blog = blogCategoryDAO.getBlogById("26");
        System.out.println(blog.getBanner());
    }

}
