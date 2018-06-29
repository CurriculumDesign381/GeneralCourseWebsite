<%@ page language="java" 
	import="java.io.PrintWriter"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession httpSession=request.getSession();
		String ranString=(String)httpSession.getAttribute("randStr");
		String code=request.getParameter("check_code");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter=response.getWriter();
		if(code.equals(ranString)){
			printWriter.write("验证码正确");
		}else{
			printWriter.write("验证码不正确");
		}
	%>
</body>
</html>