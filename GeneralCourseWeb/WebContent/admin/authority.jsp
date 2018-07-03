<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
<link rel="stylesheet" type="text/css" href="./css/authority.css" />
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function authoritydoAction1(index) {
		var obj = document.getElementById('u' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '3') {
				document.getElementById("manageimg1").src = 'Images/reduce.jpg';
			}
		} else {
			obj.style.display = "none";
			if (index == '3') {
				document.getElementById("manageimg1").src = 'Images/add.jpg';
			}
		}
	}
	function authoritydoAction2(index) {
		var obj = document.getElementById('n' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '1') {
				document.getElementById("authorityimg1").src = 'Images/reduce.jpg';
			}
		} else {
			obj.style.display = "none";
			if (index == '1') {
				document.getElementById("authorityimg1").src = 'Images/add.jpg';
			} 
		}
	}
	function authoritydoAction3(index) {
		var obj = document.getElementById('m' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '1') {
				document.getElementById("currency1").src = 'Images/reduce.jpg';
			} 
		} else {
			obj.style.display = "none";
			if (index == '1') {
				document.getElementById("currency1").src = 'Images/add.jpg';
			}
		}
	}
	
	function authoritydoAction4(index) {
		var obj = document.getElementById('d' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '1') {
				document.getElementById("systemimg1").src = 'Images/reduce.jpg';
			} else {
				document.getElementById("systemimg2").src = 'Images/reduce.jpg';
			}
		} else {
			obj.style.display = "none";
			if (index == '1') {
				document.getElementById("systemimg1").src = 'Images/add.jpg';
			} else {
				document.getElementById("systemimg2").src = 'Images/add.jpg';
			}
		}
	}
	
	$(document).ready(function(e) {
	    $(".authoritymanager").click(function(e) {
	        $(".allauthority").toggle();
	    });
	});
</script>
</head>
<body>
	<div class="authority">
		<div class="authorityhead"></div>
		<div class="authoritycontent">
			<ul class="authoritymanager">
					<li><span style="color:black;"><img src="Images/add.jpg" id="manageimg1" onclick="authoritydoAction1(3);">
						<img src="Images/folder.jpg" >全部角色</span></li>
					<ul style="display: none;" id="u3">
						<li style="text-align: center;"><img src="Images/word.jpg">
							 <a href="#">超级管理员</a></li>
						
						<li style="text-align: center;"><img src="Images/word.jpg">
							<a href="#">高级管理员</a></li>
						
						<li style="text-align: center;"><img src="Images/word.jpg">
							<a href="#">普通管理员</a></li>
							
					</ul>
			</ul>
			
			<ul class="allauthority">
				<li><span style="color:black;"><img src="Images/add.jpg" id="authorityimg1" onclick="authoritydoAction2(1);">
					<img src="Images/folder.jpg" >全部模块</span></li>
				<ul style="display: none;" id="n1">
					<li><span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/add.jpg" id="currency1" onclick="authoritydoAction3(1);">
						<img src="Images/folder.jpg" >通用网站</span></li>
					<ul style="display: none;" id="m1">
						<li><span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/add.jpg" id="systemimg1" onclick="authoritydoAction4(1);">
							<img src="Images/folder.jpg" >系统设置</span></li>
						<ul style="display: none;" id="d1">
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="1"/>
								<img src="Images/word.jpg"><a href="#">码表管理</a></li>
							
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="2"/>
								<img src="Images/word.jpg"><a href="#">首页信息设置</a></li>
							
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="3"/>
								<img src="Images/word.jpg"><a href="#">默认功能设置</a></li>
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="4"/> 
								<img src="Images/word.jpg"><a href="#">角色管理</a></li>
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="5"/>
								<img src="Images/word.jpg"><a href="#">人员管理</a></li>
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="6"/>
								<img src="Images/word.jpg"><a href="#">角色分配</a></li>
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="7"/>
								<img src="Images/word.jpg"><a href="#">模块管理</a></li>
							<li style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="g" type="checkbox" value="8"/> 
								<img src="Images/word.jpg"><a href="#">权限管理</a></li>
						</ul>
					
						<ul id="m2">
							<li><span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/add.jpg" id="systemimg2" onclick="authoritydoAction4(2);">
							<img src="Images/folder.jpg" >网站内容管理</span></li>
							<ul style="display: none;" id="d2">
								<li style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="g" type="checkbox" value="9"/>
									<img src="Images/word.jpg"><a href="#">栏目管理</a></li>
							
								<li style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="g" type="checkbox" value="10"/>
									<img src="Images/word.jpg"><a href="#">审核文章</a></li>
							
								<li style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="g" type="checkbox" value="11"/> 
									<img src="Images/word.jpg"><a href="#">文章管理</a></li>
								<li style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="g" type="checkbox" value="12"/>
									<img src="Images/word.jpg"><a href="#">留言管理</a></li>
							</ul>
						</ul>
					</ul>
				</ul>
			</ul>
		</div>
	</div>
</body>
</html>