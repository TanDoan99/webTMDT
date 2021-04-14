package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.User;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class UserDAO extends AbstractDAO {

	public List<User> findAll() {
		List<User> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM users ORDER BY id DESC ";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				User user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("email"), rs.getString("address"), rs.getString("telephone_number"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return list;
	}

	public int add(User user) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO users (username,password,fullname,email,address,telephone_number) VALUE (?,?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getAddress());
			pst.setString(6, user.getTelephone_number());
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}

	public boolean hasUser(String username) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM users WHERE username= ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return false;
	}

	public User getItem(int id) {
		User item = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT id, username, password, fullname, email, address, telephone_number FROM users WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String telephone_number = rs.getString("telephone_number");
				item = new User(username, password, fullname, email, address, telephone_number);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return item;
	}

	public int editItem(User users) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE users SET password=?, fullname=?, email=?, address=?, telephone_number=?, update_by =? , create_date =? , update_date = ? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, users.getPassword());
			pst.setString(2, users.getFullname());
			pst.setString(3, users.getEmail());
			pst.setString(4, users.getAddress());
			pst.setString(5, users.getTelephone_number());
			pst.setInt(6, users.getUpdateBy());
			pst.setTimestamp(7, users.getCreateDate());
			pst.setTimestamp(8, users.getUpdateDate());
			pst.setInt(9, users.getId());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}
	public void editItems(User user) {
		int result = 0;
		con=DBConnectionUtil.getConnection();
		String sql=" UPDATE users SET fullname = ?, address =?, telephone_number =?, update_by =? , create_date =? , update_date = ? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getFullname());
			pst.setString(2, user.getAddress());
			pst.setString(3, user.getTelephone_number());
			pst.setInt(4, user.getId());
			pst.setTimestamp(5, user.getCreateDate());
			pst.setTimestamp(6, user.getUpdateDate());
			pst.setInt(7, user.getId());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnectionUtil.close(rs, st, con);
		}
		
	}

	public int delItem(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM users WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);

			pst.setInt(1, id);

			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}

	public User findUsernameAndPassword(String username, String password) {
		User user = null;
		con = DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM users WHERE username = ? AND password = ? ";
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"),rs.getString("email"), rs.getString("address"), rs.getString("telephone_number"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return user;
	}

	public List<User> getItemPagination(int offset) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM  users ORDER BY id DESC LIMIT ?, ? ";
		List<User> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				User us = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"),rs.getString("email"),rs.getString("address"),rs.getString("telephone_number"));
				listItems.add(us);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public User login(String username, String password) {
		User user = null;
		con=DBConnectionUtil.getConnection();
		String sql="select id, username, fullname, address, email, telephone_number, create_date, create_by"
				+ " FROM users  where username = ? && password = ?"; 
		try {
			pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs= pst.executeQuery();
			while (rs.next()) {
				
			user = new User(rs.getInt("id"),rs.getString("username"),rs.getString("fullname"),rs.getString("address"),rs.getString("email"),rs.getString("telephone_number"),rs.getInt("create_by"),rs.getTimestamp("create_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return user;
	}


}
