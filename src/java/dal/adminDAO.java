/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Admin;

/**
 *
 * @author admin
 */
public class adminDAO extends DBContext {

    private final EnCryptPassword ep = new EnCryptPassword();

    public List<Admin> GetAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        String sql = "select * from [Admin]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admin a = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7));
                admins.add(a);
            }
        } catch (SQLException e) {

        }

        return admins;
    }

    public Admin GetAdminByUsername(String username) {
        String sql = "select * from [Admin] where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Admin GetAdminById(int id) {
        String sql = "select * from [Admin] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void InsertAdmin(String username, String password, String created_on, String created_by, String modified_by, String modified_on) {
        String sql = "insert into [dbo].[Admin] ([username], [password], [created_on], [created_by], [modified_by], [modified_on])\n" +
                "values (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, created_on);
            st.setInt(4, Integer.parseInt(created_by));
            st.setInt(5, Integer.parseInt(modified_by));
            st.setString(6, modified_on);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateAdmin(String username, String password, String created_on, int created_by, int modified_by, String modified_on, int id) {
        String sql = "update [dbo].[Admin] set [username]=?, [password]=?, [created_on]=?, [created_by]=?, [modified_by]=?, [modified_on]=?\n" +
                "where [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, modified_by);
            st.setString(4, modified_on);
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getNumberAdmin() {
        String sql = "select count(*) from  [dbo].[Admin]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Admin> pagingAdmin(int index, int num) {
        List<Admin> list = new ArrayList<>();
        String sql = "select * from [Admin] order by id offset ? rows fetch next " + num + " rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admin a = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//    public static void main(String[] args) {
//        adminDAO ad = new adminDAO();
////        List<Admin> list = ad.pagingAdmin(2, 5);
//        Admin a = ad.GetAdminById(6);
//        ad.UpdateAdmin("admin7", "777777", a.getCreated_on(), a.getCreated_by(), a.getModified_by(), a.getModified_on(), a.getId());
//    }

}
