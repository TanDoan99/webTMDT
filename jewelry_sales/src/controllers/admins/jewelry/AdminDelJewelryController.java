package controllers.admins.jewelry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.JewelryDAO;
import models.Jewelry;
import utils.AuthUtil;
import utils.FileUtil;

public class AdminDelJewelryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelJewelryController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		JewelryDAO jewelryDAO = new JewelryDAO();
		int id = Integer.parseInt(request.getParameter("sid"));
		// kiem tra tin neu co file thi xoa
		Jewelry jewelry = jewelryDAO.findOne(id);
		String picture = jewelry.getPicture();
		System.out.println("anh:" + picture);
		FileUtil.delFile(picture, request);

		int dele = jewelryDAO.del(id);
		// xoa tin o data
		if (dele > 0) {
			// xóa thành công
			response.sendRedirect(request.getContextPath() + "/admin/jewelry?msg=1");
			return;
		}
		// thất bại
		response.sendRedirect(request.getContextPath() + "/admin/jewelry?err=0");
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
