package controllers.publics;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.OrderDAO;
import daos.OrderDetailDAO;
import daos.UserDAO;
import models.Cart;
import models.Order;
import models.User;

public class PublicCheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicCheckOutController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		int totalMoney = 0;
		List<Cart> listCart = new ArrayList<Cart>();
		if (session.getAttribute("listCart") != null) {
			listCart = (ArrayList<Cart>) session.getAttribute("listCart");
		}

		if (listCart.size() > 0) {
			for (Cart od : listCart) {

				if (od.getProduct().getSale() != 0) {
					totalMoney += od.getProduct().getSale() * od.getNumber();
				} else {
					totalMoney += od.getProduct().getPrice() * od.getNumber();
				}

			}
		}

		request.setAttribute("totalMoney", totalMoney);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/checkout.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		List<Cart> listCart = new ArrayList<Cart>();
		if (session.getAttribute("listCart") != null) {
			listCart = (ArrayList<Cart>) session.getAttribute("listCart");
		}

		String fullname = "";
		String address = "";
		String telephone_number = "";
		int totalMoney = 0;
		String paymentMethod = "";

		if (request.getParameter("totalMoney") != null) {
			totalMoney = Integer.parseInt(request.getParameter("totalMoney"));
		}
		if (request.getParameter("paymentMethod") != null) {
			paymentMethod = request.getParameter("paymentMethod");
		}
		if (request.getParameter("fullname") != null) {
			fullname = request.getParameter("fullname");
		}
		if (request.getParameter("address") != null) {
			address = request.getParameter("address");
		}
		if (request.getParameter("telephone_number") != null) {
			telephone_number = request.getParameter("telephone_number");
		}
		User user = new User();
		if (session.getAttribute("userInfor") != null) {
			user = (User) session.getAttribute("userInfor");
		}
		// edit them thong tin user
		user.setFullname(fullname);
		user.setAddress(address);
		user.setTelephone_number(telephone_number);
		user.setUpdateBy(user.getId());
		user.setCreateDate(user.getCreateDate());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		user.setUpdateDate(timestamp);
		UserDAO userDAO = new UserDAO();
		userDAO.editItems(user);

		// add don hang
		Order order = new Order();
		order.setTotalMoney(totalMoney);
		order.setPaymentMethod(paymentMethod);
		order.setCreateBy(user.getId());

		OrderDAO orderDAO = new OrderDAO();
		orderDAO.addItem(order);

		// add chi tiet don hang
		List<Order> orderList = new ArrayList<Order>();
		orderList = orderDAO.findAll();
		int maxId = 0;
		if (orderList.size() > 0) {
			for (Order order1 : orderList) {
				if (order1.getId() > maxId) {
					maxId = order1.getId();

				}
			}
		}
		OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
		if (listCart.size() > 0) {
			for (Cart order3 : listCart) {
				Cart orderDetail = new Cart(order3.getProduct(), order3.getNumber(), new Order(maxId));
				orderDetailDAO.addItem(orderDetail);
			}
		}

		session.removeAttribute("listCart");
		response.sendRedirect(request.getContextPath() + "/index.html?msg=1&orderId=" + maxId);
		return;

	}
}
