package cqut.dao;

import java.util.List;
import java.util.Map;

import cqut.util.DBUtil;

public class PerssionDao {
	private static PerssionDao perssionDao;
	public static PerssionDao PerssionDao() {
		if (perssionDao == null) {
			perssionDao = new PerssionDao();
		}

		return perssionDao;
	}
	
	
	//获取相应版块的权限 
	public List<Map<String, Object>> selectRoleInfor(String userID) throws Exception{
		 String sql = "SELECT DISTINCT\r\n" + 
		 		"	roletype.roleName,\r\n" + 
		 		"	articleInfor.roleID,\r\n" + 
		 		"   perrole.operationTypeID\r\n" + 
		 		"FROM\r\n" + 
		 		"	roletype \r\n" + 
		 		" JOIN articleInfor  ON articleInfor.roleID = roletype.roleId\r\n" + 
		 		"  \r\n" + 
		 		" \r\n" + 
		 		"  JOIN perrole ON roletype.roleId = perrole.roleID\r\n" + 
		 		"where userID =" + 
		 		""
				 +userID;
		 List<Map<String, Object>> list = DBUtil.excuteQueryofpermission(sql);
		 int i =0;
		 for (Map<String, Object> map : list) {
				List<Map<String, Object>> list1 =PerssionDao.PerssionDao().selectInforByoperation(Integer.parseInt((String)map.get("operationTypeID")));
			    for (Map.Entry<String, Object> m : map.entrySet()) {
			   
			    }
			    list.get(i).put("TemplateSonID", list1.get(0).get("TemplateSonID"));
			    list.get(i).put("name", list1.get(0).get("name"));
			    System.out.println(list1.get(0).get("TemplateSonID"));
			    i++;
			}
		return list;
		
	}
	
	//根据operationTypeID获取TemplateSonID,name
	public List<Map<String, Object>> selectInforByoperation(int operationTypeID) throws Exception {
		String sql = "select name,TemplateSonID from permission where operationTypeID="+operationTypeID;
		return DBUtil.excuteQueryByoperation(sql);
	}
	//获取模板的方法
	public List<Map<String, Object>> selectInforFromTemplate() throws Exception{
		String sql = "select * from Template";
		List<Map<String, Object>> list = DBUtil.excuteQueryByTemplate(sql);
		return list;
		
	}

}