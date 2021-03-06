package cqut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cqut.dao.ColumnDao;	

/**
 * Servlet implementation class DeleteColumn
 */
@WebServlet("/InsertColumn")
public class InsertColumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertColumn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
	String  ColumnID = request.getParameter("ColumnId");
	String ColumnName = request.getParameter("ColumnName");
	
	if (!ColumnID.equals("")&!ColumnName.equals("")) {
		

	
	ColumnDao.getColumnDao().insesrtColumn(Integer.parseInt(ColumnID), ColumnName);
/*	request.getRequestDispatcher("admin/column.jsp").forward(request, response);*/
	response.sendRedirect("/GeneralCourseWeb/admin/column.jsp");
	}
	
	else {
		pw.print("<html><head><meta charset='UTF-8'></head>");
		pw.write("<script   language='javascript'>alert('ColumnID or ColumnName is empty')   </script>   ");

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
