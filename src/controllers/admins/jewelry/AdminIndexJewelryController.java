package controllers.admins.jewelry;

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
import utils.AuthUtil;
import utils.DefineUtil;

public class AdminIndexJewelryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexJewelryController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		JewelryDAO jewelryDAO = new JewelryDAO();
		CatDAO catDAO = new CatDAO();
		String sname = "";
		int scat = 0;
		if (request.getParameter("sname") != null) {
			// người dùng có nhập => muốn tìm kiếm
			sname = request.getParameter("sname");
		}
		if (request.getParameter("scat") != null) {
			scat = Integer.parseInt(request.getParameter("scat"));
		}
		if (scat > 0) {
			// người dùng muốn tìm kiếm danh mục
			scat = Integer.parseInt(request.getParameter("scat"));
			request.setAttribute("scat", scat);
		}
		Jewelry jewelry = new Jewelry(new Category(scat), sname);
		List<Jewelry> listSearch = jewelryDAO.findAllByIdAndNameOrderByNewsId(jewelry);
		int currentPage = 1;
		try {

			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		int numberOfItems = jewelryDAO.findAll().size();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if (currentPage > numberOfPages || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		List<Jewelry> jewelryList = jewelryDAO.getItemPagination(offset);
		List<Category> catList = catDAO.findAll();
		if (scat > 0 || !"".equals(sname)) {
			jewelryList = listSearch;
		}

		request.setAttribute("jewelryList", jewelryList);
		request.setAttribute("catList", catList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/admin/jewelry/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
