package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Cart;
import models.Category;
import models.Jewelry;
import utils.DBConnectionUtil;

public class CartDAO extends AbstractDAO {
	public List<Cart> findAll(){
		List<Cart> listCart = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM cart c JOIN products p ON c.id_pro=p.id";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Cart cart = new Cart(rs.getInt("id"), new Jewelry(rs.getInt("id"), rs.getString("name"),
						rs.getString("picture"), rs.getInt("price")),
						rs.getInt("number"));
				listCart.add(cart);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listCart;
    }
// 
//    public ResultSet getAllProducts(){
//        ResultSet rs=null;
//        try {
//            Statement stmt=con.createStatement();
//            String sql="select * from sanpham";
//            rs=stmt.executeQuery(sql);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return rs;

}

