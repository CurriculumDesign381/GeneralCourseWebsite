package cqut.dao;

import java.util.List;
import java.util.Map;

import cqut.util.DBUtil;

public class BBSManageDao {
	private static BBSManageDao BBSManageDao;
	public static BBSManageDao getBBSManageDao() {
		if (BBSManageDao == null) {
			BBSManageDao = new BBSManageDao();
		}

		return BBSManageDao;
	}
	
	
	/**
	 * 查询全部的留言
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectAllInfo() throws Exception {
		String sql ="SELECT\r\n" + 
				"*\r\n" + 
				"FROM\r\n" + 
				"bbs\r\n" + 
				"";
		List<Map<String, Object>> list = DBUtil.excuteQueryFromBBS(sql) ;
		return list;
	}

}
