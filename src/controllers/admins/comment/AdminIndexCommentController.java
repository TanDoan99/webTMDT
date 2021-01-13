package controllers.admins.comment;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.JewelryDAO;
import models.Comment;
import utils.AuthUtil;
import utils.DefineUtilCmt;

public class AdminIndexCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexCommentController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		JewelryDAO jewelryDAO = new JewelryDAO();
		int currentPage=1;
		try {
			
			currentPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage=1;
		}
		int numberOfItems= jewelryDAO.findComment().size();
		int numberOfPages=(int) Math.ceil((float) numberOfItems/DefineUtilCmt.NUMBER_PER_PAGE);
		if(currentPage>numberOfPages||currentPage<1) {	
			currentPage=1;
		}
		int offset=(currentPage-1)*DefineUtilCmt.NUMBER_PER_PAGE;
		
		List<Comment> cmtList=jewelryDAO.getItemPaginationComment(offset);
		request.setAttribute("cmtList", cmtList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		
		request.getRequestDispatcher("/views/admin/comment/index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
