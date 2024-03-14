package model;


import java.sql.Timestamp;

public class OrderDetails {

    private int OrderId; 
    private String ProductName; 
    private int quantity;
    private double total; 
    private Timestamp time;
    private int shipped;


    public OrderDetails() {
    }

    public OrderDetails(int OrderId, String ProductName, int quantity, double total, Timestamp time, int shipped) {
        this.OrderId = OrderId;
        this.ProductName = ProductName;
        this.quantity = quantity;
        this.total = total;
        this.time = time;
        this.shipped = shipped;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getShipped() {
        return shipped;
    }

    public void setShipped(int shipped) {
        this.shipped = shipped;
    }

}