package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Cart;
import models.Jewelry;
import models.OrderDetail;
import utils.DBConnectionUtil;

public class OrderDetailDAO extends AbstractDAO {

	public int addItem(OrderDetail orderDetail) {
		int result = 0;
		con=DBConnectionUtil.getConnection();
		String sql=" INSERT INTO  order_details(order_id,product_id,quantity) values(?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, orderDetail.getOrder().getId());
			pst.setInt(2, orderDetail.getProduct().getId());
			pst.setInt(3, orderDetail.getQuantity());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConnectionUtil.close(rs, st, con);
		}
		return result;
	}


	public List<Cart> findByOrderId(int orderId) {
		List<Cart> list=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="select * from order_details where order_id = ? ";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, orderId);
			rs= pst.executeQuery();
			while (rs.next()) {
				Cart  orderDetail = new Cart(new Jewelry(rs.getInt("product_id")),rs.getInt("quantity"));
				list.add(orderDetail);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;	
	}


	public int addItem(Cart orderDetail) {
		int result = 0;
		con=DBConnectionUtil.getConnection();
		String sql=" INSERT INTO  order_details(order_id,product_id,quantity) values(?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, orderDetail.getOrder().getId());
			pst.setInt(2, orderDetail.getProduct().getId());
			pst.setInt(3, orderDetail.getNumber());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConnectionUtil.close(rs, st, con);
		}
		return result;
		
	}

}
