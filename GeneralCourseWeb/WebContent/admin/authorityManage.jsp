<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统设置</title>
<link rel="stylesheet" type="text/css" href="css/Authority.css" />
<script type="text/javascript">
	function doAction(index) {
		var obj = document.getElementById('u' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '1') {
				document.getElementById("img1").src = './Images/down.jpg';
			} else {
				document.getElementById("img2").src = './Images/down.jpg';
			}
		} else {
			obj.style.display = "none";
			if (index == '1') {
				document.getElementById("img1").src = './Images/right.jpg';
			} else {
				document.getElementById("img2").src = './Images/right.jpg';
			}
		}
	}
</script>
</head>
<body>
	<div class="content">
		<div class="head"></div>
		<div class="middle">
			<div class="left">
				<div class="time"></div>
				<ul class="list">
					<li><span style="color: white;">&nbsp;&nbsp;网站内容管理&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="./Images/right.jpg" id="img1" onclick="doAction(1);">
					</span></li>
					<ul style="display: none;" id="u1">
						<li style="text-align: center;"><img src="./Images/smallright.jpg">
							 <a href="#">留言管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><img src="./Images/smallright.jpg">
							<a href="#">文章管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><img src="./Images/smallright.jpg">
							<a href="#">审核文章</a></li>
						<div class="line"></div>
						<li style="text-align: center;"><img src="./Images/smallright.jpg">
							<a href="#">栏目管理</a></li>
						<div class="line"></div>
					</ul>

					<li><span style="color: white;">&nbsp;&nbsp;系统设置&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="./Images/right.jpg" id="img2" onclick="doAction(2);">
					</span></li>
					<ul style="display: none;" id="u2">
						<li style="text-align: center;">
							<a href="#"><img src="./Images/smallright.jpg">权限管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;">
							<a href="#"><img src="./Images/smallright.jpg">模块管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;">
							<a href="#"><img src="./Images/smallright.jpg">角色分配</a></li>
						<div class="line"></div>
						<li style="text-align: center;">
							<a href="#"><img src="./Images/smallright.jpg">人员管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;">
							<a href="#"><img src="./Images/smallright.jpg">角色管理</a></li>
						<div class="line"></div>
						<li style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#"><img src="./Images/smallright.jpg">默认功能设置</a></li>
						<div class="line"></div>
						<li style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#"><img src="./Images/smallright.jpg">首页信息设置</a></li>
						<div class="line"></div>
						<li style="text-align: center;">
							<a href="#"><img src="./Images/smallright.jpg">码表管理</a></li>
						<div class="line"></div>
					</ul>
				</ul>


			</div>
			<div class="bggradientcolor">
				<div class="topbggradientcolor"></div>
				<div class="buttombggradientcolor"></div>
			</div>
			<div class="right"></div>
		</div>
		<div class="bottom">
			<div class="headbottom"></div>
			<div class="bottombottom"></div>
		</div>
	</div>
</body>
</html>