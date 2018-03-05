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

@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserUpdateServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	String id = request.getParameter("id");
		System.out.println(id);

		UserDao userDao = new UserDao();
		User user = userDao.findByUserInfo(id);

		request.setAttribute("userdetail", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserUpdate.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);

		String password = request.getParameter("password");
		String password_confirm = request.getParameter("password-confirm");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");

		if (!password.equals(password_confirm)) {

			request.setAttribute("errMsg", "Our apologies, Password and Password to Confirm do not match. Please enter it again.");

			UserDao userDao = new UserDao();
			User user = userDao.findByUserInfo(id);

			request.setAttribute("userdetail", user);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserUpdate.jsp");
			dispatcher.forward(request, response);
			return;
		}


		UserDao userDao = new UserDao();
		userDao.findByUserUpdateInfo(id, password, name, birthDate);

		response.sendRedirect("UserListServlet");
	}
}
