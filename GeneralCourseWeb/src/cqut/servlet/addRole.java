package cqut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.model.wsdl.editable.EditableWSDLService;

import cqut.dao.PerssionDao;

/**
 * Servlet implementation class addRole
 */
@WebServlet("/addRole")
public class addRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		String  roleID = request.getParameter("roleId");
		String roleName = request.getParameter("roleName");
		if(!roleID.equals("")&&!roleName.equals("")) {
		
		PerssionDao.PerssionDao().insesrtRole(Integer.parseInt(roleID), roleName);
	
		
		pw.print("<html><head><meta charset='UTF-8'></head>");
		     pw.write("<script   language='javascript'>alert('success submit')   </script>   ");
		   
		    		  pw.write("<script   language='javascript'>  window.location.href='admin/roleManage.jsp'   </script>   ");
		 	pw.print("</html>"); 
	}
		else {
			pw.print("<html><head><meta charset='UTF-8'></head>");
			pw.write("<script   language='javascript'>alert('RoleID or RoleName is empty')   </script>   ");

			pw.write("<script   language='javascript'>  window.location.href='admin/roleManage.jsp'   </script>   ");
			pw.print("</html>");
		}	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
