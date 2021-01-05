package controllers.admins.cat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import daos.CatDAO;
import models.Category;
import utils.AuthUtil;
import utils.DefineUtil;

public class AdminIndexCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexCatController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		CatDAO catDao = new CatDAO();
		String snames = "";
		if (request.getParameter("snames") != null) {
			// người dùng có nhập => muốn tìm kiếm
			snames = request.getParameter("snames");
		}
		Category cat = new Category(snames);
		List<Category> listSearch = new ArrayList<Category>();
		listSearch = catDao.searchNameCat(cat);

		int currentPage = 1;
		try {

			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		int numberOfItems = catDao.findAll().size();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if (currentPage > numberOfPages || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		List<Category> catList = catDao.getItemPagination(offset);
		if (!"".equals(snames)) {
			catList = listSearch;
		}
		request.setAttribute("catList", catList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/admin/cat/index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	public static void showCat(HttpServletRequest request, JspWriter out, int parentId, String menu) throws ServletException, IOException {
		CatDAO catDAO = new CatDAO();
		List<Category> catListChild = catDAO.findCategoryParentById(parentId);
		if(catListChild.size()>0) {
				
			for (Category category : catListChild) {
				out.print("<tr class='center'><td class='center'>"+category.getId()+"</td><td>"+menu+category.getName()+"</td><td><a href='"+request.getContextPath()+"/admin/cat/edit?id="+category.getId()+"' class='btn btn-primary'><i class='fa fa-edit'></i> Sửa</a>&nbsp;<a href='"+request.getContextPath()+"/admin/cat/del?id="+category.getId()+"' id="+category.getId()+" class='btn btn-danger' onclick=\"return confirm('Bạn có chắc chắn muốn xóa danh mục không?')\"><i class='fa fa-pencil'></i> Xóa</a></td></tr>");
    			showCat(request, out, category.getId(), menu+"|---");
			}
			
		}
	}
}
