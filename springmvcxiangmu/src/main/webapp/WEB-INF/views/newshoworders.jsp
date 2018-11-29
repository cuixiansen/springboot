<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="<%= request.getContextPath()%>/javascript/My97DatePicker/WdatePicker.js">
</script>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">

   
      <script src="/springmvcxiangmu/javascript/jQuery-1.12.4.js"></script>
      <script src="/springmvcxiangmu/js/bootstrap.min.js"></script>
      <!-- ===============  bootstrap-table插件使用   =========================== -->
<script src="/springmvcxiangmu/javascript/table/bootstrap-table.js"></script>
<link href="/springmvcxiangmu/javascript/table/bootstrap-table.css" rel="stylesheet" />
<script src="/springmvcxiangmu/javascript/table/locale/bootstrap-table-zh-CN.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--  ======================== dingdan搜索================== -->
      <ul class="nav navbar-nav">
      <shiro:hasPermission name="order:insert"><li class="active"><a href="#" data-toggle="modal" data-target="#myModal1" onclick="showaddorder()">新增订单<span class="sr-only"></span></a></li></shiro:hasPermission>
      
      </ul>
     <shiro:hasPermission name="order:select"> <div class="navbar-form navbar-left" role="search">
      
      <input id="aordearname"  name="aordername" type="text" class="form-control" placeholder="请输入要搜索的订单表号"/>
      
    &nbsp;&nbsp;
		<select id="customer"  name="customer" class="form-control" style="color:gray">
		<option value="0">请选择顾客</option>	
		</select>&nbsp;&nbsp; <select id="emp"  name="emp" class="form-control" style="color:gray">
		<option value="0">请选择员工</option>	
		</select>
		<input type="button" class="btn btn-primary" value="搜索订单" onclick="searchorder()" />
      
      </div> </shiro:hasPermission>
      <!-- ======================初始表======================= -->
<table id="myordertable"  ></table>
<!--  ==============------------------------------------------------------订单详情只是显示 -->
<!-- Modal -->
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">订单详情</h4>
      </div>
      <div class="modal-body">
        <table class="table table-hover table-condensed"  id="orderdetailtb"></table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        
      </div>
    </div>
  </div>
</div>
<!-- -----------------------------------------------订单修改前一个框 -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">订单修改</h4>
      </div>
      <div class="modal-body">
        <a   calss='btn type='button' class='btn btn-info btn-sm' data-toggle='modal' data-target='#myModal3' onclick="ModifyOrderdetail()"">修改订单详情</a>
<form action="orderservlet?op=sureupdateorder" method="post" id="orderform">
<table class="table table-hover table-condensed">
<tr>
<td>订单编号</td><td ><input type="text" name="orderid" id="order_id"  value="${order.orderID }" readonly="true"/></td>
</tr>
<tr>
<td>顾客</td><td><input type="text" name="${order.cus.customerID }" id="cus_id" value="${order.cus.customerID }" readonly/><span id="penam"></span></td>
</tr>
<tr>
<td>员工</td><td><select name="esc" id="emp_id">
</select></td>
<!--<input type="text" name="" value="${order.emp.empID}" onblur="checkaddre(this,'peaddre')"/><span id="peaddre"></span>-->
</tr>
<tr>
<td>订单日期</td><td><input type="text" name="orderdate" id="o_date" value="${order.order_date}" onclick="WdatePicker()"  )"/><span id="pephone"></span></td>


<tr>
<td colspan="2"><input type="reset" value="数据重置"/></td>
</tr>

</table>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary"  onclick="submitupdateorder()">确定修改</button>
      </div>
    </div>
  </div>
