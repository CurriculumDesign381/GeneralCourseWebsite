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
	
	public List<Map<String, Object>> selectRoleInfor(String userID) throws Exception{
		 String sql = "select DISTINCT r.roleName,articleInfor.roleID,pr.operationTypeID,permission.name from articleInfor "
		 		+ "LEFT JOIN roletype AS r ON articleInfor.roleID = r.roleId,roletype LEFT JOIN perrole ON roletype.roleId = perrole.roleID,perrole pr JOIN permission ON pr.operationTypeID = permission.operationTypeID "
		 		+ "where userID ="
				 +userID;
		 List<Map<String, Object>> list = DBUtil.excuteQueryofpermission(sql);
		return list;
		
	}

}
