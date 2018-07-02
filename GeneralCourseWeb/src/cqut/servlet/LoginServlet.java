package cqut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cqut.service.LoginService;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 得到 登录帐号
		String admin = request.getParameter("user");
		// 得到登录密码
		String passWord = request.getParameter("password");
		boolean state = LoginService.login(admin, passWord);

		
		HttpSession session = request.getSession();

		if (state == true) {
			request.getRequestDispatcher("admin/backStageManage.jsp").forward(request, response);

		}
		
		else {
			/* response.setCharacterEncoding("GBK"); */
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print("<html><head><meta charset='UTF-8'></head>");
			pw.write("<script   language='javascript'>alert('用户名或者密码错误')   </script>   ");

			pw.write("<script   language='javascript'>  window.location.href='admin/login.jsp'   </script>   ");
			pw.print("</html>");
			/*
			 * request.getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(
			 * request, response);
			 */
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