</div>
<!-- =============------------订单详情修改===========----------------------- -->
<!-- Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">详情修改</h4>
      </div>
      <div class="modal-body">
         <form id="orderdetailform"  >
		
		
		
		 <input type="text" name="o_orderid" hidden="hidden" />
			<table  class="table table-hover table-condensed" id="order_table" width="90%">
				<tr><td >订单编号</td><td> 产品名称</td><td width="45%,*" > 数量</td><td style="text-align: center;"> 是否折扣</td><td> 操作</td></tr>
				<tr id="searchord"  hidden="hidden" ><td name="o_pusce"  readonly></td><td><select name='opusce'>
					<option value="0">选择产品</option>
				</select></td>
				 <td> <input type="text" name="number" onblur="checknum(this)"/><span class="a"></span></td>
				<td> <input type="checkbox" name="select" class="input" value="1" checked />是&nbsp;&nbsp;
					<input type="checkbox" name="select" class="input" value="0" /> 否</td>
				<td> <a href="#" value="sd">删除</a></td>
				</tr >				
			</table>
			</form>
			<table><tr ><td colspan="5"  align="right"><a  href="#">增加详情</a>&nbsp;&nbsp;
			</td></tr></table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确定</button>
      </div>
    </div>
  </div>
</div>
<!--===================增加订单模态框================== -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">订单追加</h4>
      </div>
      <div class="modal-body">
     <form id="o_form" action="orderservlet">
<input type="text" name="op" value="addorder" hidden/>
订单编号：<input type="text" name="ordernum" readonly />&nbsp;&nbsp;下单日期：<input type="text" onclick="WdatePicker()" name="odate" id="aodate" /> 
		<br>
		客户：<select id="cussc"  name="cussc">
			
		</select>&nbsp;&nbsp;&nbsp;&nbsp;
		员工：<select id="empsc" name="empsc">
			
		</select>

		<div style="margin-top:15px  ;">
		
			<table class="table table-hover table-condensed" id="mytb" width="90%">
				<tr><td> 产品名称</td><td width="45%,*" > 数量</td><td style="text-align: center;"> 是否折扣</td><td> 操作</td></tr>
				<tr  id="searchorder" hidden="hidden"><td><select name="pusce" id="pusc">
					<option value="0">选择产品</option>
				</select></td>
				<td> <input type="text" name="ordernumber" onblur='checknum(this)' /><span class='b'></span></td>
				<td> <input type="checkbox" name="select" class="input" value="1" checked/>是&nbsp;&nbsp;
					<input type="checkbox" name="select" class="input" value="0" /> 否</td>
				<td> <a href="#" value="sd">删除</a></td>
				</tr >
				<tr  ><td ><select name="pusce" id="pusc">
					<option   value="0">选择产品</option>
				</select></td>
				<td> <input type="text" name="ordernumber" onblur='checknum(this)'/><span class='b'></span></td>
				<td> <input type="checkbox" name="select" class="input" value="1" checked/>是&nbsp;&nbsp;
					<input type="checkbox"  name="select" class="input" value="0" /> 否</td>
				<td> <a href="#" value="sd">删除</a></td>
				</tr>
				
				<tr id="method"><td colspan="4"  style="text-align: right;"><a href="#" >增加数据</a>&nbsp;&nbsp;</td></tr>
			</table>
		</form>
		
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addorder()">确定增加</button>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
//初始表-----------------------------------
$("#myordertable").bootstrapTable({
	url : 'selectAllOrderByPage',
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
         field: 'orderID',
         title: '订单编号'
     }, {
         field: 'cus.customer_name',
         title: '顾客'
     }, {
         field: 'emp.emp_name',
         title: '员工'
     },{
         field: 'order_date',
         title: '订单日期'
     },{
    	 field: 'orderID',
         formatter: autoadd,
         title: '操作'
     }]
     
 });
