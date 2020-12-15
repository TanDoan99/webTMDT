package controllers.publics;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ContactDAO;
import models.Contact;

public class PublicContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicContactController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/public/contact.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		// lam them validate
		if (name.equals("")) {
			request.setAttribute("error", "Vui lòng nhập họ tên!");
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/contact.jsp");
			rd.forward(request, response);
		}
		if (email.equals("")) {
			request.setAttribute("error", "Vui lòng nhập email!");
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/contact.jsp");
			rd.forward(request, response);
		}
		if (subject.equals("")) {
			request.setAttribute("error", "Vui lòng nhập subject!");
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/contact.jsp");
			rd.forward(request, response);
		}
		if (message.equals("")) {
			request.setAttribute("error", "Vui lòng nhập nội dung!");
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/contact.jsp");
			rd.forward(request, response);
		}
		ContactDAO contactDAO = new ContactDAO();
		Contact item = new Contact(0, name, subject, email, message);
		if (contactDAO.addItem(item) > 0) {
			// them lien he thanh cong
			response.sendRedirect(request.getContextPath() + "/contact?msg=ok");
		} else {
			// that bai
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/contact.jsp?err=off");
			rd.forward(request, response);
		}
	}

}
