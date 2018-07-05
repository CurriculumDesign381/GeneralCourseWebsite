package cqut.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cqut.dao.PerssionDao;


/**
 * Servlet implementation class PermissionServlet
 */
@WebServlet("/PermissionServlet")
public class PermissionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PermissionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PerssionDao dao = new PerssionDao();
		List<Map<String, Object>> templateName;//获取权限类型
		templateName = PerssionDao.PerssionDao().selectInforFromTemplate();
		List role = dao.getAllRole();//获取所有角色
		List authority = dao.getAllAuthority();//获取所有权限
		List<Map<String, Object>> list = dao.selectAllRoleInfor();//获取所有角色拥有的各自的权限
		request.setAttribute("role", role);
		request.setAttribute("authority", authority);
		request.setAttribute("list", list);
		request.setAttribute("templateName", templateName);
		request.getServletContext().getRequestDispatcher("/admin/authority.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
