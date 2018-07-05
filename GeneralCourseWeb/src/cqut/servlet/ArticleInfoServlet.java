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

import cqut.dao.ContentManageDao;

/**
 * Servlet implementation class ArticleInfoServlet
 */
@WebServlet("/ArticleInfoServlet")
public class ArticleInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleInfoServlet() {
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
                    deleteArticle(request,response);
                    break;
                case "check":
                	checkArticle(request,response);
                	break;
                case "edit":
                	editArticle(request,response);
                	break;
                default:
                    queryList(request, response);
            }

        }else {
            queryList(request, response);

        }
	}

	private void editArticle(HttpServletRequest request, HttpServletResponse response) {
		ContentManageDao contentManageDao = new ContentManageDao();
		String articleTitle = request.getParameter("Title");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		response.setStatus(200);
		
		boolean state = contentManageDao.editArticleByTitleAndAuthor(articleTitle,author,content);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",state);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void checkArticle(HttpServletRequest request, HttpServletResponse response) {
		ContentManageDao contentManageDao = new ContentManageDao();
		String articleTitle = request.getParameter("articleTitle");
		String author = request.getParameter("author");
		response.setStatus(200);
		
		boolean state = contentManageDao.checkArticleByTitleAndAuthor(articleTitle,author);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",state);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void deleteArticle(HttpServletRequest request, HttpServletResponse response) {
		ContentManageDao contentManageDao = new ContentManageDao();
		String articleTitle = request.getParameter("articleTitle");
		String author = request.getParameter("author");
		response.setStatus(200);
		
		boolean state = contentManageDao.deleteArticleByTitleAndAuthor(articleTitle,author);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",state);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void queryList(HttpServletRequest request, HttpServletResponse response) {
		ContentManageDao contentManageDao = new ContentManageDao();
		Integer limit =  Integer.parseInt(request.getParameter("limit"));
		Integer page = Integer.parseInt(request.getParameter("page"));
		try {
			List<Map<String, Object>> list = contentManageDao.selectInforFromArcticle();
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
