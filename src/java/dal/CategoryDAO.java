/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    public static void main(String[] args) {
        CategoryDAO cd = new CategoryDAO();
        Category c = cd.getCategoryByName("Áo Sơ Mi Nữ");
        System.out.println(c.toString());
    }

    public Category getCategoryByIdProduct(int id) {
        String sql = "SELECT c.id, c.name, c.[Image], cp.[CreatedAt], cp.[CreatedBy], cp.[ModifiedAt], cp.[ModifiedBy]\n"
                + "FROM Product p\n"
                + "INNER JOIN CategoryProduct cp ON p.ID = cp.ProductId\n"
                + "INNER JOIN Category c ON cp.CategoryId = c.Id\n"
                + "WHERE p.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM [FS_Thien].[dbo].[Category] WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Category getCategoryByName(String name) {
        String sql = "SELECT * FROM [FS_Thien].[dbo].[Category] WHERE name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category p = new Category(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalCategory() {
        String sql = "select count(*) from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Category> pagingCategory(int index, int num) {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category order by id offset ? rows fetch next " + num + " rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category p = new Category(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //delete Category by Id of Category
    public void deleteCategory(int id) {
        String sql = "DELETE FROM [dbo].[Category]\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //delete Category by Id of product
    public void deleteCategoryByProductId(int id) {
        String sql = "DELETE FROM [dbo].[CategoryProduct]\n"
                + "      WHERE [ProductId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(String name, String image, String createdAt, int createdBy,
            String modifiedAt, int modifiedBy) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([name]\n"
                + "           ,[Image]\n"
                + "           ,[CreatedAt]\n"
                + "           ,[CreatedBy]\n"
                + "           ,[ModifiedAt]\n"
                + "           ,[ModifiedBy])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, createdAt);
            st.setInt(4, createdBy);
            st.setString(5, modifiedAt);
            st.setInt(6, modifiedBy);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String name, String image,
            String modifiedAt, int modifiedBy, int id) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [name] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[ModifiedAt] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + " WHERE [Id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, modifiedAt);
            st.setInt(4, modifiedBy);
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCateProduct(int cid, String ModifiedAt,
            int modifiedBy, int pid) {
        String sql = "UPDATE [dbo].[CategoryProduct]\n"
                + "   SET [CategoryId] = ?\n"
                + "      ,[ModifiedAt] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + " WHERE [ProductId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setString(2, ModifiedAt);
            st.setInt(3, modifiedBy);
            st.setInt(4, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertCateProduct(int pid, int cid, String createdAt, int createdBy,
            String modifiedAt, int modifiedBy) {
        String sql = "INSERT INTO [dbo].[CategoryProduct]\n"
                + "           ([ProductId]\n"
                + "           ,[CategoryId]\n"
                + "           ,[CreatedAt]\n"
                + "           ,[CreatedBy]\n"
                + "           ,[ModifiedAt]\n"
                + "           ,[ModifiedBy])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, cid);
            st.setString(3, createdAt);
            st.setInt(4, createdBy);
            st.setString(5, modifiedAt);
            st.setInt(6, modifiedBy);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
