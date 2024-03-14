package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.DBUtil;
import model.Order;
import model.OrderDetails;
import model.Transactions;

/**
 *
 * @author Anh Dat
 */
public class OrderDAO extends DBContext{
    
    public static void main(String[] args) {
        OrderDAO or = new OrderDAO();
        List<Order> orders = or.getAllOrders();
        for (Order order : orders) {
            System.out.println(order.getOrderId());
        }
    }
    public String paymentSuccess(String userName, double total) {
    String status = "Order Placement Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        // Thực hiện cập nhật trạng thái đơn hàng thành công trong cơ sở dữ liệu
        ps = con.prepareStatement("UPDATE order_detail SET status = 'Success' WHERE username = ? AND total = ?");
        ps.setString(1, userName);
        ps.setDouble(2, total);
        
        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
            status = "Order Placement Successful!";
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return status;
}

//	public String paymentSuccess(String userName, double total) {
//		String status = "Order Placement Failed!";
//
//		List<LineItem> lineItems = new ArrayList<>();
//		lineItems = new lineItem().getTotalCurrencyFormat(userName);
//
//		if (LineItems.size() == 0)
//			return status;
//
//		Transactions transaction = new Transactions(userName, total);
//		boolean ordered = false;
//
//		String transactionId = transaction.getTransactionId();
//
//		// System.out.println("Transaction: "+transaction.getTransactionId()+"
//		// "+transaction.getTransAmount()+" "+transaction.getUserName()+"
//		// "+transaction.getTransDateTime());
//
//		for (LineItems item : lineItems) {
//
//			double amount = new Product().getProductPrice(item.getProdId()) * item.getQuantity();
//
//			Order order = new Order(transactionId, item.getProdId(), item.getQuantity(), amount);
//
//			ordered = addOrder(order);
//			if (!ordered)
//				break;
//			else {
//				ordered = new Cart().removeAProduct(item.getUserId(), item.getProdId());
//			}
//
//			if (!ordered)
//				break;
//			else
//				ordered = new ProductDAO().sellNProduct(item.getProdId(), item.getQuantity());
//
//			if (!ordered)
//				break;
//		}
//
//		if (ordered) {
//			ordered = new Order().addTransaction(transaction);
//			if (ordered) {
//
//				MailMessage.transactionSuccess(userName, new userDAO().getFName(userName),
//						transaction.getTransactionId(), transaction.getTransAmount());
//
//				status = "Order Placed Successfully!";
//			}
//		}
//
//		return status;
//	}
        
    public List<Order> getAllOrders() {
    List<Order> orderList = new ArrayList<>();

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        ps = con.prepareStatement("SELECT * FROM order_table");
        rs = ps.executeQuery();

        while (rs.next()) {
            Order order = new Order();
            order.setOrderId(rs.getString("orderid"));
            order.setProductId(rs.getString("prodid"));
            order.setUserId(rs.getInt("userId"));
            order.setAddress(rs.getString("address"));
            order.setPhone(rs.getInt("phone"));
            orderList.add(order);
        }
    } catch (SQLException e) {
        e.printStackTrace();

    }

    return orderList;
}


public boolean addOrder(Order order) {
    boolean flag = false;

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("INSERT INTO order_table (orderId, productId, customerName, address, phone) VALUES (?, ?, ?, ?, ?)");

        ps.setString(1, order.getOrderId());
        ps.setString(2, order.getProductId());
        ps.setInt(3, order.getUserId());
        ps.setString(4, order.getAddress());
        ps.setInt(5, order.getPhone());

        int k = ps.executeUpdate();

        if (k > 0)
            flag = true;

    } catch (SQLException e) {
        flag = false;
        e.printStackTrace();
    }

    return flag;
}


public boolean addTransaction(Transactions transaction) {
		boolean flag = false;
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement("insert into transactions values(?,?,?,?)");

			ps.setString(1, transaction.getTransactionId());
			ps.setString(2, transaction.getUserName());
			ps.setTimestamp(3, transaction.getTransDateTime());
			ps.setDouble(4, transaction.getTransAmount());

			int k = ps.executeUpdate();
			if (k > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public List<OrderDetails> getOrdersByUserId(String emailId) {
    List<OrderDetails> orderList = new ArrayList<>();

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        ps = con.prepareStatement(
                "SELECT * FROM OrderDetails WHERE username=?");
        ps.setString(1, emailId);
        rs = ps.executeQuery();

        while (rs.next()) {
            OrderDetails order = new OrderDetails();
            order.setOrderId(rs.getInt("OrderId"));
            order.setProductName(rs.getString("ProductName"));
            order.setTime(rs.getTimestamp("time"));
            order.setQuantity(rs.getInt("quantity"));
            order.setTotal(rs.getDouble("total"));
            order.setShipped(rs.getInt("shipped"));

            orderList.add(order);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return orderList;
}

    public List<OrderDetails> getAllOrderDetails(String userEmailId) {
            List<OrderDetails> orderList = new ArrayList<>();

            Connection con = DBUtil.provideConnection();

            PreparedStatement ps = null;
            ResultSet rs = null;

            try {

                ps = con.prepareStatement(
                        "SELECT o.orderid as orderid, p.pname as pname, o.quantity as qty, o.total as total, o.shipped as shipped, t.time as time " +
                                "FROM orders o, product p, transactions t " +
                                "WHERE o.orderid = t.transid AND o.orderid = t.transid AND p.pid = o.prodid AND t.username = ?");
                ps.setString(1, userEmailId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    OrderDetails order = new OrderDetails();
                    order.setOrderId(rs.getInt("orderid"));
                    order.setProductName(rs.getString("pname"));
                    order.setTime(rs.getTimestamp("time"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setTotal(rs.getDouble("total"));
                    order.setShipped(rs.getInt("shipped"));
                    orderList.add(order);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return orderList;
}

	
	public String shipNow(String orderId, String prodId) {
		String status = "FAILURE";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("update orders set shipped=1 where orderid=? and prodid=? and shipped=0");

			ps.setString(1, orderId);
			ps.setString(2, prodId);

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "Order Has been shipped successfully!!";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);

		return status;
	}

}     