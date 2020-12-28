package controllers.publics;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.JewelryDAO;
import models.Comment;


public class PublicCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Comment> listCmt=new ArrayList<>();

	public PublicCommentController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id_pro = 0;
		try {
			id_pro = Integer.parseInt(request.getParameter("id_pro"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		String fullname = request.getParameter("fullname");
		String cmt = request.getParameter("cmt");
		JewelryDAO jewelryDAO = new JewelryDAO();
		Comment objCmt= new Comment(fullname, cmt, null, id_pro);
		int	Cmt = jewelryDAO.addCmt(objCmt);
		
		if(Cmt>0) {
			listCmt=jewelryDAO.findCmt(id_pro);
			System.out.println(listCmt.size());
			HttpSession session=request.getSession();
			session.setAttribute("listCmt", listCmt);
		}
	
	}

}
