<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/easyui.css">
<link rel="stylesheet" type="text/css" href="./layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="./css/articleManage.css">
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.easyui.min.js"></script>


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
				<script type="text/javascript">
				$(function() {
					// 动态菜单数据
					var treeData = [ {
						text : "所有栏目",
						state : "closed",
						children : [ {
							text : "首页",
							state : "",
							attributes : {
								url : "http://www.baidu.com"
							}
						}, {
							text : "课程介绍",
							attributes : {
								url : "http://www.baidu.com"
							}
						}, {
							text : "教学团队",
							attributes : {
								url : "http://www.baidu.com"
							}
						}, {
							text : "课程建设",
							attributes : {
								url : "http://www.baidu.com"
							}
						}, {
							text : "课程资源",
							attributes : {
								url : "http://www.baidu.com"
							}
						}, {
							text : "问题与答疑",
							attributes : {
								url : "http://www.baidu.com"
							}
						}, {
							text : "课程研究",
							attributes : {
								url : "http://www.baidu.com"
							}
						} ]
					} ]

					// 实例化树形菜单
					$("#tree").tree({
						data : treeData,
						lines : true,
						onClick : function(node) {
							if (node.attributes) {
								Open(node.text, node.attributes.url);
							}
						}
					});
					// 在右边center区域打开菜单，新增tab
					function Open(text, url) {
						layui.use('table', function(){
							 var table = layui.table;
							 
							 table.reload('article', {
								 
							 });
							
						});
					}
				});
				</script>
			</div>
		</div>
		<div class="articleManage_right">
			<div class="articleManage_rightOption">
				<span>文章标题：</span> <input id="articleTitle" type="text" placeholder="请输入文章标题">
				<span>创建时间：从</span> <input id="startTime" type="date" placeholder="请输入时间">
				<span>到</span> <input id="endTime" type="date" placeholder="请输入时间">
				<button id="search" class="layui-btn" data-type="reload">搜索</button>
			</div>
			<div class="articleManage_tab">
			<table class="layui-table"  id="demo" lay-data="{width: 892, height:332}" lay-filter="demo">

			</table>
			<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</script>
			<script>
			layui.use('table', function(){
			  var table = layui.table;
			  
			  // 展示已知数据
			  table.render({
				    elem: '#demo'
				    ,data: [{
				      "id": "10001"
				      ,"username": "杜甫"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "116"
				      ,"ip": "192.168.0.8"
				      ,"logins": "108"
				      ,"joinTime": "2016-10-14"
				    }, {
				      "id": "10002"
				      ,"username": "李白"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "12"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				      ,"LAY_CHECKED": true
				    }, {
				      "id": "10003"
				      ,"username": "王勃"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "65"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				    }, {
				      "id": "10004"
				      ,"username": "贤心"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "666"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				    }, {
				      "id": "10005"
				      ,"username": "贤心"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "86"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				    }, {
				      "id": "10006"
				      ,"username": "贤心"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "12"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				    }, {
				      "id": "10007"
				      ,"username": "贤心"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "16"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				    }, {
				      "id": "10008"
				      ,"username": "贤心"
				      ,"email": "xianxin@layui.com"
				      ,"sex": "男"
				      ,"city": "浙江杭州"
				      ,"sign": "人生恰似一场修行"
				      ,"experience": "106"
				      ,"ip": "192.168.0.8"
				      ,"logins": "106"
				      ,"joinTime": "2016-10-14"
				    }]
				    ,height: 272
				    ,cols: [[ //标题栏
				      {checkbox: true, LAY_CHECKED: true} //默认全选
				      ,{field: 'id', title: 'ID', width: 80, sort: true}
				      ,{field: 'username', title: '用户名', width: 120}
				      ,{field: 'email', title: '邮箱', width: 150}
				      ,{field: 'sign', title: '签名', width: 150}
				      ,{field: 'sex', title: '性别', width: 80}
				      ,{field: 'city', title: '城市', width: 100}
				      ,{field: 'experience', title: '积分', width: 80, sort: true}
				    ]] 
			  		,id:'article'
				    ,skin: 'row' //表格风格
				    ,even: true
				    ,page: true //是否显示分页
				    ,limits: [5, 7, 10]
				    ,limit: 5 //每页默认显示的数量
				  });
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
			  
			  $('.tree-node').on('click', function(){
				  table.reload('article',{
					  where: {//设定异步数据接口的额外参数
						  
					  }	,page: {
				  		    curr: 1 //重新从第 1 页开始
				  	  }
					  //,height: 300
					});
			  });
			  
			  $('#search').on('click', function(){
				  var articleTitle = $('#articleTitle').val();
				  var startTime = $('#startTime').val();
				  var endTime = $('#endTime').val();
				  alert(startTime + "" + endTime);
				  table.reload('article',{
					  where: {
						  
					  }	,page: {
				  		    curr: 1 //重新从第 1 页开始
				  	  }
					  //,height: 300
					});
			  });
			  
			});
			</script>
						
			</div>
		</div>
	</div>
</body>
</html>