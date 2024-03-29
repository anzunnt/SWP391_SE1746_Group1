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
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext {

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        String txt = "Polo   In";
        dao.searchByTxt(txt);
    }

    //doc toan bo tu bang Product
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getFloat(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getByte(11), rs.getString(12),
                        rs.getString(13), rs.getString(14), rs.getInt(15),
                        rs.getInt(16));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //delete a product
    public void deleteProduct(int id) {
        //xoa lien ket cua product voi image
        ImageDAO imd = new ImageDAO();
        imd.deleteImageByProductId(id);
        //xoa lien ket cua product voi category
        CategoryDAO cd = new CategoryDAO();
        cd.deleteCategoryByProductId(id);
        //xoa product
        String sql = "DELETE FROM [dbo].[Product]\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update a product
    public void update(int id, String name, String description, float basePrice, float price, float discount, int quantity,
            String modifiedAt, String publishedAt, byte state, String startsAt, String endsAt,
            String style, int modifiedBy) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[BasePrice] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Discount] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[ModifiedAt] = ?\n"
                + "      ,[PublishedAt] = ?\n"
                + "      ,[State] = ?\n"
                + "      ,[StartsAt] = ?\n"
                + "      ,[EndsAt] = ?\n"
                + "      ,[Style] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + " WHERE Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setFloat(3, basePrice);
            st.setFloat(4, price);
            st.setFloat(5, discount);
            st.setInt(6, quantity);
            st.setString(7, modifiedAt);
            st.setString(8, publishedAt);
            st.setByte(9, state);
            st.setString(10, startsAt);
            st.setString(11, endsAt);
            st.setString(12, style);
            st.setInt(13, modifiedBy);
            st.setInt(14, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    public Product getMost() {
//        String sql = "select top 1 * from product\n"
//                + "order by pid desc";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new Product(rs.getInt("pid"),
//                        rs.getString("pname"),
//                        rs.getFloat("price"),
//                        rs.getString("state"),
//                        rs.getString("image"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
    
    //doc tu bang product theo id
    public Product getProductById(int id) {
        String sql = "select * from Product where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getFloat(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getByte(11), rs.getString(12),
                        rs.getString(13), rs.getString(14), rs.getInt(15),
                        rs.getInt(16));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //doc tu bang product theo Name
    public Product getProductByName(String name) {
        String sql = "select * from Product where Name=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getFloat(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getByte(11), rs.getString(12),
                        rs.getString(13), rs.getString(14), rs.getInt(15),
                        rs.getInt(16));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchByTxt(String txt) {
        List<Product> list = new ArrayList<>();
        String[] words = txt.replaceAll("\\s\\s+", " ").toLowerCase().split("\\s");
        List<String> result = removeDuplicates(words);
        String sql = "select * from Product "
                + "where Name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (String word : result) {
                st.setString(1, "%" + word + "%");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getFloat(4), rs.getFloat(5), rs.getFloat(6),
                            rs.getInt(7), rs.getString(8), rs.getString(9),
                            rs.getString(10), rs.getByte(11), rs.getString(12),
                            rs.getString(13), rs.getString(14), rs.getInt(15),
                            rs.getInt(16));
                    if (!isDuplicate(list,p)) {
                        list.add(p);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<String> removeDuplicates(String[] inputArray) {
        List<String> result = new ArrayList<>();

        for (String word : inputArray) {
            if (!result.contains(word)) {
                // Nếu từ chưa tồn tại trong kết quả, thêm vào
                result.add(word);
            }
        }

        return result;
    }

    public boolean isDuplicate(List<Product> list, Product product) {
        // Kiểm tra xem sản phẩm có trong danh sách hay không qua ID
        for (Product existingProduct : list) {
            if (existingProduct.getId() == product.getId()) {
                return true; // Sản phẩm đã tồn tại trong danh sách
            }
        }
        return false; // Sản phẩm không tồn tại trong danh sách
    }

    public void insert(String name, String description, float basePrice, float price, float discount, int quantity,
            String createdAt, String modifiedAt, String publishedAt, byte state, String startsAt, String endsAt,
            String style, int createdBy, int modifiedBy) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([Name]\n"
                + "           ,[Description]\n"
                + "           ,[BasePrice]\n"
                + "           ,[Price]\n"
                + "           ,[Discount]\n"
                + "           ,[Quantity]\n"
                + "           ,[CreatedAt]\n"
                + "           ,[ModifiedAt]\n"
                + "           ,[PublishedAt]\n"
                + "           ,[State]\n"
                + "           ,[StartsAt]\n"
                + "           ,[EndsAt]\n"
                + "           ,[Style]\n"
                + "           ,[CreatedBy]\n"
                + "           ,[ModifiedBy])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setFloat(3, basePrice);
            st.setFloat(4, price);
            st.setFloat(5, discount);
            st.setInt(6, quantity);
            st.setString(7, createdAt);
            st.setString(8, modifiedAt);
            st.setString(9, publishedAt);
            st.setByte(10, state);
            st.setString(11, startsAt);
            st.setString(12, endsAt);
            st.setString(13, style);
            st.setInt(14, createdBy);
            st.setInt(15, modifiedBy);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalProduct() {
        String sql = "select count(*) from Product";
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

    public List<Product> pagingProduct(int index, int num) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by id offset ? rows fetch next " + num + " rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getFloat(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getByte(11), rs.getString(12),
                        rs.getString(13), rs.getString(14), rs.getInt(15),
                        rs.getInt(16));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
