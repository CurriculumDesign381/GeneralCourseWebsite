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

/**
 * Servlet implementation class BBSInfoServlet
 */
@WebServlet("/BBSInfoServlet")
public class BBSInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BBSInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memthodname = request.getParameter("memthodname");
		if(memthodname!=null){
            switch (memthodname){
                case "queryList":
                    break;
                case "delete":
                    deleteMessage(request,response);
                    break;
                case "add":
                	addMessage(request,response);
                	break;
                default:
                    queryList(request, response);
            }

        }else {
            queryList(request, response);

        }
	}

	/**
	 * 发表留言
	 * @param request
	 * @param response
	 */
	private void addMessage(HttpServletRequest request, HttpServletResponse response) {
		try {
			String msg = request.getParameter("content");
			BBSManageDao bbsManageDao = new BBSManageDao();
			boolean state = bbsManageDao.addMassageByContent(msg);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("state", state);
			jsonObject.put("code", 0);
			jsonObject.put("msg", "null");
			System.out.println(jsonObject);
			response.getWriter().print(jsonObject);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 删除留言
	 * @param request
	 * @param response
	 */
	private void deleteMessage(HttpServletRequest request, HttpServletResponse response) {
		try {
			Integer ID = Integer.parseInt(request.getParameter("BBSId"));
			response.setStatus(200);
			
			if(ID < 0) {
				response.getWriter().print("参数无效");
			}
			
			BBSManageDao bbsManageDao = new BBSManageDao();
			boolean state = bbsManageDao.deleteMassageById(ID);
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

	/**
	 * 查询留言
	 * @param request
	 * @param response
	 */
	private void queryList(HttpServletRequest request, HttpServletResponse response) {
		BBSManageDao bbsManageDao = new BBSManageDao();
		Integer limit =  Integer.parseInt(request.getParameter("limit"));
		Integer page = Integer.parseInt(request.getParameter("page"));
		try {
			List<Map<String, Object>> list = bbsManageDao.selectAllInfo();
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
