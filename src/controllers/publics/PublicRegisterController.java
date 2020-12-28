package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.UserDAO;
import models.User;
import utils.StringUtil;

public class PublicRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicRegisterController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("userInfo");
		request.getRequestDispatcher("/views/public/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		// validate dữ liệu
//		if (userDAO.hasUser(username)) {
//			RequestDispatcher rd = request.getRequestDispatcher("/views/public/register.jsp?err=1");
//			rd.forward(request, response);
//		}
//		if (username.equals("")) {
//			RequestDispatcher rd = request.getRequestDispatcher("/views/public/register.jsp?err=2");
//			rd.forward(request, response);
//		}
//		if (password.equals("")) {
//			RequestDispatcher rd = request.getRequestDispatcher("/views/public/register.jsp?err=3");
//			rd.forward(request, response);
//		}
//		if (fullname.equals("")) {
//			RequestDispatcher rd = request.getRequestDispatcher("/views/public/register.jsp?err=4");
//			rd.forward(request, response);
//		}
//		if (email.equals("")) {
//			RequestDispatcher rd = request.getRequestDispatcher("/views/public/register.jsp?err=5");
//			rd.forward(request, response);
//		}
		// mã hóa MD5
		password = StringUtil.md5(password);// sau khi mã hóa sẽ thành chuỗi kí tự
		User user = new User(username, password, fullname,email);
		int add = userDAO.add(user);
		if (add > 0) {
			// them thanh cong
			response.sendRedirect(request.getContextPath() + "/auth/login_index?msg=OK");
			return;
		}
		request.getRequestDispatcher("/views/public/register.jsp").forward(request, response);
	}

}
