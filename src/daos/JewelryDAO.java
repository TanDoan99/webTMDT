package daos;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Comment;
import models.Jewelry;
import utils.DBConnectionUtil;
import utils.DefineUtil;
import utils.DefineUtilPublic;
import utils.DefineUtilPublicPro;

public class JewelryDAO extends AbstractDAO {

	public List<Jewelry> findAllJewelry() {
		List<Jewelry> listJewelry = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT s.*,c.name AS catName FROM songs AS s " + "INNER JOIN categories AS c "
				+ "ON s.cat_id=c.id " + "ORDER BY s.id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Jewelry jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("catName")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listJewelry.add(jewelry);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listJewelry;

	}

	public List<Jewelry> findAll() {
		List<Jewelry> listJewelry = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM products ORDER BY id ASC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Jewelry jewelry = new Jewelry(rs.getInt("id"), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listJewelry.add(jewelry);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listJewelry;

	}

	public List<Jewelry> findAllByIdAndNameOrderByNewsId(Jewelry jewelry) {
		List<Jewelry> listJewelry = new ArrayList<Jewelry>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT p.id, " +"p.id_category, "+"p.sizes, "+ "p.name AS jewelryName,"+"p.picture, "
				+ "p.price, " + "p.sale, " + "p.title, "+"p.highlight, " +"p.new_product, "+"p.detail, "+ "p.created_at, " + "p.updated_at, " 
				+ "c.name AS catName " + "FROM products AS p " + "INNER JOIN categories AS c "
				+ "ON c.id = p.id_category WHERE 1 ";
		// +"ORDER BY s.id DESC";
		if (!"".equals(jewelry.getName())) {
			sql += " AND p.name LIKE ? ";
		}
		if (jewelry.getId_category().getId() > 0) {
			sql += " AND p.id_category = ? ";
		}
		try {
			pst = con.prepareStatement(sql);
			if (jewelry.getId_category().getId() > 0 && !"".equals(jewelry.getName())) {
				pst.setString(1, "%" + jewelry.getName() + "%");
				pst.setInt(2, jewelry.getId_category().getId());
			} else {
				if (!"".equals(jewelry.getName()) && jewelry.getId_category().getId() == 0) {
					pst.setString(1, "%" + jewelry.getName() + "%");
				} else if ("".equals(jewelry.getName()) && jewelry.getId_category().getId() > 0) {
					pst.setInt(1, jewelry.getId_category().getId());
				}
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				Jewelry jewelrys = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("catName")), rs.getString("sizes"), rs.getString("jewelryName"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listJewelry.add(jewelrys);
			}
			System.out.println(listJewelry.size());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listJewelry;

	}

	public List<Jewelry> findNewPosts(int number) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT p.*, c.name AS cName FROM products p JOIN categories c ON p.id_category = c.id ORDER BY id DESC LIMIT ?";
		List<Jewelry> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, number);
			rs = pst.executeQuery();
			while (rs.next()) {
				Jewelry ObjItem = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("cName")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listItems.add(ObjItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}
	public List<Jewelry> getItemIdCat(int idcat) {
		ArrayList<Jewelry> listItems = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM products WHERE id_category= ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, idcat);
			rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String sizes = rs.getString("sizes");
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				Double price=rs.getDouble("price");
				int sale=rs.getInt("sale");
				String title = rs.getString("title");
				int highlight=rs.getInt("highlight");
				int new_product=rs.getInt("new_product");
				String detail=rs.getString("detail");
				Timestamp created_at = rs.getTimestamp("created_at");
				Timestamp updated_at = rs.getTimestamp("updated_at");

				Jewelry objItems = new Jewelry(id, sizes, name, picture, price, sale, title, highlight, new_product, detail, created_at, updated_at);
				listItems.add(objItems);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public Jewelry getDetail(int id) {
		Jewelry detailJewelry = null;
		con = DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM products WHERE id= ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				int idDe = rs.getInt("id");
				String sizes = rs.getString("sizes");
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				Double price=rs.getDouble("price");
				int sale=rs.getInt("sale");
				String title = rs.getString("title");
				int highlight=rs.getInt("highlight");
				int new_product=rs.getInt("new_product");
				String detail=rs.getString("detail");
				Timestamp created_at = rs.getTimestamp("created_at");
				Timestamp updated_at = rs.getTimestamp("updated_at");

				detailJewelry = new Jewelry(idDe, sizes, name, picture, price, sale, title, highlight, new_product, detail, created_at, updated_at);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return detailJewelry;
	}

	public int findCatIdIndex(int Jewelryid) {
		Jewelry jewelry = new Jewelry();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM products WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, Jewelryid);
			rs = pst.executeQuery();
			while (rs.next()) {
				jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return jewelry.getId_category().getId();

	}

	public int countCat() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(id) FROM categories";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return count;
	}

	public int countJewelry() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(id) FROM products";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return count;
	}

