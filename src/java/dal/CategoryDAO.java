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
public class CategoryDAO extends DBContext{
    public static void main(String[] args) {
        //List<ProductMenu> p = dao.getTop4RelateProductByCategory(1);
        //System.out.println(p);
    }
    public Category getCategoryById(int id) {
        String sql = "SELECT c.id,c.name,c.[Image] FROM Product p\n"
                + "	INNER JOIN CategoryProduct cp ON p.ID = cp.ProductId\n"
                + "	INNER JOIN Category c ON cp.CategoryId = c.Id WHERE p.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
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
                Category p = new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
