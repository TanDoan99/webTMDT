package controllers.publics;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CartDAO;
import daos.JewelryDAO;
import models.Cart;
import models.Jewelry;

public class PublicCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Cart> listCart = new ArrayList<Cart>();
	double priceSP = 0;

	public PublicCartController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			int id = Integer.parseInt(request.getParameter("aid"));
			listCart.removeIf(obj -> obj.getId() == id);
		} catch (Exception e) {
		}
		CartDAO cartDAO = new CartDAO();
		listCart = (List<Cart>) session.getAttribute("listCart");
		if (listCart != null) {
			for (Cart obj : listCart) {
				priceSP += obj.getNumber() * obj.getProduct().getPrice();
			}
		}
		request.setAttribute("listCart", listCart);
		request.getRequestDispatcher("/views/public/cart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("aid"));
		int number = Integer.parseInt(request.getParameter("anumber"));
		JewelryDAO jewelryDAO = new JewelryDAO();
		Jewelry jewelry = jewelryDAO.findOne(id);
		HttpSession session = request.getSession();
		Cart cart = new Cart(id, jewelry, number);
		listCart = (List<Cart>) session.getAttribute("listCart");
		List<Integer> listNumber = new ArrayList<>();
		for (Cart objCart : listCart) {
			if (id == objCart.getProduct().getId()) {
				if (number == 1) {
					objCart.setNumber(objCart.getNumber() + 1);
					priceSP += objCart.getProduct().getPrice();
					listNumber.add(objCart.getNumber());

				} else if (objCart.getNumber() > 1) {
					objCart.setNumber(objCart.getNumber() - 1);
					priceSP -= objCart.getProduct().getPrice();
					listNumber.add(objCart.getNumber());
				}else {
					out.print(listNumber);
				}
			}
		}
		int priceInt = (int) priceSP;
		listNumber.add(priceInt);
		out.print(listNumber);

	}

}
