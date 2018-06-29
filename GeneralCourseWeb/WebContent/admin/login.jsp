<%@ page language="java" import="java.io.PrintWriter"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	window.onload = function() {
		createCode(4);
	}

	//生成验证码
	function createCode(length) {
		var code = "";
		var codeLength = parseInt(length); //验证码的长度
		var checkCode = document.getElementById("checkCode");
		////所有候选组成验证码的字符，当然也可以用中文的
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		//循环组成验证码的字符串
		for (var i = 0; i < codeLength; i++) {
			//获取随机验证码下标
			var charNum = Math.floor(Math.random() * 62);
			//组合成指定字符验证码
			code += codeChars[charNum];
		}
		if (checkCode) {
			//为验证码区域添加样式名
			checkCode.className = "code";
			//将生成验证码赋值到显示区
			checkCode.innerHTML = code;
		}
	}

	//检查验证码是否正确
	function validateCode() {
		//获取显示区生成的验证码
		var checkCode = document.getElementById("checkCode").innerHTML;
		//获取输入的验证码
		var inputCode = document.getElementById("inputCode").value;
		//console.log(checkCode);
		//console.log(inputCode);
		if (inputCode.length <= 0) {
			alert("请输入验证码！");
			return false;
		} else if (inputCode.toUpperCase() != checkCode.toUpperCase()) {
			alert("验证码输入有误！");
			createCode(4);
			return false;
		} else {
			document.loginform.action = "LoginServlet";
			document.loginform.method = "get";
			document.loginform.submit();
		}
	}
</script>
</head>
<body>
	<div class="content">
		<div class="login">
			<div class="head">
				user Login
				<div class="headtitle">
					网站后台管理系统
					<p>
				</div>
			</div>
			<form name="loginform">
				<div class="loginBox">
					<table>
						<tr>
							<td></td>
							<td>请输入用户名和密码</td>
						</tr>
						<tr>
							<td>用户名:&nbsp;</td>
							<td><input type="text" name="user" required=""></td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;&nbsp;码:&nbsp;</td>
							<td><input type="password" required="" name="password"></td>
						</tr>
						<tr style="padding-top: 4px;">
							<td>验证码:&nbsp;</td>
							<td><input type="text" style="width: 63px;" id="inputCode"
								id="inputCode">
								<div id="checkCode" class="code" onclick="createCode(4)"></div></td>
						</tr>
					</table>
				</div>
				<div class="loginButton">
					<img src="Images/loginButton.png" id="loginButton" onclick="validateCode()">
					
				</div>
			</form>
		</div>
	</div>
</body>
</html>