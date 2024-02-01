/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Blog {

    int id;
    String banner;
    String blog_title;
    String blog_category;
    String blog_body1;
    String img1;
  
    java.util.Date create_date;
    int viewCount;
    boolean status;
    BlogCategory blogCategory;

    public Blog(int id, String banner, String blog_title, String blog_category, String blog_body1, String img1, java.util.Date create_date, int viewCount, boolean status, BlogCategory blogCategory) {
        this.id = id;
        this.banner = banner;
        this.blog_title = blog_title;
        this.blog_category = blog_category;
        this.blog_body1 = blog_body1;
        this.img1 = img1;
        this.create_date = create_date;
        this.viewCount = viewCount;
        this.status = status;
        this.blogCategory = blogCategory;
    }



    public Blog() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getBlog_title() {
        return blog_title;
    }

    public void setBlog_title(String blog_title) {
        this.blog_title = blog_title;
    }

    public String getBlog_category() {
        return blog_category;
    }

    public void setBlog_category(String blog_category) {
        this.blog_category = blog_category;
    }

    public String getBlog_body1() {
        return blog_body1;
    }

    public void setBlog_body1(String blog_body1) {
        this.blog_body1 = blog_body1;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }


    public java.util.Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(java.util.Date create_date) {
        this.create_date = create_date;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public BlogCategory getBlogCategory() {
        return blogCategory;
    }

    public void setBlogCategory(BlogCategory blogCategory) {
        this.blogCategory = blogCategory;
    }

}