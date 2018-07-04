package cqut.service;

import cqut.dao.ColumnDao;

public class ColumnService {
	private static ColumnService columnService;
	public static ColumnService getColumnService() {
		if (columnService == null) {
			columnService = new ColumnService();
		}

		return columnService;
	}
	public void divideChoice(String condition) {
		String[] aStrings = condition.split(",");
		
		for (int i = 0; i < aStrings.length; i++) {
			ColumnDao.getColumnDao().deleteColumn(Integer.parseInt(aStrings[i]));
		}
	}

}
