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
public class user {
    
    private int id;
    private String fullname;
    private String username;
    private String password;
    private String code_verify;
    private String email;
    private String phone;
    private String image;
    private Date dob;
    private String address;
    private int status;
    private String created_on;
    private int created_by;
    private int modified_by;
    private String modified_on;

    public user() {
    }

    public user(int id, String fullname, String username, String password, String code_verify, String email, String phone, String image, Date dob, String address, int status, String created_on, int created_by, int modified_by, String modified_on) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.code_verify = code_verify;
        this.email = email;
        this.phone = phone;
        this.image = image;
        this.dob = dob;
        this.address = address;
        this.status = status;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getCode_verify() {
        return code_verify;
    }

    public void setCode_verify(String code_verify) {
        this.code_verify = code_verify;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
        return "user{" + "id=" + id + ", fullname=" + fullname + ", username=" + username + ", password=" + password + ", code_verify=" + code_verify + ", email=" + email + ", phone=" + phone + ", image=" + image + ", dob=" + dob + ", address=" + address + ", status=" + status + ", created_on=" + created_on + ", created_by=" + created_by + ", modified_by=" + modified_by + ", modified_on=" + modified_on + '}';
    }
    
    
    
}