//操作方法
function autoadd(value, row ,index){
	 return "<shiro:hasPermission name='order:delete'><a type='button' class='btn btn-info btn-sm' onclick=del('"+value+"')>删除<span class='glyphicon glyphicon-remove  aria-hidden='true'></span></a></shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;"+
	 "<shiro:hasPermission name='order:update'><a type='button' class='btn btn-info btn-sm' data-toggle='modal' data-target='#myModal' onclick=modify('"+value+"')>修改<span class='glyphicon glyphicon-wrench ' aria-hidden='true'></span></a></shiro:hasPermission>"
	 +
	 "&nbsp;&nbsp;&nbsp;&nbsp;<a type='button' class='btn btn-warning btn-sm' data-toggle='modal' data-target='#myModal5' onclick=showorderdetail('"+value+"')>订单详情</a>"

}
//shanchufangfa
function del(id){
	 if(confirm("确定删除?")){
	 $.ajax({
	     url:"deleteOrder",
	     type:"post",
	     data:{
	    	    "orderid":id
	    	 
	    	 
	     },
	    success:function(msg){
	    	
	 	// alert(msg)
	 	 if("ok"==msg){
	 		 alert("删除成功")
$("#myordertable").bootstrapTable("refresh")
		 		
		 		
		 	 }else{alert("删除失败")}
	 	 
	    }
	 });   
	 }

}
//修改的chushihua方法

function modify(id){
	
	 $.ajax({
	     url:"updateOrder",
	     type:"post",
	     data:{
	    	    "orderid":id
	    	 
	    	 
	     },
	    success:function(a){
	    	
	 	// var a=JSON.parse(msg)
	 	 $("#order_id").val(a.orderID)
	 	  
	 	   $("#cus_id").val(a.cus.customer_name)
	 	    $("#o_date").val(a.order_date)
	 	  
	 	      var ops=$("#emp_id")[0].options
	 	      for(var i=0;i<ops.length;i++){
	 	      if(ops[i].value==a.emp.empID){
	 	    	 ops[i].selected="selected" 
	 	      }
	 	      }
	    	
	    }
	 });   


}
//-----------------------初始化啊------------------
$.ajax({
       url:"chushihua",
       type:"post",
       
       	  
      success:function(arr){
   	   //alert(msg);
   	 // var arr=JSON.parse(msg)
     	 
        	for(var i=0;i<arr[1].length;i++){
		var option="<option value='"+arr[1][i].empID+"'>"+arr[1][i].emp_name+"</option>"
     $("#emp").append($(option))
	}for(var i=0;i<arr[1].length;i++){
   	  var option="<option value='"+arr[1][i].empID+"'>"+arr[1][i].emp_name+"</option>"
     $("#emp_id").append($(option))
	}for(var i=0;i<arr[2].length;i++){
		var option="<option value='"+arr[2][i].customerID+"'>"+arr[2][i].customer_name+"</option>"
	     $("#customer").append($(option))
		}
   	   
      }
})
//只看不改详情初始化方法
 //订单详情初始化
 var orderid;
 function showorderdetail(id){
	 orderid=id;
	/*alert(id);
 		$.ajax({
 		       url:"orderservlet",
 		       type:"post",
 		       data:{"op":"getOrderdetailById",
 		    	   "orderid" :id
 		       },
 		       	  
 	      success:function(msg){
 		    	  alert(msg) }})*/
 		    	  $("#orderdetailtb").bootstrapTable('destroy')
 	$("#orderdetailtb").bootstrapTable({
 			url : 'selectOrderdetailById',
 			method : 'post',
 			contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
 		     striped: true,                      //是否显示行间隔色
 		     cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
 		     pagination: true,                   //是否显示分页（*）
 		     sortable: false,                     //是否启用排序
 		     sortOrder: "asc",                   //排序方式
 		    queryParams: updateParams,//传递参数（*）
 		     sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
 		    pageNumber:1,                       //初始化加载第一页，默认第一页
 		     pageSize: 5,                       //每页的记录行数（*）
 		     pageList: [5,10, 25, 50, 100],        //可供选择的每页的行数（*）
 		     
 		     //showColumns: true,                  //是否显示所有的列
 		     //showRefresh: true,                  //是否显示刷新按钮
 		     minimumCountColumns: 2,             //最少允许的列数
 		     clickToSelect: true,                //是否启用点击选中行
 		   
 		     columns: [ {
 		         field: 'order.orderID',
 		         title: '订单编号'
 		     }, {
 		         field: 'pu.pu_name',
 		         title: '产品名称'
 		     }, {
 		         field: 'quantity',
 		         title: '数量'
 		     },{
 		         field: 'discount',
 		         title: '是否折扣'
 		     }]
 		     
 		 });
	
} 
//post方法获得参数 订单详情显示专用
function updateParams(params) {  //bootstrapTable自带参数  
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
		    		
		    		"orderid":orderid,
		    		"cpage" : this.pageNumber,
		    		"limit" : this.pageSize
		    };  
		    return temp;  
		 }
