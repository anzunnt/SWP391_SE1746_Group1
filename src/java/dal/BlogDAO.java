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
            String sql = "    select * from [Blog] b , BlogCategory c\n"
                    + "  where b.blog_category = c.id ";
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

    public void insertNewBlog(String banner, String tilte, String cateId, String body, String img, String dob) {
        try {
            String sql = "   insert into Blog ([banner],[blog_title] ,[blog_category] ,[blog_body1],[img1] ,[create_date] ,[viewCount] ,[status])\n"
                    + "  values (?,?,?,?,?,getdate(),0,1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, banner);
            stm.setString(2, tilte);
            stm.setString(3, cateId);
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


}
