<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, java.util.Map, cqut.dao.ContentManageDao"%>
    <% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--  <link rel="stylesheet" type="text/css" href="../css/buttons.css"/>
    <link rel="stylesheet" type="text/css" href="../css/column.css"/> -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
    <link rel="stylesheet" href="<%=path%>/css/buttons.css">  
        <link rel="stylesheet" href="<%=path%>/css/column.css"> 
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <title>栏目管理</title>
</head>
<body>
<%List<Map<String, Object>> list1 =ContentManageDao.getContentManageDao().selectInforFromColumn(); 
                        session.setAttribute("list",list1);%>
                        <script type="text/javascript">
                        var list = <%=list1.toString()%>;
                        </script>
    <div class="wholeContent">

    <h>栏目管理</h><br><br>
    
<!-- <div class="function">
    <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=10>
    <button type="button" class="button button-primary button-small" data-toggle="modal" data-target="#myModal">增加</button>
                       
                         <button type="submit"  class="button button-caution button-small" >删除</button><br/>
                    </div> -->
                      
      <form action="<%=path%>/DeleteColumnServlet">               
    <table  class="table">
            <colgroup>   
                 <col style="width:25%;" />
                <col style="width:25%" />
                <col style="width:25%;" />
                <col style="width:25%;" /></colgroup>
        <thead>
          <tr> <button type="button" class="button button-primary button-small" data-toggle="modal" data-target="#myModal">增加</button>
            </tr>
            <tr class="active">
              
                <th data-field="age" data-width="120px">choose</th>
                <th data-field="bianji" data-width="120px">chooseID</th>
                <th data-field="bianji" data-width="120px">ColumnID</th>
                <th data-field="bianji" data-width="120px">栏目名称</th>
              <!--   <th data-field="bianji" data-width="120px">编辑</th> -->
            </tr>
           
        </thead>
        <tbody id="listTable">
       
        <%for(int i = 0;i<list1.size();i++) { %>
                <tr >
                        <td>
                            <input type="checkbox" selected="selected" name=<%=i+1 %> value=<%=list1.get(i).get("ColumnID").toString().substring(0, list1.get(i).get("ColumnID").toString().length())%>/>
                        </td>
                        
                        <td>
                              <%=i+1%>
                            </td>
                            <td>
                                    <%=list1.get(i).get("ColumnID")%>
                                </td>
                            <td>
                                    <%=list1.get(i).get("ColumnName")%>
                                </td>
                        <!-- <td colspan="6">
                            <button type="button" class="button button-primary button-small" data-toggle="modal" data-target="#myModal">增加</button>
                                <a href="javascript:;" class="button button-caution button-small" role="button" onclick="delAll(this)">删除</a>
                               
                        </td> -->
                    </tr>
                    <%} %>
                  <tr>  <button type="submit"  class="button button-caution button-small" >多选删除</button> </tr>
        </tbody>
        
    </div>
    </table>
    </form> 

   

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                       请输入您想增加的栏目
                    </h4>
                </div>
                <div class="modal-body">
                  <form action="<%=path%>/InsertColumn">
                       
                            
                            <tr>
                                <th>栏目ID</th>
                                <td><input type="text" name="ColumnId" class="form-control"  /></td>
                            </tr>
                            <tr>
                                <th>栏目名字</th>
                                <td><input type="text" name="ColumnName" class="form-control"  /></td>
                            </tr>
                            <tr>
                             <th></th>
                                <td colspan="2">
                                   
                                    <input type="submit" value="添加"  class="btn btn-success" />
                                   
                                </td>
                            </tr>
                       
                    </form>
                </div>
                <div class="modal-footer">
                 
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <script>
       $(function () { $('#myModal').modal('hide')});
    </script>
     <script>
       $(function () { $('#myModal').on('hide.bs.modal', function () {
       /*    alert('离开了...');}) */
      });
    </script> 
   
               
</body>

</html>