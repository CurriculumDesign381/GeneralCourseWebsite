import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import cqut.dao.LoginDao;
import cqut.dao.PerssionDao;
import cqut.service.LoginService;

public class test {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
/*LoginService.login("116030801", "123");*/

List<Map<String, Object>> list = list= PerssionDao.PerssionDao().selectRoleInfor("11603080110");

System.out.println("======================华丽的分割线=============================");
for (Map<String, Object> map : list) {
    for (Map.Entry<String, Object> m : map.entrySet()) {
        System.out.print("key:"+m.getKey() + "    ");
        System.out.println("value:"+m.getValue());
    }
}
System.out.println("========================华丽的分割线================================");

	}

}
