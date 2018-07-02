package cqut.dao;

import java.util.List;
import java.util.Map;

public class ContentManageDao {
	private static ContentManageDao ContentManageDao;
	public static ContentManageDao getLoginDao() {
		if (ContentManageDao == null) {
			ContentManageDao = new ContentManageDao();
		}

		return ContentManageDao;
	}
	
	public List<Map<String, Object>> selectInforFromArcticle(String userID){
		String sql = "select  Title,Anthor,CreateTime ";
		return null;
		
	}
}
