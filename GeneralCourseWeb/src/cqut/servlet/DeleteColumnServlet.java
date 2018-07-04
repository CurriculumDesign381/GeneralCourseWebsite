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
import cqut.service.ColumnService;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteColumnServlet")
public class DeleteColumnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteColumnServlet() {
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
		List<Map<String, Object>> list1 =ContentManageDao.getContentManageDao().selectInforFromColumn(); 
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
   ColumnService.getColumnService().divideChoice(condition);
		request.getRequestDispatcher("admin/column.jsp").forward(request, response);
  }
  else {
	
		pw.print("<html><head><meta charset='UTF-8'></head>");
		pw.write("<script   language='javascript'>alert('请选择您想要删除的栏目')   </script>   ");

		pw.write("<script   language='javascript'>  window.location.href='admin/column.jsp'   </script>   ");
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
