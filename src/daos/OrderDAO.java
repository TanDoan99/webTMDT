package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Order;
import utils.DBConnectionUtil;

public class OrderDAO extends AbstractDAO {
	public void addItem(Order order) {
		int result = 0;
		System.out.println(order.getUpdateDate());
		con=DBConnectionUtil.getConnection();
		String sql=" INSERT INTO  orders(total_money,payment_method,discount,create_by) values(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, order.getTotalMoney());
			pst.setString(2, order.getPaymentMethod());
			pst.setFloat(3, order.getDiscount());
			pst.setInt(4, order.getCreateBy());
		
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConnectionUtil.close(rs, st, con);
		}
		
	}

	public List<Order> findAll() {
		List<Order> orderList = new ArrayList<Order>();
		con=DBConnectionUtil.getConnection();
		String sql="select * from orders ";
		try {
			st=con.createStatement();
			rs= st.executeQuery(sql);
			while (rs.next()) {
				Order  order = new Order(rs.getInt("id"),
						rs.getInt("total_money"),
						rs.getString("payment_method"),
						rs.getFloat("discount"));
				orderList.add(order);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return orderList;
	}



	public Order getItem(int orderId) {
		Order order = new Order();
		con=DBConnectionUtil.getConnection();
		String sql="select * from orders where id=?";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, orderId);
			rs= pst.executeQuery();
			while (rs.next()) {
				 order = new Order(rs.getInt("id"),rs.getInt("total_money"),rs.getTimestamp("create_date"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return order;
	}

	public List<Order> findList(int userId) {
		List<Order> list=new ArrayList<>();
		con=DBConnectionUtil.getConnection();
		String sql="select * from orders where create_by =? ";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, userId);
			rs= pst.executeQuery();
			while (rs.next()) {
				Order  order = new Order(rs.getInt("id"),rs.getInt("total_money"),rs.getTimestamp("create_date"),rs.getFloat("discount"));
				list.add(order);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;	
	}
	
	public int numberOfItems() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		String sql = " SELECT COUNT(*) AS count FROM orders ";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);

			if (rs.next()) {
				count = rs.getInt("count");

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);

		}
		return count;
	}

	public List<Order> getByCategoryPagination(int offset, int perPage) {
		List<Order> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT id,total_money,payment_method,discount,create_date,create_by from orders AS o  ORDER BY id DESC LIMIT ?, ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, perPage);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				Order order = new Order(rs.getInt("id"),
						rs.getInt("total_money"),
						rs.getString("payment_method"),
						rs.getFloat("discount"),
						rs.getInt("create_by"),
						rs.getTimestamp("create_date"));

				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;
	}


}
