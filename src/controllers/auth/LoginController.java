package controllers.auth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.JewelryDAO;
import daos.UserDAO;
import models.Jewelry;
import models.OrderDetail;
import models.User;
import utils.StringUtil;
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		//thong tin dang nhap
		String username = request.getParameter("username");
		String password = StringUtil.md5(request.getParameter("password"));
		int productId = 0;
		int quantity = 0;
		request.setAttribute("username", username);
		//kiem tra thong tin dang nhap
		User userInfo =userDAO.findUsernameAndPassword(username, password);
		User userInfor = userDAO.login(username, password);
		HttpSession session=request.getSession();
		if(userInfo!=null) {
			//
			//
			if(session.getAttribute("productId")!=null && session.getAttribute("quantity")!=null) {
				productId = (int) session.getAttribute("productId");
				quantity = (int) session.getAttribute("quantity");
		}
		
		if(productId!=0) {
			
			session.setAttribute("userInfor", userInfor);
			JewelryDAO productDAO = new JewelryDAO();
			Jewelry productDetail = new Jewelry();
			productDetail = productDAO.getItem(productId);
			List<OrderDetail> cartList = new ArrayList<OrderDetail>();
			OrderDetail od = new OrderDetail();
			od.setProduct(productDetail);
			od.setQuantity(quantity);
			cartList.add(od);
			session.setAttribute("cartList", cartList);
			response.sendRedirect(request.getContextPath()+"/public/detail?id="+productId+"&msg=1");
			return;
			}
			session.setAttribute("userInfo", userInfo);
			response.sendRedirect(request.getContextPath()+"/admin/index");
		}else {
			request.getRequestDispatcher("/views/auth/login.jsp?msg=err").forward(request, response);
		}
	}

}
