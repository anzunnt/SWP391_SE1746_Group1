/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import model.user;
import java.util.List;

/**
 *
 * @author anhdu
 */
public class userDAO extends DBContext{
    
    private final EnCryptPassword ep = new EnCryptPassword();
    
    public List<user> GetAllUsers() {
        List<user> users = new ArrayList<>();
        String sql = "select * from [user]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                user u = new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getString(15));
                users.add(u);
            }
        }
        catch (SQLException e){
            
        }
        
        return users;
    }
    
    public user GetUserByUsername(String username) {
        String sql =  "select * from [user] where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                return new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getString(15));
                
            }
        }
        catch (SQLException e){}
        return null;
    }
    
    public user GetUserById(int id) {
        String sql =  "select * from [user] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                return new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getString(15));
                
            }
        }
        catch (SQLException e){}
        return null;
    }
    
    public void InsertUser(user u) {
        String sql = "insert into [dbo].[user] ([full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on])\n" +
                        "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getFullname());
            st.setString(2, u.getUsername());
            st.setString(3, ep.hashPassword(u.getPassword()));
            st.setString(4, u.getCode_verify());
            st.setString(5, u.getEmail());
            st.setString(6, u.getPhone());
            st.setString(7, u.getImage());
            st.setDate(8, u.getDob());
            st.setString(9, u.getAddress());
            st.setInt(10, u.getStatus());
            st.setString(11, u.getCreated_on());
            st.setInt(12, u.getCreated_by());
            st.setInt(13, u.getModified_by());
            st.setString(14, u.getModified_on());
            st.executeUpdate();
        }
        catch(SQLException e){}
    }
    
    public void UpdateUser(String fullname, String username, String password, String code_verify, String email, String phone, String image, Date dob, String address, int status, String created_on, int created_by, int modified_by, String modified_on, int id) {
        String sql = "update [dbo].[user] set [full_name]=?, [username]=?, [password]=?, [code_verify]=?, [email]=?, [phone]=?, [image]=?, [dob]=?, [address]=?, [status]=?, [created_on]=?, [created_by]=?, [modified_by]=?, [modified_on]=?\n" +
                        "where [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, username);
            st.setString(3, ep.hashPassword(password));
            st.setString(4, code_verify);
            st.setString(5, email);
            st.setString(6, phone);
            st.setString(7, image);
            st.setDate(8, dob);
            st.setString(9, address);
            st.setInt(10, status);
            st.setString(11, created_on);
            st.setInt(12, created_by);
            st.setInt(13, modified_by);
            st.setString(14, modified_on);
            st.setInt(15, id);
            st.executeUpdate();
        }
        catch(SQLException e){}
    }
    
    public int getNumberUser() {
        String sql = "select count(*) from  [dbo].[user]";
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
    
    public List<user> pagingUser(int index, int num) {
        List<user> list = new ArrayList<>();
        String sql = "select * from [user] order by id offset ? rows fetch next " + num + " rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                user u = new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getString(15));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        userDAO ud = new userDAO();
        List<user> list = ud.pagingUser(1, 5);
        for (user u : list) {
            System.out.println(u.getFullname());
        }
    }
    
}
