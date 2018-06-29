package cqut.service;

import java.util.List;
import java.util.Map;



import cqut.dao.LoginDao;

public class LoginService {
	private static LoginService Service;

	public static LoginService getLoginService() {
		if (Service == null) {
			Service = new LoginService();
		}

		return Service;
	}
public static boolean login(String userID,String passWord) {
	List<Map<String, Object>> list = LoginDao.getLoginDao().login(userID);
	boolean status = false;
	if (!"".equals(userID) || !"".equals(passWord)) {
		System.out.println("admin:" + userID);
		System.out.println("passWord:" + passWord);
		System.out.println("list:" + list.get(0).get("UserName"));
		System.out.println("list:" + userID);
		if (list.get(0).get("userName").equals(userID) && list.get(0).get("passWord").equals(passWord)) {
			status = true;

		}
   
	}
	   return status;
}
}