	public int countUser() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(id) FROM users";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return count;
	}

	public int add(Jewelry jewelry) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO products (id_category, sizes, name, picture, price, sale, title, highlight, new_product, detail) VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1,jewelry.getId_category().getId());
			pst.setString(2,jewelry.getSizes());
			pst.setString(3,jewelry.getName());
			pst.setString(4,jewelry.getPicture());
			pst.setDouble(5, jewelry.getPrice()); 
			pst.setInt(6,jewelry.getSale());
			pst.setString(7, jewelry.getTitle());;
			pst.setInt(8,jewelry.getHighlight());
			pst.setInt(9,jewelry.getNew_product());
			pst.setString(10, jewelry.getDetail());;
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public int numberOfItems(int catId) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT FROM products WHERE id_category = ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, catId);
			rs = pst.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return 0;
	}

	public List<Jewelry> getItemIdCatPagination(int offset, int catId) {
		List<Jewelry> listJewelry = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT p.id AS pid, id_category, sizes, p.name AS pName,picture,price,sale,title,highlight,new_product,detail,created_at,updated_at  "
				+ "FROM products AS p " + "INNER JOIN categories AS c ON p.id_category = c.id " + "WHERE id_category = ? "
				+ "ORDER BY p.id DESC LIMIT ?, ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, catId);
			pst.setInt(2, offset);
			pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Jewelry jewelry = new Jewelry(rs.getInt("pid"), new Category(rs.getInt("id_category")), rs.getString("sizes"), rs.getString("pName"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listJewelry.add(jewelry);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listJewelry;
	}

	public int del(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM products WHERE id = ? ";
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

	public Jewelry findSong(int id) {
		Jewelry jewelry = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT p.*,c.name AS catName FROM products AS p " + "INNER JOIN categories AS c "
				+ "ON p.id_category=c.id " + "WHERE p.id=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("catName")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return jewelry;
	}

	public int editSong(Jewelry jewelry) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE products SET id_category = ? , sizes = ? , name = ? , picture = ? , price = ? , sale = ? , title = ? , highlight = ? , new_product = ? , detail = ?  WHERE id = ? ";
		try {
			pst = con.prepareStatement(sql);

			pst.setInt(1,jewelry.getId_category().getId());
			pst.setString(2,jewelry.getSizes());
			pst.setString(3,jewelry.getName());
			pst.setString(4,jewelry.getPicture());
			pst.setDouble(5, jewelry.getPrice()); 
			pst.setInt(6,jewelry.getSale());
			pst.setString(7, jewelry.getTitle());;
			pst.setInt(8,jewelry.getHighlight());
			pst.setInt(9,jewelry.getNew_product());
			pst.setString(10, jewelry.getDetail());
			pst.setInt(11, jewelry.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return result;
	}

	public Jewelry findOne(int id) {
		Jewelry jewelry = null;
		con = DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM products WHERE id= ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return jewelry;
	}

	public List<Jewelry> getItemPagination(int offset) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT p.*, c.name AS catName FROM products p JOIN categories c ON p.id_category = c.id ORDER BY id DESC LIMIT ?, ?";
		List<Jewelry> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtilPublic.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Jewelry jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("catName")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listItems.add(jewelry);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}
	public List<Jewelry> getItemPaginationPro(int offset) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT p.*, c.name AS catName FROM products p JOIN categories c ON p.id_category = c.id ORDER BY id DESC LIMIT ?, ?";
		List<Jewelry> listItems = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtilPublicPro.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Jewelry jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("catName")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listItems.add(jewelry);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public ArrayList<Jewelry> searchSong(String p) {
		Jewelry jewelry = null;
		ArrayList<Jewelry> listJewelry = new ArrayList<Jewelry>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM products WHERE name LIKE '%" + p + "%'";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				jewelry = new Jewelry(rs.getInt("id"), new Category(rs.getInt("id_category"), rs.getString("catName")), rs.getString("sizes"), rs.getString("name"),rs.getString("picture"), rs.getDouble("price"), rs.getInt("sale"), rs.getString("title"), rs.getInt("highlight"),rs.getInt("new_product"),rs.getString("detail"), rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
				listJewelry.add(jewelry);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listJewelry;
	}

	public int countId(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET counter = counter + 1 WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void increaseView(int id) {
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE songs SET counter = counter + 1 WHERE id = ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
	}

	public int addCmt(Comment objCmt) {
		con = DBConnectionUtil.getConnection();
		int result=0;
		String sql = "INSERT INTO comments (name,comment,id_pro) VALUE (?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, objCmt.getName());
			pst.setString(2, objCmt.getCmt());
			pst.setInt(3, objCmt.getId_pro());
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}

	public List<Comment> findCmt(int id_pro) {
		con = DBConnectionUtil.getConnection();
		List<Comment> listCmt= new ArrayList<>();
		String sql = "SELECT * FROM comments WHERE id_pro = ? ORDER BY id DESC";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id_pro);
			rs = pst.executeQuery();
			while (rs.next()) {
				Comment cmt= new Comment(rs.getString("name"), rs.getString("comment"), rs.getTimestamp("date_send"), rs.getInt("id_pro"));
				listCmt.add(cmt);
			};
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listCmt;
	}
}
