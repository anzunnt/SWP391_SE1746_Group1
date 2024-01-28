/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Product {
    private int id;
    private String name,description;
    private float basePrice,price,discount;
    private int quantity;
    private String createdAt, modifiedAt, publishedAt;
    private byte state;
    private String startsAt, endsAt;
    private String style;
    private int createdBy, modifiedBy;

    public Product() {
    }

    public Product(int id, String name, String description, float basePrice, float price, float discount, int quantity, String createdAt, String modifiedAt, String publishedAt, byte state, String startsAt, String endsAt, String style, int createdBy, int modifiedBy) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.basePrice = basePrice;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.publishedAt = publishedAt;
        this.state = state;
        this.startsAt = startsAt;
        this.endsAt = endsAt;
        this.style = style;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(float basePrice) {
        this.basePrice = basePrice;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(String modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public String getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(String publishedAt) {
        this.publishedAt = publishedAt;
    }

    public byte getState() {
        return state;
    }

    public void setState(byte state) {
        this.state = state;
    }

    public String getStartsAt() {
        return startsAt;
    }

    public void setStartsAt(String startsAt) {
        this.startsAt = startsAt;
    }

    public String getEndsAt() {
        return endsAt;
    }

    public void setEndsAt(String endsAt) {
        this.endsAt = endsAt;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", basePrice=" + basePrice + ", price=" + price + ", discount=" + discount + ", quantity=" + quantity + ", createdAt=" + createdAt + ", modifiedAt=" + modifiedAt + ", publishedAt=" + publishedAt + ", state=" + state + ", startsAt=" + startsAt + ", endsAt=" + endsAt + ", style=" + style + ", createdBy=" + createdBy + ", modifiedBy=" + modifiedBy + '}';
    }
    
}