//post方法获得参数 模糊查询专用 这里没用到
function queryParams(params) {  //bootstrapTable自带参数  
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
		    		"pename":$("#apename").val(),
		    		"pid":$("#pe").val(),
		    		
		    		"cpage" : this.pageNumber,
		    		"limit" : this.pageSize
		    };  
		    return temp;  
		 }

//模糊查询订单详------===========-----
function  searchorder(){
	$("#myordertable").bootstrapTable('destroy')
	$("#myordertable").bootstrapTable({
		url : "selectOrderByConditionByPage?orderid="+$("#aordearname").val()+"&cusid="+$("#customer").val()+"&empid="+$("#emp").val()+"",
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
	         field: 'orderID',
	         title: '订单编号'
	     }, {
	         field: 'cus.customer_name',
	         title: '顾客'
	     }, {
	         field: 'emp.emp_name',
	         title: '员工'
	     },{
	         field: 'order_date',
	         title: '订单日期'
	     },{
	    	 field: 'orderID',
	         formatter: autoadd,
	         title: '操作'
	     }]
	     
	 });
	
	
}
//点击增加时的初始化----------------------------
function showaddorder(){
	$("[name='ordernumber']").val("");
	$("[name='odate']").val("");
	$("select[name='pusce']").val(0);
	$("#aodate").val("");
	$(".b").html("")
	 $.ajax({
	       url:"getthreeinfo",
	       type:"post",
	       
	       	  
	      success:function(arr){
	   	   //alert (msg);
	   	//var arr=JSON.parse(msg)
	   	// alert($("[name='pusce']").length)
	   	var num=arr[3];
	     	 $("[name=ordernum]").val(num);
	        	for(var i=0;i<arr[0].length;i++){
	        		var option="<option value='"+arr[0][i].puID+"'>"+arr[0][i].pu_name+"</option>"
	             $("select[name='pusce']").append($(option))
	        	}
	 	for(var i=0;i<arr[1].length;i++){
			var option="<option value='"+arr[1][i].empID+"'>"+arr[1][i].emp_name+"</option>"
	     $("#empsc").append($(option))
		}for(var i=0;i<arr[2].length;i++){
			var option="<option value='"+arr[2][i].customerID+"'>"+arr[2][i].customer_name+"</option>"
		     $("#cussc").append($(option))
			}
	      }
	})
}
//订单详情里的方法------------------
	$(function(){
		$(document).click(function(e){
			var op=e.target.innerHTML
			var a=e.target.value
			if("删除"==op){
				if($("tr").length>2){
				$(e.target).parent().parent().remove();}
				/*else if($("tr").length=2){
				$(e.target).parent().parent().children(":eq(1)").children(":eq(0)").val("")}*/
				
			}else if("增加数据"==op){
				var b=$("#searchorder").clone()  				
				 
							
				$("#method").before(b.show());  
			
				
			}
			else if("增加详情"==op){
				var b=$("#searchord").clone()  				
				$("#order_table").append(b.show());  
				
			}else if("1"==a){
				$(e.target).parent().children(":last-child").removeAttr("checked")
				
			}else if("0"==a){
				$(e.target).parent().children(":first").removeAttr("checked")
			
			}else if("确定"==op){
				//alert($("select[name='pusce']").length)
		        //var font=$("[name='abc']");
				//根据名字
				//用到break；遍历，只要有红字就不行；
				//if(font.html()==)
		        var aa='<font name="abc" color="red"> 数量必须是正整数</font>'
				var span=$(".a");
				var s=$("[name='number']");
					//alert (s.length);
					
		        //var font=$("[name='abc']");
				//根据名字
				//用到break；遍历，只要有红字就不行；
				for(var i=1;i<span.length;i++){
					checknum(s[i])
				
					if(span[i].innerHTML=='<font name="abc" color="red"> 数量必须是正整数</font>')	{
						pn=false;
						
						break;
					}	else{pn= true}
						
				}
		
			
			
			if(pn){
	
			
				var arr=$("select[name='opusce']");
				//alert(arr.length);
				var f=false;
				
				if(arr.length>=2){
				for(var i=0;i<arr.length;i++){
					for (var j=i+1;j<arr.length;j++){
						if(arr[i].value==arr[j].value){
							f=true;
							break;
						}
					}
				}
				
				if(f){
					alert("数据重复，请重新填写")
				} //-------------------------------------=====ajax提交order  
				else{
				 $.ajax({
				     url:"sureupdateOrderDetail",
				     type:"post",
				     data:$("#orderdetailform").serialize(),
				    success:function(msg){
				    
					 
				 	 if("ok"==msg){
				 		
				 		$("#myModal3").modal("hide")
				 	
				 		//$("#myordertable").bootstrapTable("refresh")
				 		
				 	 }else{
				 		 alert("修改失败!")
				 	 }
				    }
				 });   

					
					
				
				} }else if(arr.length<2){alert("没有数据，无法提交"); }   
			
			}else{alert("请正确填写数据")}
				
			}
			//alert($("#mytb").rows.length)
			/*else if("提交订单"==a){
				//alert($("select[name='pusce']").length)
				var arr=$("select[name='pusce']");
				var f=false;
				for(var i=0;i<arr.length;i++){
					for (var j=i+1;j<arr.length;j++){
						if(arr[i].value==arr[j].value){
							f=true;
							break;
						}
					}
				} if(f){
					alert("数据重复，请重新填写")
				}else{
					$("#orderdetailform")[0].submit()
				}       
			}*/
			
		})
		
	})
	
	//检查订单时的校验
	function checkpudate(){
	var arr=$("[name='pusce']")
	var date=document.getElementById("aodate").value
	for(var i=1;i<arr.length;i++){
		if(arr[i].value==0&&date==""){
			return  true
		}else{return false}
	}
}
	//确定增加时的方法
