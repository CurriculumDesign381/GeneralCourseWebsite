<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>网站后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<style type="text/css"></style>
<script type="text/javascript">
	function refresh(){
		loginform.code.src="admin/validate.jsp?id="+Math.random();
	}
	
/*	function judgeUserandPassword(){
		document.loginform.action = "servlet/LoginServlet";
		document.loginform.method = "get";
		document.loginform.submit();
	}
	*/
</script>
</head>
<body>
	<div  class="content">
		<div class="login">
			<div class="head">
				user Login
				<div class="headtitle">网站后台管理系统<p></div>
			</div>
			<form name="loginform">
				<div class="loginBox">
					<table>
					<tr><td></td><td>请输入用户名和密码</td></tr>
					<tr><td>用户名:&nbsp;</td><td><input type="text" name="user" required=""></td></tr>
					<tr><td>密&nbsp;&nbsp;&nbsp;码:&nbsp;</td><td><input type="password" required=""name="password"></td></tr>
					<tr><td>验证码:&nbsp;</td><td><input type="text" style="width:63px;"name="check_code" id="check_code">
						<img class="img_code" src="admin/validate.jsp" name="code" onclick="refresh()"/>
					</tr>
					</table>
				</div>
				<div class="loginButton"><!--<img src="Images/loginButton.png" id="loginButton" onclick="">--><input type="submit" value="登陆" onclick="judgeUserandPassword()">	</div>
			</form>
		</div>
	</div>
</body>
</html>