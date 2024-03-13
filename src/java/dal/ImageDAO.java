/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.http.Part;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Image;

/**
 *
 * @author admin
 */
public class ImageDAO extends DBContext{
    public List<Image> getAllImageByID(int id) {
        List<Image> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductImage WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image p = new Image(rs.getInt(1), rs.getString(2),
                        rs.getInt(3), rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7), rs.getString(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Lấy tên file từ phần tải lên
    public String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public void insert(String Image, int ProductId, String CreatedAt, int CreatedBy,
            String ModifiedAt, int ModifiedBy, String ImageDescription) {
        String sql = "INSERT INTO [dbo].[ProductImage]\n"
                + "           ([Image]\n"
                + "           ,[ProductId]\n"
                + "           ,[CreatedAt]\n"
                + "           ,[CreatedBy]\n"
                + "           ,[ModifiedAt]\n"
                + "           ,[ModifiedBy]\n"
                + "           ,[ImageDescription])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Image);
            st.setInt(2, ProductId);
            st.setString(3, CreatedAt);
            st.setInt(4, CreatedBy);
            st.setString(5, ModifiedAt);
            st.setInt(6, ModifiedBy);
            st.setString(7, ImageDescription);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //delete Image by Id of Image
    public void deleteImage(int id) {
        String sql = "DELETE FROM [dbo].[ProductImage]\n"
                + "      WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    //delete Image by Id of Product
    public void deleteImageByProductId(int id) {
        String sql = "DELETE FROM [dbo].[ProductImage]\n"
                + "      WHERE [ProductId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     //doc tu bang product theo id image
    public Image getProductByIdImage(int id) {
        String sql = "SELECT * FROM [FS_Thien].[dbo].[ProductImage] WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Image(rs.getInt(1), rs.getString(2),
                        rs.getInt(3), rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7), rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
