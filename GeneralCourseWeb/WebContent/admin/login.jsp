<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<style type="text/css"></style>
<script type="text/javascript">
	function reloadImage(){//更新验证码图片
	    document.getElementById('identity').src='servlet/CreateSercurityCode?ts='+new Date().getTime();
	}
	function judge(){
		if(document.getElementById('sercurity').value != '${sessionScope.randomString}'){
			alert("验证码有误！");
	    	return false;
		}
		else{
			alert("正在登陆……");
		}
	}
</script>
</head>
<body>
	<div  class="content">
		<div class="login">
			<div class="head">
				user Login
				<div class="headtitle">网站后台管理系统<p></div>
			</div>
			<form name="demo">
				<div class="loginBox">
					<table>
					<tr><td></td><td>请输入用户名和密码</td></tr>
					<tr><td>用户名:&nbsp;</td><td><input type="text" name="user"></td></tr>
					<tr><td>密&nbsp;&nbsp;&nbsp;码:&nbsp;</td><td><input type="password" name="password"></td></tr>
					<tr><td>验证码:&nbsp;</td><td><input type="text" style="width:63px;"name="sercurity" id="sercurity">
						<img src="servlet/CreateSercurityCode" id="identity" onclick="reloadImage()" /></td>
					</tr>
					</table>
				</div>
			</form>
			<div class="loginButton"><img src="./Images/loginButton.png" id="loginButton"onclick="judge()" ></div>
		</div>
	</div>
</body>
</html>