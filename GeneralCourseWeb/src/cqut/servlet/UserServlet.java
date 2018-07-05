package cqut.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import cqut.dao.BBSManageDao;
import cqut.dao.UserManageDao;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memthodname = request.getParameter("memthodname");
		if(memthodname!=null){
            switch (memthodname){
                case "delete":
                	deleteUser(request,response);
                    break;
                default:
                    queryList(request, response);
            }

        }else {
            queryList(request, response);

        }
	}
	/*删除管理员*/
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			String ID = (request.getParameter("UserId"));
			response.setStatus(200);
			
			
			UserManageDao userManageDao = new UserManageDao();
			boolean state = userManageDao.deleteUserById(ID);
			JSONObject jsonObject = new JSONObject();
	        jsonObject.put("state",state);
	        jsonObject.put("code",0);
	        jsonObject.put("msg","null");
	        System.out.println(jsonObject);
	        response.getWriter().print(jsonObject);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/*查询所有管理员*/
	private void queryList(HttpServletRequest request, HttpServletResponse response) {
		UserManageDao userManageDao = new UserManageDao();
		Integer limit =  Integer.parseInt(request.getParameter("limit"));
		Integer page = Integer.parseInt(request.getParameter("page"));
		try {
			List<Map<String, Object>> list = userManageDao.selectAllInfo();
			String jsonstr = ConverListToPageJson(list, page, limit, list.size());
			System.out.println(jsonstr);
			request.setAttribute("result", jsonstr);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(jsonstr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private String ConverListToPageJson(List<Map<String, Object>> list, int page, int limit, int size) {
		int startIndex = (page-1)*limit;
		if (startIndex >  list.size() -2) {
			startIndex = list.size() - limit;
		}
		 // 新建一个json数组
        JSONArray jsonArray = new JSONArray();
        // 新建一个json对象
        JSONObject jsonObject = null;
        // 遍历泛型集合
        int end = startIndex + limit;
        if((startIndex + limit) > (list.size() - 1)) {
        	end = list.size();
        }
        for (int i = startIndex; i < end ; i++) {
        	System.out.println(list.get(i).toString());
            jsonObject = new JSONObject(list.get(i));
            jsonArray.put(jsonObject);
        }
        // 转换数据格式
        String json = jsonArray.toString();
        // 拼接字符串
        StringBuffer sb = new StringBuffer();
        sb.append("{\"count\":");
        sb.append(size);
        sb.append(",\"code\":");
        sb.append(0);
        sb.append(",\"msg\":");
        sb.append("null");
        sb.append(",\"data\":");
        sb.append(json);
        sb.append("}");
        String jsonString = sb.toString();
        return jsonString;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
