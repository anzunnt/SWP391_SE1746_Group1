package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author FPT University - PRJ301
 */
public class DBContext {

    protected Connection connection;
    public DBContext()
    {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName= FS_Thien";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}

