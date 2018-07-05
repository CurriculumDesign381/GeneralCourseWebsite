<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="../css/BBSManage.css">
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>

</head>
<body>
<div class="BBSManageHead">
		<label>人员管理</label>
	</div>
	<div class="BBSManageContent">
	<h1>人员管理后台</h1>
	
	<div class="articleManage_tab">
		<table class="layui-table" id="BBSManage" lay-filter="BBS">
		
		</table>
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
	</script>
	<script>
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
        table.render({
            elem: '#BBSManage'
            ,url: '../UserServlet'
            ,cols: [[
                {field:'id', title: '管理员ID',align: 'center'}
                ,{field:'name', title: '管理员姓名', align: 'center'}
                ,{field:'operator', title: '操作', toolbar:"#barDemo",align: 'center'}
            ]]
        	,id: "UserMana"
            ,page: true
            ,height: 325
            ,
        });
        
        //监听工具条
        table.on('tool(BBS)', function(obj){
            var data = obj.data;
           	if(obj.event === 'del'){
                layer.confirm('确认删除该管理员？', function(index){
                  
                    $.ajax({
                        url: "../UserServlet",
                        type: "POST",
                        data:{"UserId":data.id,"memthodname":"delete"},
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

    var btn = document.getElementById('show');
    var close = document.getElementsByClassName('close')[0];
    var cancel = document.getElementById('cancel');
    var modal = document.getElementById('addManager');
    btn.addEventListener('click', function(){
        modal.style.display = "block";
    });
    close.addEventListener('click', function(){
        modal.style.display = "none";
    });
    cancel.addEventListener('click', function(){
        modal.style.display = "none";
    });

	</script>
	
	</div>
	
	</div>
</body>
</html>