function addorder(){
	//if(checkpudate()){alert("请填选日期和产品")}
	//else{
		  var aa='<font name="abc" color="red"> 数量必须是正整数</font>'
				var span=$(".b");
				var s=$("[name='ordernumber']");
					//alert (s.length);
					//alert (span.length+"   qwqwqwqwqwqwqw");
		        //var font=$("[name='abc']");
				//根据名字
				//用到break；遍历，只要有红字就不行；
				for(var i=1;i<span.length;i++){
					checknum(s[i])
				
					if(span[i].innerHTML=='<font name="abc" color="red"> 数量必须是正整数</font>')	{
						pn=false;
						
						break;
					}	else{pn= true}
						
				}
		
	if(pn){	
		var arr=$("select[name='pusce']");
		//alert("pusce:"+arr.length);
		var f=false;
		
		if(arr.length>=2){
			if(checkpudate()){alert("请填选日期和产品")}
			else{
		for(var i=0;i<arr.length;i++){
			for (var j=i+1;j<arr.length;j++){
				if(arr[i].value==arr[j].value){
					f=true;
					break;
				}
			}
		} 
		if(f){alert("重名，无法提交")}
		else{
	 $.ajax({
	       url:"insertOrder",
	       type:"post",
	       data:$("#o_form").serialize(),
	       	  
	      success:function(msg){
	   	   
	   	 if("ok"==msg){
		 		 alert("添加成功")
		 		$("#myModal1").modal("hide")
		 	
		 		$("#myordertable").bootstrapTable("refresh")
		 		
		 	 }else{
		 		 alert("添加失败!")
		 	 }
	      } 
	})
		
}}} else if(arr.length<2) {alert("没有订单详情，请重新输入")}
		} else{alert("没有数据或未按要求填写数据")}
	}
	//确定修改===========

	function submitupdateorder(){
		 $.ajax({
		     url:"sureupdate",
		     type:"post",
		     data:$("#orderform").serialize(),
		    success:function(msg){
		    	
		 	 
		 	 if("ok"==msg){
		 		 alert("修改成功")
		 		$("#myModal").modal("hide")
		 	
		 		$("#myordertable").bootstrapTable("refresh")
		 		
		 	 }else{
		 		 alert("修改失败!")
		 	 }
		 	
		    }
		 });
		 
		 
	}
	//修改详情的初始化-===================================详情==
	var t=document.getElementById("order_table")
	function ModifyOrderdetail(){
		  $.ajax({
		       url:"updateOrderDetail",
		       type:"post",
		       data:{
		    	   "orderid" :$("#order_id").val()
		       },
		       	  
		      success:function(arr){
		    	 //alert(arr)
            //var arr=JSON.parse(msg)
		   	var num=arr[1];
		   	var od=arr[2]
		   	$("[name='o_pusce']").html(num);
		   	$("[name='o_orderid']").val(num);
		    
		   	var trlength=$("#order_table").find("tr").length;
		   	for(var i=trlength;i>=2;i--){
		   		
		   		$("#order_table").find("tr").eq(i).remove()
		   	}
		        for(var n=0;n<od.length;n++){
		        	var option;
		                     var name=od[n].pu.pu_name;
		                    
		     		    	 var r=t.insertRow();
		     				r.insertCell().innerHTML=od[n].order.orderID;
		     				
		     				r.insertCell().innerHTML="<select name='opusce'><option   value='"+od[n].pu.puID+"' style='color: red;'>"+name+"</option></select>"     				
		     				
		     				r.insertCell().innerHTML="<input type='text' name='number'  onblur='checknum(this)'  value='"+od[n].quantity+"'/><span class='a'></span>"
		     				if(od[n].discount==1){
		     				r.insertCell().innerHTML="<input type='checkbox' name='select' class='input' value='1' checked/>是&nbsp;&nbsp; "+
						"	<input type='checkbox' name='select' class='input' value='0'/> 否</td>";}
		     				else{r.insertCell().innerHTML="<input type='checkbox' name='select' class='input' value='1' s/>是&nbsp;&nbsp; "+
		     					"	<input type='checkbox' name='select' class='input' value='0' selected='selected' checked /> 否</td>";}
		     				
		     				r.insertCell().innerHTML="<a>删除<a/>"
		      }
		        		//service层写个方法判断 多的增加 少的删除
		        		for(var i=0;i<arr[0].length;i++){
		        			
		       			 option="<option   value='"+arr[0][i].puID+"'>"+arr[0][i].pu_name+"</option>"
						//console.log(od[n].pu.pu_name==arr[0][i].pu_name)
						//if(od[n].pu.pu_name==arr[0][i].pu_name){
							//$("[name="+arr[0][i].pu_name+"]").attr("selected",true);}
							
		       		 //option="<option  value='"+arr[0][i].puID+"' selected='selected'>"+arr[0][i].pu_name+"  </option>"
		       			 $("select[name='opusce']").append($(option))
		       			
		       			
		       }
		        		//console.log($("option").val())	;	
		        }
		   
		      
		})
		
	}

 //------------------------------------------正则
 var pn=false;

function checkall(str){
	var a=/^[0-9]{1,20}$/
	
	
	return a.test(str)
}
 function checknum(obj){
		
		//var p=document.getElementById(i);
		
		var pn=checkall(obj.value)
			if(pn){
				obj.nextSibling.innerHTML="<font color='green'> 符合规则</font>";
				
			}else{
				obj.nextSibling.innerHTML="<font name='abc' color='red'> 数量必须是正整数</font>"	
			}
		
		
		
	}
 
</script>
</html>