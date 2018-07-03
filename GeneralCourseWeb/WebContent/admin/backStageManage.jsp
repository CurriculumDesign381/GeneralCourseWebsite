<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统设置</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/articleManage.css" />
<link rel="stylesheet" type="text/css" href="css/authority.css" />
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

	<%HashMap<String,String> hash = new HashMap<>();
	hash.put("00", "admin/BBSManage.jsp");
	hash.put("01", "admin/articleManage.jsp");
	hash.put("02", "admin/checkArticle.jsp");
	hash.put("03", "admin/column.jsp");
	hash.put("10", "PermissionServlet");
	hash.put("11", "admin/module.jsp");
	hash.put("12", "admin/roleDivide.jsp");
	hash.put("13", "admin/personManage.jsp");
	hash.put("14", "admin/roleManage.jsp");
	hash.put("15", "admin/default.jsp");
	hash.put("16", "admin/homePageInfo.jsp");
	hash.put("17", "admin/codeTable.jsp");
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
					ArrayList<ArrayList<String>> authority = new ArrayList<>();
					List<Map<String, Object>> list =(List<Map<String, Object>>)request.getAttribute("list");
					for(int i = 0;i <templateName.size();i++){ 
						authority.add(new ArrayList<String>());
						for(int j = 0; j < list.size();j++){
							if(list.get(j).get("TemplateName").equals(templateName.get(i).get("TemplateName"))){
								authority.get(i).add((String)list.get(j).get("name"));
							}
						
						}
						
					}
					
					for(int i = 0; i < templateName.size(); i++){%>
					<li style="list-style-type: none;"><span style="color: white;font-size:12px;">&nbsp;&nbsp;<%=templateName.get(i).get("TemplateName")%>&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="Images/right.png" id="img<%=i%>" onclick="doAction(<%=i%>);">
					</span></li>
					<ul style="display: none;" id="u<%=i%>">
						<%for(int j = 0; j < authority.get(i).size();j++){ %>
						<li style="text-align: left;list-style-type: none;font-size:12px;background-color:#fff;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=hash.get(i+""+j)%>" target="innerFrame"><img src="Images/smallright.jpg"><%=authority.get(i).get(j)%></a></li>
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
			<iframe src="admin/BBSManage.jsp" class="innerFrame" name="innerFrame"
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