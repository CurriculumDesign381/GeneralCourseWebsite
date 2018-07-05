package cqut.dao;

import java.util.List;
import java.util.Map;

import cqut.util.DBUtil;

public class ContentManageDao {
	private static ContentManageDao ContentManageDao;
	public static ContentManageDao getContentManageDao() {
		if (ContentManageDao == null) {
			ContentManageDao = new ContentManageDao();
		}

		return ContentManageDao;
	}
	
	public List<Map<String, Object>> selectInforFromArcticle() throws Exception{
		String sql = "SELECT\r\n" + 
				"DISTINCT\r\n" + 
				"	Title,\r\n" + 
				"	Anthor,\r\n" + 
				"	CreateTime,\r\n" + 
				"	ColumnName,\r\n" + 
				"roleName\r\n" + 
				"\r\n" + 
				"FROM\r\n" + 
				"	articleinfor\r\n" + 
				"JOIN `column`  ON articleinfor.ColumnID = `column`.ColumnID\r\n" + 
				"JOIN roletype ON roletype.roleID = articleinfor.roleID\r\n" + 
				"";
		List<Map<String, Object>> list = DBUtil.excuteQueryofcontent(sql);
		return list;
		
	}
	
	public List<Map<String, Object>> selectInforFromColumn(){
		
		String sql = "select ColumnName,ColumnID from `column`";
		List<Map<String, Object>> list = null;
		try {
			 list =DBUtil.excuteQueryFromColumn(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  list;
		
	}
	public List<Map<String, Object>> selectInforFromArcticle2(){
		String sql = "select articleContent ,Anthor,AnthorInfor FROM articleinfor";
		List<Map<String, Object>> list = null;
		try {
			list = DBUtil.executeFromArcticle(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
}
