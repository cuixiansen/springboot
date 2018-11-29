<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
	<link href="css/bootstrap.min.css" rel="stylesheet">

   
      <script src="javascript/jQuery-1.12.4.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- ===============  bootstrap-table插件使用   =========================== -->
<script src="javascript/table/bootstrap-table.js"></script>
<link href="javascript/table/bootstrap-table.css" rel="stylesheet" />
<script src="javascript/table/locale/bootstrap-table-zh-CN.js"></script>


<body>
<table id="catetable"></table>
</body>
<script type="text/javascript">
$("#catetable").bootstrapTable({
	url : 'cateServlet?op=showCateByPage',
	method : 'get',
		
     striped: true,                      //是否显示行间隔色
     cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
     pagination: true,                   //是否显示分页（*）
     sortable: false,                     //是否启用排序
     sortOrder: "asc",                   //排序方式
    // queryParams: oTableInit.queryParams,//传递参数（*）
     sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
     pageNumber:1,                       //初始化加载第一页，默认第一页
     pageSize: 5,                       //每页的记录行数（*）
     pageList: [5,10, 25, 50, 100],        //可供选择的每页的行数（*）
     
     showColumns: true,                  //是否显示所有的列
     showRefresh: true,                  //是否显示刷新按钮
     minimumCountColumns: 2,             //最少允许的列数
     clickToSelect: true,                //是否启用点击选中行
   
     columns: [ {
         field: 'cgID',
         title: '目录ID'
     }, {
         field: 'cg_name',
         title: '目录名称'
     }, {
         field: 'cg_desc',
         title: '说明'
     },{
    	 field: 'cgID',
    	 formatter: autoadd,
         title: '操作'
     }]
     
 });
 
/*$.ajax({ 
     url:"cateServlet",
     type:"post",
     data:{
    	 "op":"showCateByPage" ,
    	 "offset":0,
    	 "limit":5
  	  
  	
    	 
    	 
    	 
     },
    success:function(msg){
    	alert(msg);
    	}
 
 });
*/
//操作方法
function autoadd(value, row ,index){
	 return "<a calss='btn' onclick=del('"+value+"')>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
	 "<a calss='btn' data-toggle='modal' data-target='#myModal' onclick=modify('"+value+"')>修改</a>"
}
</script>

</html>