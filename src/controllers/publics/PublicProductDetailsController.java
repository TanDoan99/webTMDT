package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.JewelryDAO;
import models.Comment;
import models.Jewelry;

public class PublicProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicProductDetailsController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JewelryDAO jewelryDAO = new JewelryDAO();
		int id = 0;
		List<Comment> listCmt=null;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
		}
		HttpSession session = request.getSession();
		Jewelry jewelryDetail = jewelryDAO.getDetail(id);

		listCmt=jewelryDAO.findCmt(id);
		session.setAttribute("listCmt", listCmt);

		request.setAttribute("jewelryDetail", jewelryDetail);
		request.getRequestDispatcher("/views/public/product_details.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
