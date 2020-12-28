package controllers.publics;

import java.io.IOException;
import java.io.PrintWriter;
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

	public PublicCartController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		CartDAO cartDAO=new CartDAO();
		List<Cart> listCart=(List<Cart>)session.getAttribute("listCart");
		request.setAttribute("listCart", listCart);
		request.getRequestDispatcher("/views/public/cart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out =response.getWriter();
		int id=Integer.parseInt(request.getParameter("aid"));
		int number=Integer.parseInt(request.getParameter("anumber"));
		JewelryDAO jewelryDAO = new JewelryDAO();
		Jewelry jewelry = jewelryDAO.findOne(id);
		HttpSession session=request.getSession();
		Cart cart=new Cart(id, jewelry, number);
		List<Cart> listCart=(List<Cart>)session.getAttribute("listCart");
		for(Cart objCart:listCart) {
			if(id==objCart.getProduct().getId()&&number==1) {
				objCart.setNumber(objCart.getNumber()+1);
				//System.out.println(objCart.getNumber());
				out.print(objCart.getNumber());
			}else if(id==objCart.getProduct().getId()&&number==0) {
				objCart.setNumber(objCart.getNumber()-1);
				//System.out.println(objCart.getNumber());
				out.print(objCart.getNumber());
			}
		}
	}

}
