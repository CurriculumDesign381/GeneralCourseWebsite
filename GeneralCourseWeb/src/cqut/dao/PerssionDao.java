package cqut.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*import cqut.entity.Role;*/
import cqut.util.DBUtil;

public class PerssionDao {
	private static PerssionDao perssionDao;
	public static PerssionDao PerssionDao() {
		if (perssionDao == null) {
			perssionDao = new PerssionDao();
		}

		return perssionDao;
	}
	
	public boolean changeRoleOfAuthority(int[] authority,int roleID)  {
		String sql = "delete from perrole where roleID =" +roleID;
		boolean judge = false ;
		try {
			DBUtil.execute(sql);
			if(authority.length==0) {
				return true;
			}
			for(int i = 0;i<authority.length;i++) {
				 sql = "insert into perrole values("+roleID+","+authority[i]+")";
				 DBUtil.execute(sql);
				 judge =true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//INSERT INTO table_name (column1,column2,column3,...)	VALUES (value1,value2,value3,...);
	
	return judge;
		
	}
	
	/*获取所有权限*/
	public List<Map<String,Object>> getAllAuthority() {
		String sql = "select * from permission";
		 List<Map<String, Object>> list = null;
			try {
				list = DBUtil.excuteQueryofAuthority(sql);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
	}
	
	/*获取所有角色*/
	public List<Map<String,Object>> getAllRole() {
		String sql = "select * from roleType";
		 List<Map<String, Object>> list = null;
			try {
				list = DBUtil.excuteQueryofRole(sql);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
	}
	
	/*获取所有角色所拥有的各自的权限*/
	public List<Map<String, Object>> selectAllRoleInfor(){
		 String sql = "SELECT DISTINCT\r\n" + 
		 		"	roletype.roleName,\r\n" + 
		 		"	roletype.roleID,\r\n" + 
		 		"   perrole.operationTypeID\r\n" + 
		 		"FROM\r\n" + 
		 		"	roletype \r\n" + 
		 		" JOIN user  ON user.roleID = roletype.roleId\r\n" + 
		 		"  \r\n" + 
		 		" \r\n" + 
		 		"  JOIN perrole ON roletype.roleId = perrole.roleID\r\n";
		 List<Map<String, Object>> list = null;
		try {
			list = DBUtil.excuteQueryofpermission(sql);
			 int i =0;
			 for (Map<String, Object> map : list) {
					List<Map<String, Object>> list1 =PerssionDao.PerssionDao().selectInforByoperation(Integer.parseInt((String)map.get("operationTypeID")));
				    for (Map.Entry<String, Object> m : map.entrySet()) {
				   
				    }
				    list.get(i).put("TemplateID", list1.get(0).get("TemplateID"));
				    list.get(i).put("name", list1.get(0).get("name"));
				    list.get(i).put("TemplateName", list1.get(0).get("TemplateName"));
				    System.out.println(list1.get(0).get("TemplateID"));
				    i++;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	//根据登录者获取相应版块的权限 
	public List<Map<String, Object>> selectRoleInfor(String userID){
		 String sql = "SELECT DISTINCT\r\n" + 
		 		"	roletype.roleName,\r\n" + 
		 		"	roletype.roleID,\r\n" + 
		 		"   perrole.operationTypeID\r\n" + 
		 		"FROM\r\n" + 
		 		"	roletype \r\n" + 
		 		" JOIN user  ON user.roleID = roletype.roleId\r\n" + 
		 		"  \r\n" + 
		 		" \r\n" + 
		 		"  JOIN perrole ON roletype.roleId = perrole.roleID\r\n" + 
		 		"where userID =" + 
		 		""
				 +userID;
		 List<Map<String, Object>> list = null;
		try {
			list = DBUtil.excuteQueryofpermission(sql);
			 int i =0;
			 for (Map<String, Object> map : list) {
					List<Map<String, Object>> list1 =PerssionDao.PerssionDao().selectInforByoperation(Integer.parseInt((String)map.get("operationTypeID")));
				    for (Map.Entry<String, Object> m : map.entrySet()) {
				   
				    }
				    list.get(i).put("TemplateID", list1.get(0).get("TemplateID"));
				    list.get(i).put("name", list1.get(0).get("name"));
				    list.get(i).put("TemplateName", list1.get(0).get("TemplateName"));
				    System.out.println(list1.get(0).get("TemplateID"));
				    i++;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	//根据operationTypeID获取TemplateSonID,name
	public List<Map<String, Object>> selectInforByoperation(int operationTypeID) throws Exception {
		String sql = "SELECT\r\n" + 
				"	NAME,\r\n" + 
				"	template.TemplateID,\r\n" + 
				"  template.TemplateName\r\n" + 
				"FROM\r\n" + 
				"	permission\r\n" + 
				"JOIN template ON permission.TemplateID = template.TemplateID\r\n" + 
				"WHERE\r\n" + 
				"	operationTypeID ="+operationTypeID;
		return DBUtil.excuteQueryByoperation(sql);
	}
	//获取模板的方法
	public List<Map<String, Object>> selectInforFromTemplate(){
		String sql = "select TemplateName,TemplateID from Template";
		List<Map<String, Object>> list = null;
		try {
			list = DBUtil.excuteQueryByTemplate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Map<String, Object>> selectInforFromRoleType(){
		String sql = "select roleID,roleName from roletype";
		List<Map<String, Object>> list = null;
		try {
			list = DBUtil.executeFromRole(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public void insesrtRole(int roleID,String roleName) {
		//insert into student_info(stuName,stuAge) values('zhanghua',13),('zhanghua',14),('zhanghua',15);
		String sql = "insert into roletype (roleID,roleName) values ( "+roleID+",'"+roleName+"')";
		System.out.println(sql);
		try {
			System.out.println(DBUtil.execute(sql));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
