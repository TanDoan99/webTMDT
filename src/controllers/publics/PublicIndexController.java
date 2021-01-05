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
import javax.servlet.jsp.JspWriter;

import daos.CatDAO;
import daos.JewelryDAO;
import daos.SlidesDAO;
import models.Cart;
import models.Category;
import models.Jewelry;
import models.Slides;
import utils.DefineUtilPublic;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Cart> listCart = new ArrayList<>();
	JewelryDAO jewelryDAO = new JewelryDAO();

	public PublicIndexController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SlidesDAO slidesDAO = new SlidesDAO();
		List<Slides> list = slidesDAO.findAll();
		request.setAttribute("list", list);
		CatDAO catDAO = new CatDAO();
		String sname = "";
		int scat = 0;
		if (request.getParameter("sname") != null) {
			// người dùng có nhập => muốn tìm kiếm
			sname = request.getParameter("sname");
		}
		if (request.getParameter("scat") != null) {
			scat = Integer.parseInt(request.getParameter("scat"));
		}
		if (scat > 0) {
			// người dùng muốn tìm kiếm danh mục
			scat = Integer.parseInt(request.getParameter("scat"));
			request.setAttribute("scat", scat);
		}
		Jewelry jewelry = new Jewelry(new Category(scat), sname);
		List<Jewelry> listSearch = jewelryDAO.findAllByIdAndNameOrderByNewsId(jewelry);
		int currentPage = 1;
		try {

			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
		int numberOfItems = jewelryDAO.findAll().size();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtilPublic.NUMBER_PER_PAGE);
		if (currentPage > numberOfPages || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtilPublic.NUMBER_PER_PAGE;
		List<Jewelry> jewelryList = jewelryDAO.getItemPagination(offset);
		List<Category> catList = catDAO.findAll();
		if (scat > 0 || !"".equals(sname)) {
			jewelryList = listSearch;
		}
		request.setAttribute("jewelryList", jewelryList);
		request.setAttribute("catList", catList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/public/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("aid"));
		Jewelry jewelry = jewelryDAO.findOne(id);
		Cart cart = new Cart(id, jewelry, 1);
		if (session.getAttribute("listCart") != null) {
			listCart = (List<Cart>) session.getAttribute("listCart");
		}
		boolean check=false;
		for (Cart objCart : listCart) {
			if (id == objCart.getProduct().getId()) {
				objCart.setNumber(objCart.getNumber() + 1);
				System.out.println(objCart.getNumber());
				check=true;
			}
		}
		if(check==false) {//<=> if(!check)
			listCart.add(cart);
		}
		session.setAttribute("listCart", listCart);

		out.print(listCart.size());

	}
	public static void showCat(HttpServletRequest request, JspWriter out, int parentId)
			throws ServletException, IOException {
		CatDAO catDAO = new CatDAO();
		String link = "";
		String collapse = "";
		List<Category> catList = catDAO.findCategoryParentById(parentId);
		if (catList.size() > 0) {

			for (Category category : catList) {
				List<Category> catListChild = catDAO.findCategoryParentById(category.getId());
				if (catListChild.size() > 0) {
					link = "#" + category.getId();
					collapse = "collapse";
				} else {
					link = request.getContextPath() + "/list_view?id=" + category.getId();
					collapse = "";
				}
				out.println("<ul>");
				out.println("<li>");
				out.println("<div class='accordion-heading' id='showCat"+category.getId()+"'>");
				out.println("<a Style='padding-left: 10px;' href='" + link + "' data-toggle='" + collapse + "'>" + category.getName() + "</a>");
				out.println("</div>");
				out.println("<div Style='padding-left: 10px;' id=" + category.getId() + " class='accordion-body collapse in'>");

				showCat(request, out, category.getId());
				out.println("</div>");
				out.println("</li>");
				out.println("</ul>");
			}

		}
	}
}
