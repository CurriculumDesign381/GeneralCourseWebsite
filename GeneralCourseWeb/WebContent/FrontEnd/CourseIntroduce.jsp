<%@page import="cqut.dao.ContentManageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="cqut.dao.ContentManageDao,java.util.List, java.util.Map,java.util.Random"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link type="text/css" rel="stylesheet" href="../css/CourseIntroduction.css"/> 
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>课程介绍</title>
</head>
<%List<Map<String,Object>> list =ContentManageDao.getContentManageDao().selectInforFromArcticle2();
java.util.Random r=new java.util.Random(list.size()-1); 
int number = new Random().nextInt(list.size()-1);
System.out.print(list.get(number).get("arcticleContent"));
%>
<body>
    <div class="wholeContent">
        <div class="leftNav">
            <div class="nav_Title"></div>
            <div class="nav">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#">课程介绍</a></li>
                    <li><a href="#">课程简介</a></li>
                    <li><a href="#">教学方法</a></li>
                    <li><a href="#">课程安排</a></li>
                    <li><a href="#">课程大纲</a></li>
                    <li><a href="#">课程动态</a></li>
                </ul>
                
            </div>
        </div>
        <div class="rightContent"><%=list.get(number).get("arcticleContent") %></div>
    </div>
</body>
</html>