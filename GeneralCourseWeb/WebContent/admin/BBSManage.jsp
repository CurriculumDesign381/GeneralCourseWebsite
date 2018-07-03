<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="./css/BBSManage.css">
<script type="text/javascript" src="./layui/layui.js"></script>
<title>留言管理</title>
</head>
<body>
	<div class="BBSManageHead">
		<label>留言管理</label>
	</div>
	<div class="BBSManageContent">
	<h1>留言板管理后台</h1>
	<div class="articleManage_tab">
		<table class="layui-table" id="BBSManage" lay-filter="BBS">
		
		</table>
	<script type="text/html" id="barDemo">
 	<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
	</script>
	<script>
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
        table.render({
            elem: '#BBSManage'
            ,url: 'BBSInfoServlet'
            ,cols: [[
                {field:'id', title: '编号',align: 'center'}
                ,{field:'content', title: '留言内容', align: 'center'}
                ,{field:'date', title: '留言时间', align: 'center'}
                ,{field:'operator', title: '操作', toolbar:"#barDemo",align: 'center'}
            ]]
        	,id: 'BBSMana'
            ,page: true
            ,height: 325
            ,
        });
        
        //监听工具条
        table.on('tool(BBS)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    console.log(data);
                    $.ajax({
                        url: "BBSInfoServlet",
                        type: "POST",
                        data:{"BBSId":data.id,"memthodname":"delete"},
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
            }
        });
    });
	</script>
	
	</div>
	
	</div>
</body>
</html>