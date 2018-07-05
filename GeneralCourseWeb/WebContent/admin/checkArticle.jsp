<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="./css/BBSManage.css">
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<title>审核文章</title>
</head>
<body>
<div class="BBSManageHead">
		<label>审核文章</label>
	</div>
	<div class="BBSManageContent">
	<h1>审核文章后台</h1>
	<div class="articleManage_tab">
		<table class="layui-table"  id="articleTab"  lay-filter="articleTab">

			</table>
	<script type="text/html" id="barDemo">
 	<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="check">通过审核</a>
	</script>
	<script>
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
       table.render({
				  	url: 'ArticleInfoServlet'
				    ,elem: '#articleTab'
				    ,cols: [[ //标题栏
				      {checkbox: true, LAY_CHECKED: true} //默认全选
				      ,{field: 'title', title: '文章标题', align:'center'}
				      ,{field: 'author', title: '作者',  align:'center'}
				      ,{field: 'column', title: '栏目名称',width:120, align:'center'}
				      ,{field: 'createTime', title: '创建日期',  align:'center'}
				      ,{field: 'isPass', title: '审核状态',width:120, align:'center'}
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
        
        //监听工具条
        table.on('tool(articleTab)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.open({
                	title: data.title,
                	content: data.content
                });
            } else if(obj.event === 'check'){
            	if(data.isPass == "审核通过") {
            		 layer.msg("该文章已经审核通过", {icon: 6});
            		 return;
            	} else {
            		 layer.confirm('确认通过审核吗？', function(index){
                         console.log(data);
                         $.ajax({
                             url: "ArticleInfoServlet",
                             type: "POST",
                             data:{"articleTitle":data.title,"author":data.author,"memthodname":"check"},
                             dataType: "json",
                             success: function(data){

                                 if(data.state==1){
                                     obj.del();
                                     layer.close(index);
                                     layer.msg("审核成功", {icon: 6});
                                 }else{
                                     layer.msg("审核失败", {icon: 5});
                                 }
                             }

                         });
                     });
            	}
               
            }
        });
    });
	</script>
	
	</div>
	
	</div>
</body>
</html>