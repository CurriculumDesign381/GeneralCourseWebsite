package cqut.servlet;

import java.io.IOException;
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
	String  ColumnID = request.getParameter("ColumnId");
	String ColumnName = request.getParameter("ColumnName");
	
	ColumnDao.getColumnDao().insesrtColumn(Integer.parseInt(ColumnID), ColumnName);
/*	request.getRequestDispatcher("admin/column.jsp").forward(request, response);*/
	response.sendRedirect("/GeneralCourseWeb/admin/column.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
