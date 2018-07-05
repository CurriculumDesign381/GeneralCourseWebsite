package cqut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cqut.dao.PerssionDao;

/**
 * Servlet implementation class ChangeAuthorityServlet
 */
@WebServlet("/ChangeAuthorityServlet")
public class ChangeAuthorityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAuthorityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String authority = request.getParameter("authority");//获取角色改变后拥有的权限
		int  roleId= Integer.parseInt(request.getParameter("roleId"));//获取角色
		int[] CopyauthorityOfRole;
		if(authority.isEmpty()) {
			CopyauthorityOfRole = new int[0];
		}
		else{
			String[] authorityOfRole = authority.split(",");
			CopyauthorityOfRole = new int[authorityOfRole.length];
			
			for (int i = 0; i < CopyauthorityOfRole.length; i++) {
				CopyauthorityOfRole[i]=Integer.parseInt(authorityOfRole[i]);
			}
		}
		
		boolean judge = PerssionDao.PerssionDao().changeRoleOfAuthority(CopyauthorityOfRole, roleId);
		
		if(judge) {
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print("<html><head><meta charset='UTF-8'></head>");
			pw.write("<script   language='javascript'>alert('您已为该类角色分配权限成功')   </script>   ");

			pw.write("<script   language='javascript'>  window.location.href='PermissionServlet'   </script>   ");
		}
		else {
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print("<html><head><meta charset='UTF-8'></head>");
			pw.write("<script   language='javascript'>alert('角色分配权限失败！')   </script>   ");

			pw.write("<script   language='javascript'>  window.location.href='PermissionServlet'   </script>   ");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
