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
	if (list!=null && !list.isEmpty()) {
		

	if (!"".equals(userID) || !"".equals(passWord)) {	
		System.out.println("userID:" + userID);
		System.out.println("passWord:" + passWord);
		System.out.println("listusername:" + list.get(0).get("userName"));
		System.out.println("listpassword:" + list.get(0).get("PassWord"));
		System.out.println("listroleID:" + list.get(0).get("roleID"));
		if (list.get(0).get("userID").equals(userID) && list.get(0).get("PassWord").equals(passWord)) {
			status = true;

		}
   
	}
	}
	   return status;
}
}
