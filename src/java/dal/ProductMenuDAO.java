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
import model.ProductMenu;

/**
 *
 * @author admin
 */
public class ProductMenuDAO extends DBContext {

    public static void main(String[] args) {
        ProductMenuDAO dao = new ProductMenuDAO();
        List<ProductMenu> p = dao.getTop4RelateProductByCategory(1);
        System.out.println(p);
    }

    //doc toan bo tu bang Product
    public List<ProductMenu> getAllProductMenu() {
        List<ProductMenu> list = new ArrayList<>();
        String sql = "WITH RankedImages AS (\n"
                + "SELECT p.Id,p.Name,p.Price,p.Discount,p.Quantity,p.State,pi.Image,pi.ImageDescription,\n"
                + "ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY pi.id) AS ImageRank\n"
                + "FROM Product p LEFT JOIN ProductImage pi ON p.Id = pi.ProductId\n"
                + ")SELECT Id,Name,Price,Discount,Quantity,State,Image,ImageDescription FROM RankedImages WHERE ImageRank = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductMenu p = new ProductMenu(rs.getInt(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4),
                        rs.getInt(5), rs.getByte(6), rs.getString(7),
                        rs.getString(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //doc toan bo tu bang Product
    public List<ProductMenu> getAllProductDetailByID(int id) {
        List<ProductMenu> list = new ArrayList<>();
        String sql = "SELECT p.Id,p.Name,p.Price,p.Discount,p.Quantity,p.State,pi.Image,p.Description "
                + "FROM Product p LEFT JOIN ProductImage pi "
                + "ON p.Id = pi.ProductId WHERE p.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductMenu p = new ProductMenu(rs.getInt(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4),
                        rs.getInt(5), rs.getByte(6), rs.getString(7),
                        rs.getString(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductMenu> getTop4SaledProduct() {
        List<ProductMenu> list = new ArrayList<>();
        String sql = "WITH RankedImages AS (\n"
                + "SELECT p.Id,p.Name,p.Price,p.Discount,p.Quantity,p.State,pi.Image,pi.ImageDescription,\n"
                + "ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY pi.id) AS ImageRank\n"
                + "FROM Product p LEFT JOIN ProductImage pi ON p.Id = pi.ProductId\n"
                + ")SELECT TOP 4 Id,Name,Price,Discount,Quantity,State,Image,ImageDescription FROM RankedImages WHERE ImageRank = 1 ORDER BY discount desc;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductMenu p = new ProductMenu(rs.getInt(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4),
                        rs.getInt(5), rs.getByte(6), rs.getString(7),
                        rs.getString(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductMenu> getTop4PopularProduct() {
        List<ProductMenu> list = new ArrayList<>();
        String sql = "WITH RankedImages AS (\n"
                + "SELECT p.Id,p.Name,p.Price,p.Discount,p.Quantity,p.State,pi.Image,pi.ImageDescription,\n"
                + "ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY pi.id) AS ImageRank\n"
                + "FROM Product p LEFT JOIN ProductImage pi ON p.Id = pi.ProductId\n"
                + ")SELECT TOP 4 Id,Name,Price,Discount,Quantity,State,Image,ImageDescription FROM RankedImages WHERE ImageRank = 1 ORDER BY Quantity desc;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductMenu p = new ProductMenu(rs.getInt(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4),
                        rs.getInt(5), rs.getByte(6), rs.getString(7),
                        rs.getString(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductMenu> getTop4RelateProductByCategory(int cid) {
        List<ProductMenu> list = new ArrayList<>();
        String sql = "WITH RankedImages AS (SELECT p.Id, p.Name, p.Price, p.Discount, p.Quantity, p.State, pi.Image, pi.ImageDescription,\n"
                + "    ROW_NUMBER() OVER (PARTITION BY p.Id ORDER BY pi.Id) AS ImageRank FROM Product p \n"
                + "    LEFT JOIN ProductImage pi ON p.Id = pi.ProductId\n"
                + "	INNER JOIN CategoryProduct cp ON p.ID = cp.ProductId WHERE cp.CategoryId = ?\n"
                + ")\n"
                + "SELECT Top 4 Id,Name,Price,Discount,Quantity,State,Image,ImageDescription FROM RankedImages \n"
                + "WHERE \n"
                + "    ImageRank = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductMenu p = new ProductMenu(rs.getInt(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4),
                        rs.getInt(5), rs.getByte(6), rs.getString(7),
                        rs.getString(8));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
