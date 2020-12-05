package controllers.admins.jewelry;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import daos.CatDAO;
import daos.JewelryDAO;
import models.Category;
import models.Jewelry;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminEditJewelryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditJewelryController() {
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
			response.sendRedirect(request.getContextPath() + "/admin/jewelry/edit?err=3");
			return;
		}
		JewelryDAO jewelryDAO = new JewelryDAO();
		Jewelry jewelry = jewelryDAO.findSong(id);
		CatDAO catDAO = new CatDAO();
		List<Category> listCat = catDAO.findAll();
		request.setAttribute("jewelry", jewelry);
		request.setAttribute("listCat", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/jewelry/edit.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		int id = Integer.parseInt(request.getParameter("id"));
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
		// upload anh
		// System.out.println(fileName);
		JewelryDAO jewelryDAO = new JewelryDAO();
		Jewelry itemJewelry = jewelryDAO.findSong(id);
		if ("".equals(fileName)) {
			fileName = itemJewelry.getPicture();
		}
		Jewelry jewelry = new Jewelry(id, new Category(catId), sizes, name, fileName, price, sale, title, highlight, new_product, detail);

		if (jewelryDAO.editSong(jewelry) > 0) {
			// sua thanh cong thi xoa anh cu
			Part part = request.getPart("picture");
			String fileNameNew = part.getSubmittedFileName();
			if (!"".equals(fileNameNew)) {
//			if(!"".equals(request.getPart("picture").getSubmittedFileName())) {
				//nếu có chọn ảnh mới
				FileUtil.delFile(itemJewelry.getPicture(), request);
			}
			// System.out.println(123);
			response.sendRedirect(request.getContextPath() + "/admin/jewelry?msg=ok");
			return;
		}

	}

}
