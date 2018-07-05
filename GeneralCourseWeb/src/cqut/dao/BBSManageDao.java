package cqut.dao;

import java.sql.Timestamp;
import java.util.Date;
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


	public boolean deleteMassageById(Integer ID) {
		String sql = "DELETE FROM `bbs` WHERE (`BBSid`='"+ ID +"')";
		try {
			DBUtil.execute(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}


	public boolean addMassageByContent(String msg) {
		String sql1 = "SELECT\r\n" + 
				"Count(bbs.BBSid)\r\n" + 
				"FROM\r\n" + 
				"bbs";
		try {
			int id = DBUtil.excuteQueryofBBSid(sql1) + 1;
			Date date = new Date();
			Timestamp timeStamep = new Timestamp(date.getTime());
			String sql2 = "insert into bbs (BBSid,BBSConten,BBSTime) values(" + id + ",'" + msg + "','" + timeStamep + "')"; 
			DBUtil.execute(sql2);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
