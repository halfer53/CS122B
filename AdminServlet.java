package movie.work.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import movie.work.entity.Employee;
import movie.work.entity.Metadata;
import movie.work.entity.Star;
import movie.work.service.AdminService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet(description = "movie star web", urlPatterns = { "/AdminServlet" })
public class AdminServlet extends BaseServlet {
	private AdminService adminService;

	@Override
	public void init() {
		adminService = new AdminService();
	}

	private static final long serialVersionUID = 1L;

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		Employee employee = adminService.getEmployee(fullname, password);
		
		
	
	
		String gRecaptchaResponse = request
				.getParameter("g-recaptcha-response");
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);

		
		if (employee != null && verify) {
			HttpSession session = request.getSession();
			session.setAttribute("site_username", employee.getFullname());
			request.setAttribute("employee", employee);
			request.getRequestDispatcher("JSP/admin_manage.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("JSP/admin_login.jsp").forward(request, response);
		}
	}

	public void addStar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println("Hello start");

		String firstName = "";
		String lastName = "";
		String dob = "";
		String photo_url = "";

		firstName = request.getParameter("first_name");
		lastName = request.getParameter("last_name");
		if (lastName == null || lastName.trim().length() == 0) {
			request.setAttribute("message", "last name can not be empty");
			request.getRequestDispatcher("JSP/star_add.jsp").forward(request, response);
		}
		photo_url = request.getParameter("photo_url");
		dob = request.getParameter("dob");

		SimpleDateFormat sdf1 = new SimpleDateFormat("mm/dd/yyyy");
		java.util.Date date = sdf1.parse(dob);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());

		Star star = new Star(firstName, lastName, sqlDate, photo_url);
		boolean flag = adminService.addStar(star);
		if (flag) {
			request.setAttribute("message", "voice actor added successfully");
		} else {
			request.setAttribute("message", "");
		}
		request.getRequestDispatcher("JSP/star_add.jsp").forward(request, response);
	}
	
	public void addMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String year = request.getParameter("year");
		String director = request.getParameter("director");
		String first_name = request.getParameter( "first_name");
		String last_name = request.getParameter( "last_name");
		String genre_name = request.getParameter("genre");
		String message = adminService.addMovie(first_name, last_name, genre_name, title, Integer.parseInt(year), director);
		request.setAttribute("message", message);
		request.getRequestDispatcher("JSP/movie_add.jsp").forward(request, response);
	}
	
	public void showMetaData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Metadata> list = (ArrayList<Metadata>) adminService.getDatabaseSchema();
		for (Metadata m : list) {
			System.out.println(m);
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("JSP/admin_metadata.jsp").forward(request, response);
	}

	@Override
	public void destroy() {
		adminService = null;
	}
}
