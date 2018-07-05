package cqut.dao;

import java.util.List;
import java.util.Map;

import cqut.util.DBUtil;

public class UserManageDao {
	private static UserManageDao UserManageDao;
	public static UserManageDao getUserManageDao() {
		if (UserManageDao == null) {
			UserManageDao = new UserManageDao();
		}

		return UserManageDao;
	}
	
	/*查询所有管理员*/
	public List<Map<String, Object>> selectAllInfo() throws Exception {
		String sql ="SELECT userID,userName	FROM user";
		List<Map<String, Object>> list = DBUtil.excuteQueryFromUser(sql) ;
		return list;
	}
	
	/*删除管理员*/
	public boolean deleteUserById(String ID) {
		String sql = "DELETE FROM `user` WHERE (`userID`='"+ ID +"')";
		try {
			DBUtil.execute(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
