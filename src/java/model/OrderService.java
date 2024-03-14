package model;

import java.util.List;

public interface OrderService {

	public String paymentSuccess(String userName, double paidAmount);

	public boolean addOrder(Order order);

	public boolean addTransaction(Transactions transaction);

	public int countSoldItem(String prodId);

	public List<Order> getAllOrders();

	public List<Order> getOrdersByUserId(String emailId);

	public List<OrderDetails> getAllOrderDetails(String userEmailId);

	public String shipNow(String orderId, String prodId);
}
