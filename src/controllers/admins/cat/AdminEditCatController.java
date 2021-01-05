package controllers.admins.cat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import daos.CatDAO;
import models.Category;
import utils.AuthUtil;

public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditCatController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/admin/cat/edit?err=3");
			return;
		}
		CatDAO catDao = new CatDAO();
		Category cat = catDao.findEdit(id);
		request.setAttribute("cat", cat);
		List<Category> catList = new ArrayList<Category>();
		catList = catDao.findAll();
		request.setAttribute("catList", catList);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/cat/edit.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		CatDAO catDAO = new CatDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int parent_id = Integer.parseInt(request.getParameter("parent_id"));
		String description = request.getParameter("description");
		Category cat = new Category(id, name, parent_id, description);
		int edit = catDAO.edit(cat);
		request.setAttribute("name", name);
		request.setAttribute("description", description);
		if (edit > 0) {
			// sua thanh cong
			response.sendRedirect(request.getContextPath() + "/admin/cat/index?msg=2");
			return;
		}
		// sua that bai
		request.setAttribute("cat", cat);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/cat/edit.jsp?err=2");
		rd.forward(request, response);

	}

	public static void showCatEdit(HttpServletRequest request, JspWriter out, int parentId, String menu)
			throws ServletException, IOException {

		CatDAO catDAO = new CatDAO();
		List<Category> catListChild = catDAO.findCategoryParentById(parentId);
		if (catListChild.size() > 0) {

			for (Category category : catListChild) {
				out.print("<option value=" + category.getId() + ">" + menu + category.getName() + "</option>");
				showCatEdit(request, out, category.getId(), menu + "|----");
			}

		}
	}
}
