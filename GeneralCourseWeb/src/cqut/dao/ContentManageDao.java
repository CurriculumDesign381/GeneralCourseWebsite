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
		String sql = "SELECT DISTINCT\r\n" + 
				"articleinfor.Title,\r\n" + 
				"articleinfor.Anthor,\r\n" + 
				"articleinfor.CreateTime,\r\n" + 
				"`column`.ColumnName,\r\n" + 
				"roletype.roleName,\r\n" + 
				"articleinfor.isTop,\r\n" + 
				"articleinfor.articleContent,\r\n" + 
				"articleinfor.isPass\r\n" + 
				"FROM\r\n" + 
				"articleinfor\r\n" + 
				"INNER JOIN `column` ON articleinfor.ColumnID = `column`.ColumnID\r\n" + 
				"JOIN roletype ON roletype.roleId = articleinfor.roleID";
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

	public boolean checkArticleByTitleAndAuthor(String articleTitle, String author) {
		String sql = "UPDATE `articleinfor` SET `isPass`='1' WHERE (`Title`='" + articleTitle + "') AND (`Anthor`='" + author +"')";
		try {
			DBUtil.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean editArticleByTitleAndAuthor(String articleTitle, String author, String content) {
		String sql = "UPDATE `articleinfor` SET `articleContent`='" + content +"' WHERE (`Title`='" + articleTitle + "') AND (`Anthor`='" + author +"')";
		System.out.println(sql);
		try {
			DBUtil.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean deleteArticleByTitleAndAuthor(String articleTitle, String author) {
		String sql = "Delete from `articleinfor` WHERE (`Title`='" + articleTitle + "') AND (`Anthor`='" + author +"')";
		System.out.println(sql);
		try {
			DBUtil.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
