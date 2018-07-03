<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统设置</title>
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<link rel="stylesheet" type="text/css" href="../css/articleManage.css" />
<link rel="stylesheet" type="text/css" href="../css/authority.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function doAction(index) {
		var obj = document.getElementById('u' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '1') {
				document.getElementById("img1").src = 'Images/down.png';
			} else {
				document.getElementById("img2").src = 'Images/down.png';
			}
		} else {
			obj.style.display = "none";
			if (index == '1') {
				document.getElementById("img1").src = 'Images/right.png';
			} else {
				document.getElementById("img2").src = 'Images/right.png';
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
	<div class="content">
		<div class="title"></div>
		<div class="head"></div>
		<div class="middle">
			<div class="left">
				<div class="time"></div>
				<ul class="list">
					<li><span style="color: white;">&nbsp;&nbsp;网站内容管理&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="Images/right.png" id="img1" onclick="doAction(1);">
					</span></li>
					<ul class="insideUl" style="display: none;" id="u1">
						<li style="text-align: center;"><img
							src="Images/smallright.jpg"> <a target="BBSManage.jsp">留言管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><img
							src="Images/smallright.jpg"> <a target="articleManage.jsp">文章管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><img
							src="Images/smallright.jpg"> <a target="checkArticle.jsp">审核文章</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><img
							src="Images/smallright.jpg"> <a target="column.jsp">栏目管理</a></li>
						<div class="line"></div>
					</ul>

					<li><span style="color: white;">&nbsp;&nbsp;系统设置&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="Images/right.png" id="img2" onclick="doAction(2);">
					</span></li>
					<ul class="insideUl" style="display: none;" id="u2">
						<li style="text-align: center;"><a href="../PermissionServlet"
							target="innerFrame"><img src="Images/smallright.jpg">权限管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><a target="module.jsp"><img
								src="Images/smallright.jpg">模块管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><a target="roleDivide.jsp"><img
								src="Images/smallright.jpg">角色分配</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><a target="personManage.jsp"><img
								src="Images/smallright.jpg">人员管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><a target="roleManage.jsp"><img
								src="Images/smallright.jpg">角色管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a target="default.jsp"><img src="Images/smallright.jpg">默认功能设置</a>
						</li>
						<div class="line"></div>
						<li style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a target="homePageInfo.jsp"><img src="Images/smallright.jpg">首页信息设置</a>
						</li>
						<div class="line"></div>
						<li style="text-align: center;"><a target="codeTable.jsp"><img
								src="Images/smallright.jpg">码表管理</a></li>
						<div class="line"></div>
					</ul>
				</ul>


			</div>
			<div class="bggradientcolor">
				<div class="topbggradientcolor"></div>
				<div class="buttombggradientcolor"></div>
			</div>
			<div class="right">
			<iframe src="BBSManage.jsp" class="innerFrame" name="innerFrame"
					frameborder="0" scrolling="auto"
					style="margin: 0px auto; width: 100%;height:100%; -ms-overflow-x: hidden;"></iframe>
			</div>
		</div>
		<div class="bottom">
			<div class="headbottom"></div>
			<div class="bottombottom"></div>
		</div>
	</div>
</body>
</html>