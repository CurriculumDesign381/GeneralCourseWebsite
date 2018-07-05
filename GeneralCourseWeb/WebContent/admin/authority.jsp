<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
						                       
						List<Map<String, Object>> role = (List<Map<String, Object>>)request.getAttribute("role");
						List<Map<String, Object>> authority = (List<Map<String, Object>>)request.getAttribute("authority");
						List<Map<String, Object>> templateName =(List<Map<String, Object>>)request.getAttribute("templateName");
						List<Map<String, Object>> list =(List<Map<String, Object>>)request.getAttribute("list");	
						
%>
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
	 /*点击全部模块展开或收回*/
		function authoritydoAction2(index) {
			var obj = document.getElementById('n' + index);//将子ul显示或隐藏出来
			if (obj.style.display == "none") {
				obj.style.display = "block";
				if (index == '1') {
					document.getElementById("authorityimg1").src = 'Images/reduce.jpg';//改变当前ul前面的展开或收回的符号
				}
			} else {
				obj.style.display = "none";
				if (index == '1') {
					document.getElementById("authorityimg1").src = 'Images/add.jpg';
				} 
			}
			
		}
	/*点击通用网站展开或收回*/
	function authoritydoAction3(index) {
		var obj = document.getElementById('authoType' + index);
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
	
	/*点击权限模块展开或收回*/
	function authoritydoAction4(index) {
		var obj = document.getElementById('autho' + index);
		if (obj.style.display == "none") {
			obj.style.display = "block";
			if (index == '0') {
				document.getElementById("systemimg"+index).src = 'Images/reduce.jpg';
			} else {
				document.getElementById("systemimg"+index).src = 'Images/reduce.jpg';
			}
		} else {
			obj.style.display = "none";
			if (index == '1') {
				document.getElementById("systemimg"+index).src = 'Images/add.jpg';
			} else {
				document.getElementById("systemimg"+index).src = 'Images/add.jpg';
			}
		}
	}
	
	 function change(id,obj){
         var arr = document.getElementById("u3").getElementsByTagName("li");
         for (var i = 0; i < arr.length; i++) {
             var a = arr[i];
             a.style.background = "white";
         };
         obj.style.background = "skyblue";
       
         var box=document.getElementsByName("authority");
         var objArray = box.length;
         var chestry="";
         for(var i = 0; i<objArray;i++ ){
        	 if(box[i].checked == true){
        		 chestry+=box[i].value+",";
        	 }
         }
       
         javascript:location.href="ChangeAuthorityServlet?roleId="+id+"&authority="+ chestry;
     }
	/*$(document).ready(function(e) {
	    $(".authoritymanager").click(function(e) {
	        $(".allauthority").toggle();
	    });
	}); */
</script>
</head>
<body> 
	<form name="demo">
		<div class="authoritycontent">
			<ul class="authoritymanager">
					<li><span style="color:black;"><img src="Images/add.jpg" id="manageimg1" onclick="authoritydoAction1(3);">
						<img src="Images/folder.jpg" >全部角色</span></li>
					<ul style="display: none;" id="u3">
					<%for(int i = 0; i < role.size();i++){ %>
						<li style="text-align: center;" name ="<%=role.get(i).get("roleID")%>" onclick="change(<%=role.get(i).get("roleID")%>,this);"><img src="Images/word.jpg">
							 <a href="#"><%=role.get(i).get("roleName") %></a></li>
					<%}%>
					</ul>
			</ul>
			
			
				<ul class="allauthority">
					<li><span style="color:black;"><img src="Images/add.jpg" id="authorityimg1" onclick="authoritydoAction2(1);">
							<img src="Images/folder.jpg" >全部模块</span></li>
						<ul  id="n1">
							<li><span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/add.jpg" id="currency1" onclick="authoritydoAction3(1);">
								<img src="Images/folder.jpg" >通用网站</span></li>
								<ul  id="authoType1">
								<%for(int i = 0; i < templateName.size(); i++){%>
									<li><span style="color:black;"><img src="Images/add.jpg" id="systemimg<%=i %>" onclick="authoritydoAction4(<%=i%>);">
									<img src="Images/folder.jpg" ><%=templateName.get(i).get("TemplateName")%></span></li>
									<ul id="autho<%=i%>">
									<% for(int j=0; j < authority.size();j++){
										if(Integer.parseInt(authority.get(j).get("TemplateID").toString())==Integer.parseInt(templateName.get(i).get("TemplateID").toString())){%>
											<li style="text-align:left;">
											<input id="authority" name="authority" type="checkbox" value="<%=authority.get(j).get("operationTypeID")%>"/>
											<img src="Images/word.jpg"><a href="#"><%=authority.get(j).get("name") %></a></li>
										<%}
								}
								%>
										</ul>
									
								<%}
								%>
							</ul>
						</ul>
						
				</ul>
		</div>
	</form>
</body>
</html>