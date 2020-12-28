package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.JewelryDAO;
import models.Category;
import models.Jewelry;
import utils.DefineUtilPublicPro;

public class PublicProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	JewelryDAO jewelryDAO = new JewelryDAO();
    public PublicProductsController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CatDAO catDAO = new CatDAO();
		int currentPage = 1;
		try {

			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		int numberOfItems = jewelryDAO.findAll().size();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtilPublicPro.NUMBER_PER_PAGE);
		if (currentPage > numberOfPages || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtilPublicPro.NUMBER_PER_PAGE;
		List<Jewelry> jewelryList = jewelryDAO.getItemPaginationPro(offset);
		List<Category> catList = catDAO.findAll();
		request.setAttribute("jewelryList", jewelryList);
		request.setAttribute("catList", catList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/public/products.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
