package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import controller.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao userDao = new UserDao();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		boolean checkUser=userDao.verifyUser(user);
		
		
		if(checkUser) {
			HttpSession session = request.getSession(true);
			session.setAttribute("currentUser", user);
			dispatcher = request.getRequestDispatcher("Index.jsp");
			dispatcher.forward(request, response);
		} else {
			HttpSession session = request.getSession(false);
			session.setAttribute("currentUser", null);
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
