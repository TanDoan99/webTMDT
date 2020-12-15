package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Slides;
import utils.DBConnectionUtil;

public class SlidesDAO extends AbstractDAO {
	public List<Slides> findAll() {
		List<Slides> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM slides";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Slides slides=new Slides(rs.getInt("id"), rs.getString("img"), rs.getString("caption"), rs.getString("content"));
				list.add(slides);
			}
			;
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return list;

	}
	

}

