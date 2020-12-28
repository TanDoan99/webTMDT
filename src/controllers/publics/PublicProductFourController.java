package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.JewelryDAO;
import models.Jewelry;

public class PublicProductFourController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	JewelryDAO jewelryDAO = new JewelryDAO();

	public PublicProductFourController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Jewelry> jewelryList = jewelryDAO.findAll();
		request.setAttribute("jewelryList", jewelryList);
		request.getRequestDispatcher("/views/public/four-col.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
