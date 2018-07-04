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
                case "deleteuv":
                    deleteUv(request,response);
                    break;
                default:
                    queryList(request, response);
            }

        }else {
            queryList(request, response);

        }
	}

	/**
	 * 删除留言
	 * @param request
	 * @param response
	 */
	private void deleteUv(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 查询留言
	 * @param request
	 * @param response
	 */
	private void queryList(HttpServletRequest request, HttpServletResponse response) {
		BBSManageDao bbsManageDao = new BBSManageDao();
		Integer limit = Integer.parseInt(request.getParameter("limit"));
		Integer page = Integer.parseInt(request.getParameter("page"));
		try {
			List<Map<String, Object>> list = bbsManageDao.selectAllInfo();
			String jsonstr = ConverListToPageJson(list, (page - 1) * limit, list.size());
			System.out.println(jsonstr);
			request.setAttribute("result", jsonstr);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(jsonstr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private String ConverListToPageJson(List<Map<String, Object>> list, int size) {
		 // 新建一个json数组
        JSONArray jsonArray = new JSONArray();
        // 新建一个json对象
        JSONObject jsonObject = null;
        // 遍历泛型集合
        for (Map<String, Object> map : list) {
        	System.out.println(map.toString());
            jsonObject = new JSONObject(map);
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
