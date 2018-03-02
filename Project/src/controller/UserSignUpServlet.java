package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/UserSignUpServlet")
public class UserSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserSignUpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserSignUp.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String password_confirm = request.getParameter("password-confirm");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");

		if (!password.equals(password_confirm)) {

			request.setAttribute("errMsg", "Our apologies, an item hasn't been filled in correctly. Please enter it again.");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserSignUp.jsp");
			dispatcher.forward(request, response);
			return;
		}

		UserDao userDao = new UserDao();
		userDao.findBySignUpInfo(loginId, password, name, birthDate);

		response.sendRedirect("UserListServlet");
	}
}
