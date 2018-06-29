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

/*import com.mysql.jdbc.ResultSet;*/

public class DBUtil {

	public static Connection getConnection() throws Exception {
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/generalcoursewebsite?useUnicode=true&amp;characterEncoding=UTF-8";
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
			int operationTypeID = rs.getInt("operationTypeID");
			String passWord = rs.getString("passWord");

			map1.put("userName", userName);
			map1.put("userID", userID);
			map1.put("operationTypeID", operationTypeID);
			map1.put("PassWord", passWord);
			list.add(i, map1);
			i++;
		}
		connection.close();
		return list;
	}


}
