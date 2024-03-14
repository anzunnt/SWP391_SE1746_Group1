/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;


/**
 *
 * @author anhdu
 */
public class Admin {
    
    private int id;
    private String username;
    private String password;
    private String created_on;
    private int created_by;
    private int modified_by;
    private String modified_on;

    public Admin() {
    }

    public Admin(int id, String username, String password, String created_on, int created_by, int modified_by, String modified_on) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.created_on = created_on;
        this.created_by = created_by;
        this.modified_by = modified_by;
        this.modified_on = modified_on;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreated_on() {
        return created_on;
    }

    public void setCreated_on(String created_on) {
        this.created_on = created_on;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getModified_by() {
        return modified_by;
    }

    public void setModified_by(int modified_by) {
        this.modified_by = modified_by;
    }

    public String getModified_on() {
        return modified_on;
    }

    public void setModified_on(String modified_on) {
        this.modified_on = modified_on;
    }

    @Override
    public String toString() {
        return "Admin{" + "id=" + id + ", username=" + username + ", password=" + password + ", created_on=" + created_on + ", created_by=" + created_by + ", modified_by=" + modified_by + ", modified_on=" + modified_on + '}';
    }
    
    
    
}
