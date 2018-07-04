package cqut.dao;

import cqut.util.DBUtil;

public class ColumnDao {
	private static ColumnDao columnDao;
	public static ColumnDao getColumnDao() {
		if (columnDao == null) {
			columnDao = new ColumnDao();
		}

		return columnDao;
	}
	public void insesrtColumn(int ColumnID,String ColumnName) {
		//insert into student_info(stuName,stuAge) values('zhanghua',13),('zhanghua',14),('zhanghua',15);
		String sql = "insert into `column`(ColumnID,ColumnName) values ( "+ColumnID+",'"+ColumnName+"')";
		System.out.println(sql);
		try {
			System.out.println(DBUtil.execute(sql));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
public void deleteColumn(int condition) {
	
		String sql = "delete  from  `column` where ColumnID = "+condition;
		System.out.println(sql);
		try {
			DBUtil.execute(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
