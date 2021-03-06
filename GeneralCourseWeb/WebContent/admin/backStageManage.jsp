<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统设置</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function doAction(index) {
		var obj = document.getElementById('u'+index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '0') {
				document.getElementById("img"+index).src = 'Images/down.png';
			} else {
				document.getElementById("img"+index).src = 'Images/down.png';
			}
		} else {
			obj.style.display = "none";
			if (index == '0') {
				document.getElementById("img"+index).src = 'Images/right.png';
			} else {
				document.getElementById("img"+index).src = 'Images/right.png';
			}
		}
	}

	
	/*$(document).ready(function(){ 
	　　$.get("admin/BBSManage.jsp",function(data){ //初始将 include div#iframe
	　　　　$("#iframe").html(data);
	　　});
	});
	

	$(function(){
	　　$('.insideUl li').click(function() {
	  　　// 找出 li 中的超链接 href(#id)
	 　　　　var $this = $(this),
	 　　　　clickTab = 'admin/' + $this.find('a').attr('target'); // 找到链接a中的target的值
	 　　　　$.ajax({
		 		dataType:'text',
		 		url:clickTab,
		 		data: { 			
		 		},
		 		success:function(msg) {
		 			$('#iframe').html(msg);
		 		}
	 　　　　});
	　　});
	});
	 */
</script>
</head>
<body>

	<%HashMap<Integer,String> hash = new HashMap<>();
	hash.put(12, "BBSManageServlet");
	hash.put(11, "ArticleManageServlet");
	hash.put(10, "CheckArticleServlet");
	hash.put(9, "admin/column.jsp");
	hash.put(8, "PermissionServlet");
	hash.put(7, "admin/module.jsp");
	hash.put(6, "admin/roleDivide.jsp");
	hash.put(5, "admin/personManage.jsp");
	hash.put(4, "admin/roleManage.jsp");
	hash.put(3, "admin/default.jsp");
	hash.put(2, "admin/homePageInfo.jsp");
	hash.put(1, "admin/codeTable.jsp");
	%>
	<div class="content">
		<div class="title"></div>
		<div class="head"></div>
		<div class="middle">
			<div class="left">
				<div class="time"></div>
				<ul class="list">
					<%
					List<Map<String, Object>> templateName =(List<Map<String, Object>>)request.getAttribute("templateName");
					int size=templateName.size();
					ArrayList<Map<String,Integer>> authority = new ArrayList<>();
					List<Map<String, Object>> list =(List<Map<String, Object>>)request.getAttribute("list");
					for(int i = 0;i <templateName.size();i++){ 
						authority.add(new HashMap<String,Integer>());
						for(int j = 0; j < list.size();j++){
							if(list.get(j).get("TemplateName").equals(templateName.get(i).get("TemplateName"))){
								authority.get(i).put((String)list.get(j).get("name"),Integer.parseInt((String)list.get(j).get("operationTypeID")));
							}
						
						}
						
					}
					
					for(int i = 0; i < templateName.size(); i++){%>
					<li style="list-style-type: none;"><span style="color: white;font-size:12px;">&nbsp;&nbsp;<%=templateName.get(i).get("TemplateName")%>&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="Images/right.png" id="img<%=i%>" onclick="doAction(<%=i%>);">
					</span></li>
					<ul style="display: none;" id="u<%=i%>">
						<%for(String key:authority.get(i).keySet()){ %>
						<li style="text-align: left;list-style-type: none;font-size:12px;background-color:#fff;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="Images/smallright.jpg"> <a href="<%=hash.get(authority.get(i).get(key))%>" target="innerFrame"><%=key%></a></li>
							<div class="line"></div>
						
						<%}%>
					</ul>
				<%}
					%>
				</ul>
			</div>
			<div class="bggradientcolor">
				<div class="topbggradientcolor"></div>
				<div class="buttombggradientcolor"></div>
			</div>
			<div class="right">
			<iframe src="BBSManageServlet" class="innerFrame" name="innerFrame"
					frameborder="0" scrolling="auto"
					style="margin: 0px auto; height: 100%;width:100%; -ms-overflow-x: hidden;"></iframe>
			</div>
		</div>
		<div class="bottom">
			<div class="headbottom"></div>
			<div class="bottombottom"></div>
		</div>
	</div>
</body>
</html>