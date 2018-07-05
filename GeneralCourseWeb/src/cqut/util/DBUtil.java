package cqut.util;

import java.awt.image.RescaleOp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
		String userPWD = "root";
		Class.forName(driverName);

		Connection connection = DriverManager.getConnection(url, userName, userPWD);

		return connection;
	}

	public static boolean execute(String sql) throws Exception {
		Connection connection = getConnection();

		Statement statement = connection.createStatement();

		return statement.execute(sql);
	}
	public static List<Map<String, Object>> excuteQueryFromBBS(String sql) throws Exception {
		int i = 0;
		java.sql.ResultSet rs = null;
		Connection connection = getConnection();
		Statement statement = connection.createStatement();
		rs = statement.executeQuery(sql);
		
		List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
		while (rs.next()) {
			Map<String, Object> map1 = new HashMap<String, Object>();
			Integer id = rs.getInt("BBSid");
			String BBSContent = rs.getString("BBSConten");
			String time = rs.getString("BBSTime");

			map1.put("id", id);
			map1.put("content", BBSContent);
			map1.put("date", time);
			list.add(i, map1);
			i++;
		}
		connection.close();
		return list;
	}



public static List<Map<String,Object>> excuteQueryofRole(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String roleID = rs.getString("roleId");
		String roleName = rs.getString("roleName");

		
		map1.put("roleID", roleID);
		map1.put("roleName", roleName);
		
		list.add(i,map1);
	}
	connection.close();
	return list;
	
}

public static List<Map<String,Object>> excuteQueryofAuthority(String sql) throws Exception{
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String operationTypeID = rs.getString("operationTypeID");
		String name = rs.getString("name");
		String TemplateID = rs.getString("TemplateID");

		
		map1.put("operationTypeID", operationTypeID);
		map1.put("name", name);
		map1.put("TemplateID", TemplateID);
		
		list.add(i,map1);
	}
	connection.close();
	return list;
	
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
	
		String title = rs.getString("Title");
		String author = rs.getString("Anthor");
	
		String columnName = rs.getString("ColumnName");
		
		String createTime = rs.getTimestamp("CreateTime").toString();
		String roleName = rs.getString("roleName");
		String articleContent = rs.getString("articleContent");
		Integer isTop = rs.getInt("isTop");
		Integer isPass = rs.getInt("isPass");
		
		
		
		
		map1.put("title", title);
		map1.put("author", author);
		map1.put("column", columnName);
		map1.put("createTime", createTime);
		map1.put("roleName", roleName);
		map1.put("content", articleContent);
		if(isTop==1) {
			map1.put("isTop", "是");
		} else {
			map1.put("isTop", "否");
		}
		if(isPass==1) {
			map1.put("isPass", "审核通过");
		} else {
			map1.put("isPass", "待审核");
		}
		
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
		int TemplateID = rs.getInt("TemplateID");
		String TemplateName = rs.getString("TemplateName");
		
		
		
		
		map1.put("name", name);
		map1.put("TemplateID", TemplateID);
		map1.put("TemplateName", TemplateName);
		
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
		int ColumnID = rs.getInt("ColumnID");
	
		map1.put("ColumnName", ColumnName);
		map1.put("ColumnID", ColumnID);
	
		
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
	
}

public static ResultSet executeQuery(String sql) throws Exception {

	Connection connection = getConnection();

	Statement statement = connection.createStatement();

	return statement.executeQuery(sql);
}

public static int executeUpdate(String sql) throws Exception {
	Connection connection = getConnection();

	Statement statement = connection.createStatement();

	return statement.executeUpdate(sql);
}
public static List<Map<String, Object>> executeFromArcticle(String sql) throws Exception {
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String arcticleContent = rs.getString("articleContent");
		String Anthor = rs.getString("Anthor");
		String AnthorInfor = rs.getString("AnthorInfor");
	
		map1.put("Anthor", Anthor);
		map1.put("arcticleContent", arcticleContent);
		map1.put("AnthorInfor",AnthorInfor);
	
		
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
}
public static List<Map<String, Object>> executeFromRole(String sql) throws Exception {
	int i =0;
	java.sql.ResultSet rs = null;
	Connection connection = getConnection();
	Statement statement = connection.createStatement();
	rs = statement.executeQuery(sql);

	List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
	
	while(rs.next()) {
		Map<String, Object> map1 = new HashMap<String, Object>();
	
		String roleID = rs.getString("roleID");
		String roleName = rs.getString("roleName");

	
		map1.put("roleID", roleID);
		map1.put("roleName", roleName);
		
	
		
		list.add(i,map1);
		 
	}
	connection.close();
	return list;
}
}
