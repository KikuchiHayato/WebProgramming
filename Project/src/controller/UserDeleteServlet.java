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

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserDeleteServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	String id = request.getParameter("id");
		System.out.println(id);

		UserDao userDao = new UserDao();
		User user = userDao.findByUserInfo(id);

		request.setAttribute("userdetail", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserDelete.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);

		UserDao userDao = new UserDao();
		userDao.findByUserDeleteInfo(id);

		response.sendRedirect("UserListServlet");
	}
}
