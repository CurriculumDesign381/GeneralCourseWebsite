<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>

<title>Insert title here</title>
<style>
article, aside, figure, footer, header, hgroup, menu, nav, section {
	display: block;
}

.west {
	width: 190px;
}

.north {
	height: 30px;
}
</style>
</head>
<body>
	<div class="articleManageHead"></div>
	<div class="articleManage_content">
		<div class="articleManage_left">
			<div region="west" class="west" title="菜单">
				<ul id="tree">
				</ul>
			</div>
		</div>
		<div class="articleManage_right">
			<div class="articleManage_rightOption">
				<span>文章标题：</span> <input type="text" placeholder="请输入文章标题">
				<span>创建时间：从</span> <input type="date" placeholder="请输入时间">
				<span>到</span> <input type="date" placeholder="请输入时间">
				 <input	type="button" value="搜索">
			</div>
			<div class="articleManage_tab">
			<table class="layui-table" lay-data="{width: 892, height:332, url:'/demo/table/user/', page:true, id:'idTest'}" lay-filter="demo">
			  <thead>
			    <tr>
			      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
			      <th lay-data="{field:'id', width:199}">文章标题</th>
			      <th lay-data="{field:'username', width:108}">作者</th>
			      <th lay-data="{field:'sex', width:115}">栏目名称</th>
			      <th lay-data="{field:'city', width:145}">创建日期</th>
			      <th lay-data="{fixed: 'right', width:325, align:'center', toolbar: '#barDemo'}">操作</th>
			    </tr>
			  </thead>
			</table>
			<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</script>
			<script>
			layui.use('table', function(){
			  var table = layui.table;
			  //监听表格复选框选择
			  table.on('checkbox(demo)', function(obj){
			    console.log(obj)
			  });
			  //监听工具条
			  table.on('tool(demo)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'detail'){
			      layer.msg('ID：'+ data.id + ' 的查看操作');
			    } else if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			        obj.del();
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
			      layer.alert('编辑行：<br>'+ JSON.stringify(data))
			    }
			  });
			  
			  var $ = layui.$, active = {
			    getCheckData: function(){ //获取选中数据
			      var checkStatus = table.checkStatus('idTest')
			      ,data = checkStatus.data;
			      layer.alert(JSON.stringify(data));
			    }
			    ,getCheckLength: function(){ //获取选中数目
			      var checkStatus = table.checkStatus('idTest')
			      ,data = checkStatus.data;
			      layer.msg('选中了：'+ data.length + ' 个');
			    }
			    ,isAll: function(){ //验证是否全选
			      var checkStatus = table.checkStatus('idTest');
			      layer.msg(checkStatus.isAll ? '全选': '未全选')
			    }
			  };
			  
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  });
			});
			</script>
						
			</div>
		</div>
	</div>
</body>
</html>