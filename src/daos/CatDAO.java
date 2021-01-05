package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Jewelry;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class CatDAO extends AbstractDAO {
	public List<Category> findAll() {
		List<Category> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM categories";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Category cat = new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"), rs.getString("description"));
				list.add(cat);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;

	}
	public int add(Category cat) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO categories (name, parent_id, description) VALUE(?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, cat.getName());
			pst.setInt(2, cat.getParent_id());
			pst.setString(3, cat.getDescription());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public int del(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM categories WHERE id=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public Category findEdit(int id) {
		Category cat = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM categories WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				cat = new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"), rs.getString("description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return cat;
	}

	public int edit(Category cat) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE categories SET name = ?, parent_id = ?, description = ? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, cat.getName());
			pst.setInt(2, cat.getParent_id());
			pst.setString(3, cat.getDescription());
			pst.setInt(4, cat.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public Category getItem(int catid) {
		Category cat = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM categories WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, catid);
			rs = pst.executeQuery();
			if (rs.next()) {
				cat = new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"), rs.getString("description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return cat;
	}

	public List<Jewelry> getItemDetail(int cat_id) {
		List<Jewelry> list = new ArrayList<Jewelry>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM products WHERE id_category = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cat_id);
			rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at")));
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return list;
	}

	public List<Category> getItemPagination(int offset) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM  categories ORDER BY id ASC LIMIT ?, ? ";
		List<Category> listItems = new ArrayList<Category>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Category cat = new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"), rs.getString("description"));
				listItems.add(cat);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public List<Category> searchNameCat(Category cat) {
		List<Category> listCat = new ArrayList<Category>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM categories WHERE 1";
		if (!"".equals(cat.getName())) {
			sql += " AND name LIKE ? ";
		}

		try {
			pst = con.prepareStatement(sql);
			if (!"".equals(cat.getName())) {
				pst.setString(1, "%" + cat.getName() + "%");
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				Category scat = new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"), rs.getString("description"));
				listCat.add(scat);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listCat;

	}
	public List<Category> findCategoryParentById(int parentId) {
		List<Category> list=new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql="select * from categories where parent_id=? ";
		try {
			pst=con.prepareStatement(sql);
			pst.setInt(1, parentId);
			rs= pst.executeQuery();
			while (rs.next()) {
				Category  cat = new Category(rs.getInt("id"), rs.getString("name"),rs.getInt("parent_id"), rs.getString("description"));
				list.add(cat);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;
	}

}

