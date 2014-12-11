package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/BackHomeServlet")
public class BackHomeServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
    
	RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
			dispatcher = request.getRequestDispatcher("MovieUser.jsp");
			dispatcher.forward(request, response);
		
	}
}
