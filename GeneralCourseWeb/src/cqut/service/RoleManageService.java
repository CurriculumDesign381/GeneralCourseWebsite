package cqut.service;

import cqut.dao.ColumnDao;

public class RoleManageService {
	private static RoleManageService roleManageService;
	public static RoleManageService getRoleManageService() {
		if (roleManageService == null) {
			roleManageService = new RoleManageService();
		}

		return roleManageService;
	}
	public void divideChoice(String condition) {
		String[] aStrings = condition.split(",");
		
		for (int i = 0; i < aStrings.length; i++) {
			ColumnDao.getColumnDao().deleteRole(Integer.parseInt(aStrings[i]));
		}
	}
}
