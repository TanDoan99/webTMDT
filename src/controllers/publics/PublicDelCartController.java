package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.JewelryDAO;
import models.Cart;
import models.Jewelry;

public class PublicDelCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDelCartController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("aid"));
		JewelryDAO jewelryDAO = new JewelryDAO();
		Jewelry jewelry = jewelryDAO.findOne(id);
		HttpSession session=request.getSession();
		Cart cart=new Cart(id, jewelry);
		List<Cart> listCart=(List<Cart>)session.getAttribute("listCart");
		
	}

}
