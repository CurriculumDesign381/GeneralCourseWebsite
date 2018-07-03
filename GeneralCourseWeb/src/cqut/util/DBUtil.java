package cqut.util;

import java.awt.image.RescaleOp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.regexp.internal.recompile;

/*import com.mysql.jdbc.ResultSet;*/

public class DBUtil {

	public static Connection getConnection() throws Exception {
		String driverName = "com.mysql.jdbc.Driver";
		String url =  "jdbc:mysql://localhost:3306/generalcoursewebsite?serverTimezone=GMT";

		String userName = "root";
		String userPWD = "";

		Class.forName(driverName);

		Connection connection = DriverManager.getConnection(url, userName, userPWD);

		return connection;
	}

	public static boolean execute(String sql) throws Exception {
		Connection connection = getConnection();

		Statement statement = connection.createStatement();

		return statement.execute(sql);
	}

	public static List<Map<String, Object>> excuteQueryFromLogin(String sql) throws Exception {
		int i = 0;
		java.sql.ResultSet rs = null;
		Connection connection = getConnection();
		Statement statement = connection.createStatement();
		rs = statement.executeQuery(sql);

		List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();

		while (rs.next()) {
			Map<String, Object> map1 = new HashMap<String, Object>();
			String userName = rs.getString("userName");
			String userID = rs.getString("userID");
			int roleID = rs.getInt("roleID");
			String passWord = rs.getString("passWord");

			map1.put("userName", userName);
			map1.put("userID", userID);
			map1.put("roleID", roleID);
			map1.put("PassWord", passWord);
			list.add(i, map1);
			i++;
		}
		connection.close();
		return list;
	}

public static List<Map<String, Object>> excuteQueryofpermission(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
		String roleName = rs.getString("roleName");
		int roleID = rs.getInt("roleID");
		
		String operationTypeID = rs.getString("operationTypeID");
		/*String name = rs.getString("name");*/
		
		
		map1.put("operationTypeID", operationTypeID);
		map1.put("roleID", roleID);
		map1.put("roleName", roleName);
		/*map1.put("name", name);*/
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
	
}
public static List<Map<String, Object>> excuteQueryofcontent(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String Title = rs.getString("Title");
		String Anthor = rs.getString("Anthor");
	
		String ColumnTitle = rs.getString("ColumnName");
		
		String submitTime = rs.getTimestamp("CreateTime").toString().substring(0,
				rs.getTimestamp("CreateTime").toString().length() - 2);
		String roleName = rs.getString("roleName");
		
		
		
		map1.put("Title", Title);
		map1.put("Anthor", Anthor);
		map1.put("ColumnTitle", ColumnTitle);
		map1.put("submitTime", submitTime);
		map1.put("roleName", roleName);
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
	
}

public static List<Map<String, Object>> excuteQueryByoperation(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String name = rs.getString("name");
		float TemplateSonID = rs.getFloat("TemplateSonID");
	
		
		
		
		
		map1.put("name", name);
		map1.put("TemplateSonID", TemplateSonID);
		
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
	
}
public static List<Map<String, Object>> excuteQueryByTemplate(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String TemplateName = rs.getString("TemplateName");
		int TemplateID = rs.getInt("TemplateID");	
		map1.put("TemplateName", TemplateName);
		map1.put("TemplateID", TemplateID);
		
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
	
}
public static List<Map<String, Object>> excuteQueryFromColumn(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String ColumnName = rs.getString("ColumnName");
	
		map1.put("ColumnName", ColumnName);
	
		
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
	
}

}
