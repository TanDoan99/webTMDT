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
public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CatDAO catDAO=new CatDAO();
    public AdminAddCatController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		List<Category> catList = new ArrayList<Category>();
		catList = catDAO.findAll();
		request.setAttribute("catList", catList);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/add.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		CatDAO catDAO=new CatDAO();
		String name=request.getParameter("name");
		int parent_id = 0;
		if(request.getParameter("parent_id")!=null) {
			parent_id = Integer.parseInt(request.getParameter("parent_id"));
		}
		String description=request.getParameter("description");
		if("".equals(name)) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/add.jsp?err=3");
			rd.forward(request, response);
			return;
		}
		Category cat=new Category(name,parent_id,description);
		int add=catDAO.add(cat);
		if(add>0) {
			//them thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?msg=OK");
			return;
		}
		//that bai
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/add.jsp?err=0");
		rd.forward(request, response);
	}
	public static void showCatAdd(HttpServletRequest request,JspWriter out, int parentId, String menu) throws ServletException, IOException {
		
		CatDAO catDAO = new CatDAO();
		List<Category> catListChild = catDAO.findCategoryParentById(parentId);
		if(catListChild.size()>0) {
				
			for (Category category : catListChild) {
				out.print("<option value="+category.getId()+">"+menu+category.getName()+"</option>");
				showCatAdd(request, out, category.getId(), menu+"|----");
			}
			
		}
	}
}
