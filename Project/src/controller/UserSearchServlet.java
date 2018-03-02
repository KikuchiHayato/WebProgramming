package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String loginId = request.getParameter("loginId");;
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthDate");

		UserDao userDao = new UserDao();
		User user = userDao.findSearch(loginId, name, birthdate);

		request.setAttribute("usersearch", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserDetail.jsp");
		dispatcher.forward(request, response);
	}
}
