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
				<button id="search" class="layui-btn" data-type="reload" style="line-height: normal;">搜索</button>
			</div>
			<div class="articleManage_tab">
			<table class="layui-table"  id="articleTab"  lay-filter="articleTab">

			</table>
			<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</script>
			<script>
			layui.use('table', function(){
			  var table = layui.table;
			  
			  table.render({
				  	url: 'ArticleInfoServlet'
				    ,elem: '#articleTab'
				    ,height: 272
				    ,cols: [[ //标题栏
				      {checkbox: true, LAY_CHECKED: true} //默认全选
				      ,{field: 'title', title: '文章标题', align:'center'}
				      ,{field: 'author', title: '作者', width:100, align:'center'}
				      ,{field: 'column', title: '栏目名称',  align:'center'}
				      ,{field: 'createTime', title: '创建日期',  align:'center'}
				      ,{field: 'isTop', title: '是否置顶',width:100,	  align:'center'}
				      ,{field:'right', title: '操作',toolbar:"#barDemo",align:'center'}
				    ]] 
			  		,id:'article'
				    ,skin: 'row' //表格风格
				    ,even: true
				    ,page: true //是否显示分页
				    ,limits: [5, 7, 10]
				    ,limit: 7 //每页默认显示的数量
				    ,height: 330
				  });
			  
			  //监听表格复选框选择
			  table.on('checkbox(articleTab)', function(obj){
			    console.log(obj)
			  });
			  //监听工具条
			  table.on('tool(articleTab)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'detail'){
		                layer.open({
		                	title: data.title,
		                	content: data.content
		                });
			    } else if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			    	  console.log(data);
	                    $.ajax({
	                        url: "ArticleInfoServlet",
	                        type: "POST",
	                        data:{"articleTitle":data.title,"author":author,"memthodname":"delete"},
	                        dataType: "json",
	                        success: function(data){

	                            if(data.state==1){
	                                obj.del();
	                                layer.close(index);
	                                layer.msg("删除成功", {icon: 6});
	                            }else{
	                                layer.msg("删除失败", {icon: 5});
	                            }
	                        }

	                    });
			      });
			    } else if(obj.event === 'edit'){
			    	layer.prompt({
			            formType: 2
			            ,title: '修改文章标题为 ['+ data.title +'] 的内容'
			            ,value: data.content
			        }, function(value, index){
			            EditArticle(data,value,index,obj);
			        });
			   	}
			    
			    
			
				//  编辑的方法
						function EditArticle(data, value, index, obj) {
							$.ajax({
								url : "ArticleInfoServlet",
								type : "POST",
								data : {
									"Title" : data.title,
									"memthodname" : "edit",
									"author" : data.author,
									"content" : value
								},
								dataType : "json",
								success : function(data) {

									if (data.state == 1) {
										//关闭弹框
										layer.close(index);
										//同步更新表格和缓存对应的值
										obj.update({
											content : value
										});
										layer.msg("修改成功", {
											icon : 6
										});
									} else {
										layer.msg("修改失败", {
											icon : 5
										});
									}
								}

							});
						}
					});

					$('.tree-node').on('click', function() {
						table.reload('article', {
							where : {//设定异步数据接口的额外参数

							},
							page : {
								curr : 1
							//重新从第 1 页开始
							}
						//,height: 300
						});
					});

					$('#search').on('click', function() {
						var articleTitle = $('#articleTitle').val();
						var startTime = $('#startTime').val();
						var endTime = $('#endTime').val();
						alert(startTime + "" + endTime);
						table.reload('article', {
							where : {

							},
							page : {
								curr : 1
							//重新从第 1 页开始
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