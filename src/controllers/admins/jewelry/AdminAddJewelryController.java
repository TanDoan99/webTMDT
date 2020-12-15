package controllers.admins.jewelry;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.JewelryDAO;
import models.Category;
import models.Jewelry;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminAddJewelryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminAddJewelryController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		CatDAO catDAO = new CatDAO();
		List<Category> catList = catDAO.findAll();
		request.setAttribute("catList", catList);
		request.getRequestDispatcher("/views/admin/jewelry/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		JewelryDAO jewelryDAO = new JewelryDAO();
		String sizes = request.getParameter("sizes");
		String name = request.getParameter("name");
		double price =Double.parseDouble(request.getParameter("price"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		String title = request.getParameter("title");
		int highlight = Integer.parseInt(request.getParameter("highlight"));
		int new_product =Integer.parseInt( request.getParameter("new_product"));
		String detail = request.getParameter("detail");
		int catId = Integer.parseInt(request.getParameter("category"));
		// Upload file
		String fileName = FileUtil.upload("picture", request);
		Jewelry jewelry = new Jewelry(new Category(catId), sizes, name, fileName, price, sale, title, highlight, new_product, detail);
		if (jewelryDAO.add(jewelry) > 0) {
			// them thanh cong
			response.sendRedirect(request.getContextPath() + "/admin/jewelry?msg=OK");
			return;
		}
		// that bai
		request.setAttribute("jewelty", jewelry);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/jewelry/add.jsp?err=0");
		rd.forward(request, response);

	}

}
