package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.RegModel;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		String email = request.getParameter("t2");
		String pass = request.getParameter("t3");
		
		RegModel obj = new RegModel( email, pass);
		try {
		boolean chk =obj.LoginCheck();
		if(chk==true)
		{
			HttpSession session = request.getSession();
			session.setAttribute("name", obj.getName());
			session.setAttribute("email", email);
			response.sendRedirect("dashboard.jsp");
		}
		else
		{
			request.setAttribute("msg", "invalid id or password");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		
	}

}//demo for git and github class
