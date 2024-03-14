package model;

public class Order {
    private String orderId;
    private String productId;
    private int userId; 
    private String address; // Thay adress bằng address
    private int phone; // Kiểu dữ liệu của phone có thể cần được điều chỉnh tùy theo yêu cầu

    public Order() {

    }

    public Order(String orderId, String productId, int userId, String address, int phone) {
        this.orderId = orderId;
        this.productId = productId;
        this.userId = userId;
        this.address = address;
        this.phone = phone;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

}