<%@page import="cqut.dao.BBSManageDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="../css/interactiveTeaching.css"
	rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>
<%
BBSManageDao bbsManageDao = new BBSManageDao();

List<Map<String, Object>> list = bbsManageDao.selectAllInfo();
%>
<body>
	<div class="whole">
		<div>
			<h1>教学互动</h1>
		</div>
		<div class="msg_box">
			<div class="box_title">
				<p>留言板</p>
			</div>
			<div class="description">
				<p>我爱学习，学习使我快乐
			</div>
			<h4>发表您的留言</h4>
			<div class="send_msg">
				<textarea rows="5" cols="95"></textarea>
				<br>
				<input class="send" type="button" value="发表">
			</div>
			<script type="text/javascript">
			$(".send").click(function() {
				var content = $("textarea").val();
				if(content == "") {
					alert("留言不能为空");
					return;
				} else {
					 $.ajax({
	                        url: "../BBSInfoServlet",
	                        type: "POST",
	                        data:{"content":content,"memthodname":"add"},
	                        dataType: "json",
	                        success: function(data){

	                            if(data.state==1){
	                                alert("发表成功");
	                                window.location.reload();
	                            }else{
	                                alert("发表失败");
	                            }
	                        }

	                    });
					
					
					
				}
				
				
			});
			
			
			</script>
			<div class="msg_content">
			<ul >
			<% for(int i = list.size() - 1; i >= 0; i--) {%>
				<li>
					<p class="tit">
						<span>匿名</span> 
						<span>第<%=(i + 1)%>楼</span>
					</p>
					<div class="msg_mainContent">
						<table style="width: 100%; word-break: break-all; margin-top: 15px">
							<tbody>
								<tr>
									<td><%=list.get(i).get("content")%></td>
								</tr>
							</tbody>
						</table>
						<p class="msg_time"><%=list.get(i).get("date").toString().substring(0, 16) %></p>
					</div>
				</li>
				<%} %>
			 </ul>
			</div>
			
		</div>
	</div>
</body>
</html>