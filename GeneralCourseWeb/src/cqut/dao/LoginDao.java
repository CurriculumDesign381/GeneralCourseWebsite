package cqut.dao;

import java.util.List;
import java.util.Map;



import cqut.util.DBUtil;

public class LoginDao {
	private static LoginDao loginDao;
	public static LoginDao getLoginDao() {
		if (loginDao == null) {
			loginDao = new LoginDao();
		}

		return loginDao;
	}

	
	public List<Map<String, Object>> login(String userID ){
		String sql ="select userName,userID,roleID,passWord from user where userID = "+ userID;
		List<Map<String, Object>> list = null;
		try {
	 list = DBUtil.excuteQueryFromLogin(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	} 
	
	
}
