package cqut.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cqut.dao.ContentManageDao;
import cqut.dao.PerssionDao;
import cqut.service.ColumnService;
import cqut.service.RoleManageService;

/**
 * Servlet implementation class deleteRoleServlet
 */
@WebServlet("/deleteRoleServlet")
public class deleteRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteRoleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
		String option = null;
		String condition =null;
		List<Map<String, Object>> list1 =PerssionDao.PerssionDao().selectInforFromRoleType();
		StringBuffer stringBuffer = new StringBuffer();
  for(int i =0;i<list1.size();i++) {
  	if(request.getParameter(i+1+"")!=null) {
  	  option = request.getParameter(i+1+"");
  	System.out.println(option);
  	stringBuffer.append(Integer.parseInt(option.substring(0, option.length()-1))+",");
  	}
  }
if(stringBuffer.length()>0) {
	  System.out.println(stringBuffer.toString());
  condition = stringBuffer.toString().substring(0, stringBuffer.toString().length()-1);

  System.out.println(condition);
RoleManageService.getRoleManageService().divideChoice(condition);
		request.getRequestDispatcher("admin/roleManage.jsp").forward(request, response);
}
else {
	
		pw.print("<html><head><meta charset='UTF-8'></head>");
		pw.write("<script   language='javascript'>alert('请选择您想要删除的角色')   </script>   ");

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
