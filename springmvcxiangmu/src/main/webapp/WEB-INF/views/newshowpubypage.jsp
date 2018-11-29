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
 <!--  ======================== 产品搜索================== -->
  <center>   <ul class="nav navbar-nav">
      <li class="active"><shiro:hasPermission name="product:insert"><a href="#" data-toggle="modal" data-target="#myModal1" onclick="deldata()">新增产品<span class="sr-only"></span></a></shiro:hasPermission></li>
      
      </ul>
      <shiro:hasPermission name="product:select"><div class="navbar-form navbar-left" role="search">
      
       <input id="apuname"  name="apuname" type="text" class="form-control" placeholder="请输入要搜索的产品"/>
      
      <select  id="pid" name="pid" class="form-control" style="color:gray" >
		<option value="0">请选择供应商</option>	
		</select>&nbsp;&nbsp;
		<select id="cate"  name="cate" class="form-control" style="color:gray">
		<option value="0">请选择目录</option>	
		</select>&nbsp;&nbsp;
		<input type="button" class="btn btn-primary" value="搜索产品" onclick="searchpu()" />
      
      </div></shiro:hasPermission> </center>
      <!-- ===================产品显示表============= --> 
<table id="mytable"></table>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">产品修改</h4>
      </div>
      <div class="modal-body">
     
      <!-- ===================    = ===============================产品修改表                  ============= -->
        <form id="myform">
<table class="table table-hover table-condensed" width="70%" >
<tr>
<td>产品id</td><td><input name="puid" id="puid" type="text"  readonly="true "/></td>
</tr>
<tr>
<td>产品名称</td><td><input type="text" name="puname" id="puname1"  onblur="checkNameajax(this,'csname')"/> <span id="csname"></span></td>
</tr>
<tr>
<td>供应商</td><td><select id="provider" name="pename">
</select></td>
</tr>
<tr>
<td>产品数量</td><td><input type="text" name="count" id="count"   onblur="checknum(this,'pu_num')" /><span id="pu_num"></span></td>
</tr>
<tr>
<td>产品进价</td><td><input type="text" name="inp"  id="inp" onblur="checknuminp(this,'pu_inprice')" /><span id="pu_inprice" ></span></td>
</tr>
<tr>
<td>产品售价</td><td><input type="text" name="outp"  id="outp"  onblur="checknumoutp(this,'pu_outprice')" /><span id="pu_outprice"></span></td>
</tr>
<tr>
<td>种类</td><td><select id="kind" name="kind" id="kind"><span id="kinds"></span>



</select></td>
</tr>
<tr>
<td>进货时间</td><td><input class="Wdate" name="intime" id="intime"  type="text" value="" onclick="WdatePicker()" onblur="checkdate(this,'pu_date')" /><span id="pu_date" ></span></td>
</tr>
<tr>
<td colspan="9" align="center"><input type="reset"  value="数据重置" onclick="resetall(1)"/></td>
</tr>

</table>
</form>
        



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="submitmodify()">确定修改</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================增加表====================== -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加产品</h4>
      </div>
      <div class="modal-body">
   <form id="puform">
<table class="table table-hover table-condensed">

<tr>
<td>产品名称</td><td><input type="text" name="pruname"  id="pruname" onblur="checkNameajax(this,'csname1')"/><span id="csname1"></span></td>
</tr>
<tr>
<td>供应商</td><td><select name="prename" id="prename">


</select></td>
</tr>
<tr>
<td>产品数量</td><td><input type="text" name="num" id="num" onblur=" checknum(this,'punum')" /><span id="punum"></span></td>
</tr>
<tr>
<td>产品进价</td><td><input type="text" name="inprice"    id="inprice"  onblur="checknuminp(this,'inprice1')"  /><span id="inprice1"></span></td>
</tr>
<tr>
<td>产品售价</td><td><input type="text" name="outprice" id="outprice"  onblur="checknumoutp(this,'outprice1')"/><span id="outprice1"></span></td>
</tr>
<tr>
<td>种类</td><td><select name="cateid"  id="cateid">
</select></td>
</tr>
<tr>
<td>进货时间</td><td><input class="Wdate" name="indate" id="indate" type="text" value="" onclick="WdatePicker()" onblur="checkdate(this,'date')" /><span id="date"></span></td>
</tr>
<tr>
<td colspan="8"><input type="button" value="数据重置" onclick="resetall(2)"/></td>
</tr>

</table>
</form>
       
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="submitadd()">确定增加</button>
      </div>
    </div>
  </div>
</div>
</body>
<!--======================= ajax使用bootStrapTable插件 ==============-->
<script type="text/javascript">

$("#mytable").bootstrapTable({
	url : 'selectAllpu',
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
         field: 'puID',
         title: '产品ID'
     }, {
         field: 'pu_name',
         title: '产品名称'
     }, {
         field: 'p.pe_name',
         title: '供应商'
     },{
         field: 'quantity',
         title: '产品数量'
     },{
         field: 'in_price',
         title: '产品进价'
     },{
         field: 'sales_price',
         title: '产品售价'
     },{
         field: 'c.cg_name',
         title: '种类'
     },{
         field: 'date',
         title: '进货时间'
     },{
         field: 'puID',
         formatter: autoadd,
         title: '操作'
         
     }]
     
 });
 //操作的写法
 function autoadd(value, row ,index){
	 return "<shiro:hasPermission name='product:delete'><a type='button' class='btn btn-info btn-sm' onclick=del('"+value+"')>删除<span class='glyphicon glyphicon-remove  aria-hidden='true'></span></a></shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;"+
	 "<shiro:hasPermission name='product:update'><a type='button' class='btn btn-info btn-sm' data-toggle='modal' data-target='#myModal' onclick=modify('"+value+"')>修改<span class='glyphicon glyphicon-wrench ' aria-hidden='true'></span></a></shiro:hasPermission>"
 }
 //shanchufangfa
 function del(id){
	 if(confirm("确定删除?")){
	 $.ajax({
	     url:"deletePu",
	     type:"post",
	     data:"id="+id+"" ,
	    success:function(msg){
	    	//alert(msg)
	 	 
	 	 if("ok"==msg){
	 		 alert("删除成功")
$("#mytable").bootstrapTable("refresh")
		 		
		 	 }else if("use"==msg){
		 		alert("该商品已经被使用， 无法删除") 
		 	 }
	 	 
	    }
	 });   
 
	 }
 }
 //检查是否修改
	 var j=null;
	var b=null;
	var c=null;
	 var d=null;
	 var e=null;
	 var f=null;
	 var g=null;
	 var h=null;
 function ismodify(){
	 
	 if(b== get("intime").value&& c==get("inp").value&& d==get("outp").value&&e==get("count").value
			 && f==get("provider").value&&g==get("kind").value&& h==get("intime").value)
		 {return true}
	 else{return false}
 }
 //修改的初始化方法

 function modify(id){
	 /*get("puname1").value="";
	 get("intime").value="";
	get("inp").value="";
	 get("outp").value="";
	 get("count").value="";*/
	 get("csname").innerHTML="";
	get("pu_inprice").innerHTML="";
	 get("pu_outprice").innerHTML="";
	 get("pu_num").innerHTML="";
	 get("pu_date").innerHTML="";
	 $.ajax({
	     url:"selectPuById",
	     type:"post",
	     data:{
	    	    "id":id
	    	 

	     },
	    success:function(a){
	    
	 	 //var a=JSON.parse(msg)
	 	 $("#puname1").val(a.pu_name)
	 	  $("#puid").val(a.puID)
	 	   $("#count").val(a.quantity)
	 	    $("#inp").val(a.in_price)
	 	     $("#outp").val(a.sales_price)
	 	      $("#intime").val(a.date)
	 	      var ops=$("#provider")[0].options
	 	      for(var i=0;i<ops.length;i++){
	 	      if(ops[i].value==a.p.peID){
	 	    	 ops[i].selected="selected" 
	 	      }
	 	      }
	    	 var cops=$("#kind")[0].options
	 	      for(var i=0;i<cops.length;i++){
	 	      if(cops[i].value==a.c.cgID){
	 	    	 cops[i].selected="selected" 
	 	      }
	 	      }
	    	 //给变量赋初值，以便判断修改
	    	  j=a.pu_name;
	    		 b= get("intime").value;
	    		 c=get("inp").value;
	    		  d=get("outp").value;
	    		  e=get("count").value;
	    		  f=get("provider").value;
	    		  g=get("kind").value;
	    		  h=get("intime").value;
	    }
	 });   
 
 
 }
 //-----------------------初始化啊------------------
 $.ajax({
     url:"allList",
     type:"post",
     
    success:function(arr){
 	// var arr=JSON.parse(msg)
 	 var pre=arr[1]  ;
 	 var cate=arr[0];
    	for(var i=0;i<pre.length;i++){
    		var option="<option value='"+pre[i].peID+"'>"+pre[i].pe_name+"</option>"
         $("#provider").append($(option))
    	}
    	for(var i=0;i<pre.length;i++){
    		var option="<option value='"+pre[i].peID+"'>"+pre[i].pe_name+"</option>"
    		
         $("#pid").append($(option))
    	}
    		for(var i=0;i<cate.length;i++){
        		var option="<option value='"+cate[i].cgID+"'>"+cate[i].cg_name+"</option>"
             $("#cate").append($(option))
        	}
    		for(var i=0;i<pre.length;i++){
        		var option="<option value='"+cate[i].cgID+"'>"+cate[i].cg_name+"</option>"
        		
             $("#kind").append($(option))
        	}
    		for(var i=0;i<pre.length;i++){
        		var option="<option value='"+cate[i].cgID+"'>"+cate[i].cg_name+"</option>"
        		
             $("#cateid").append($(option))
        	}
    		for(var i=0;i<pre.length;i++){
        		var option="<option value='"+pre[i].peID+"'>"+pre[i].pe_name+"</option>"
             $("#prename").append($(option))
        	}
    }
 });
 //-----------------------------增加时删除数据
 function deldata(){
	 get("pruname").value="";
	 get("num").value="";
	 get("inprice").value="";
	 get("outprice").value="";
	 get("indate").value="";
	
		get("csname1").innerHTML="";
		 get("punum").innerHTML="";
		 get("inprice1").innerHTML="";
		 get("date").innerHTML="";
		 get("outprice1").innerHTML="";
 } 
 //判断空行的方法------
 function isnull(){
	 if( get("pruname").value==""||
	 get("num").value==""||
	 get("inprice").value==""||
	 get("outprice").value==""||
	 get("indate").value=="")
		 {return true}
	 else{return false}
 }
 //----------------------------确定提交修改
 function submitmodify(){
	var f=ismodify();
	if(j==get("puname1").value){
	if(f){
		alert("未作修改无法提交")
		
	}else{
		pn=true 
		checkdate(get("intime"),"pu_date");
	 checknuminp(get("inp"),"pu_inprice");
	 checknumoutp(get("outp"),"pu_outprice");
	 checknum(get("count"),"pu_num");
	 update()
	
	}
	}
	else{
		checkNameajax(get("puname1"),"csname");
		 checkdate(get("intime"),"pu_date");
		 checknuminp(get("inp"),"pu_inprice");
		 checknumoutp(get("outp"),"pu_outprice");
		 checknum(get("count"),"pu_num");
		 update()
		 }
 }
 
	function update(){
	 if(pn&&p1&&p2&&p3&&p4){
	 $.ajax({
	     url:"updatePu",
	     type:"post",
	     data:$("#myform").serialize(),
	    success:function(msg){
	    	
	 	 
	 	 if("ok"==msg){
	 		 alert("修改成功")
	 		$("#myModal").modal("hide")
	 	
	 		$("#mytable").bootstrapTable("refresh")
	 		
	 	 }else{
	 		 alert("修改失败!")
	 	 }
	 	
	    }
	 });
	 }else{alert("修改失败，请按要求填写数据")}
	 
 } 
 //-------------确定增加--------------
 function submitadd(){
	 if(isnull()){
		alert("存在空行，无法提交")
	 }
	 /*if(!pn&&!p1&&!p2&&!p3&&!p4){
		 checkName(get("puname1"),"csname");
		 checkdate(get("intime"),"pu_date");
		 checknuminp(get("inp"),"pu_inprice");
		 checknumoutp(get("outp"),"pu_outprice");
		 checknum(get("count"),"pu_num");
	 }*/ else{checkNameajax(get("pruname"),"csname1");
	 checkdate(get("indate"),"date");
	 checknuminp(get("inprice"),"inprice1");
	 checknumoutp(get("outprice"),"outprice1");
	 checknum(get("num"),"punum");
	 if(pn&&p1&&p2&&p3&&p4){
	 $.ajax({
	     url:"insertPu",
	     type:"post",
	     data:$("#puform").serialize(),
	    success:function(msg){
	    	alert(msg)
	 	 
	 	 if(msg=="ok"){
	 		 
	 		$("#myModal1").modal("hide")
	 	
	 		$("#mytable").bootstrapTable("refresh")
	 		
	 	 }else{
	 		 alert("警告!","添加失败!")
	 	 }
	 	
	    }
	 });
	 }else{
		 alert("无法提交，未按要求填写数据")
	 }
	 
 }}
 
 //post方法获得参数
 function queryParams(params) {  //bootstrapTable自带参数  
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
		    		
		    		"puname":$("#apuname").val(),
		    		"pid":$("#pid").val(),
		    		"cid":$("#cate").val(),
		    		"cpage" : this.pageNumber,
		    		"limit" : this.pageSize
		    };  
		    return temp;  
		 }
 //模糊查询----------------
 function searchpu(){
	/*$.ajax({
	     url:"puservice",
	     type:"post",
	     data:{
	    	 "op":"getpubycondition", 
       	  "currentpage":1,
       	  "pagesize":4,
       	  "puname":$("#apuname").val(),
       	  "pid":$("#pid").val(),
       	  "cid":$("#cate").val()
	    	 
	    	 
	    	 
	     },
	    success:function(msg){
	    	alert(msg);
	    	}
	 
	 });*/
	 $("#mytable").bootstrapTable('destroy')
	$("#mytable").bootstrapTable({
			url : "selectPuByCondition" ,
			method : 'post',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',		
		     striped: true,                      //是否显示行间隔色
		     cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     pagination: true,                   //是否显示分页（*）
		     sortable: false,                     //是否启用排序
		     sortOrder: "asc",                   //排序方式
		    queryParams:queryParams,//传递参数（*）
		     sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
		     pageNumber:1,                       //初始化加载第一页，默认第一页
		     pageSize: 5,                       //每页的记录行数（*）
		     pageList: [5,10, 25, 50, 100],        //可供选择的每页的行数（*）
		     
		     showColumns: true,                  //是否显示所有的列
		     showRefresh: true,                  //是否显示刷新按钮
		     minimumCountColumns: 2,             //最少允许的列数
		     clickToSelect: true,                //是否启用点击选中行
		   
		     columns: [ {
		         field: 'puID',
		         title: '产品ID'
		     }, {
		         field: 'pu_name',
		         title: '产品名称'
		     }, {
		         field: 'p.pe_name',
		         title: '供应商'
		     },{
		         field: 'quantity',
		         title: '产品数量'
		     },{
		         field: 'in_price',
		         title: '产品进价'
		     },{
		         field: 'sales_price',
		         title: '产品售价'
		     },{
		         field: 'c.cg_name',
		         title: '种类'
		     },{
		         field: 'date',
		         title: '进货时间'
		     },{
		         field: 'puID',
		         formatter: autoadd,
		         title: '操作'
		         
		     }]
		 });
	 
 }
 //-----------------------------------------------------------------ajax判断重名
 var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
function checkNameajax(obj,i){
	var puname=obj.value
	var p=get(i);
	 
	xmlhttp.open("GET","selectProductByName?puname="+puname,true);
	 xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    var f=xmlhttp.responseText;
	    if(f=="true"){
	    	
	    		checkName(obj,i)
	    	
	   }else{p.innerHTML="<font color='red'> 重名,请重新输入</font>"
		 pn=false
	   }
	    
	  }
	
	
}
	 xmlhttp.send();
}
 //-----------------------------------------------------------------正则表达式
 function get(id){
	 return document.getElementById(id);
}
function checkall(str,i){
	var a=[
	/^[\u4e00-\u9fa5_a-zA-Z]+$/,
	/^[0-9]{1,20}(\.[0-9]{1,2})?$/,
	/^[0-9]{1,20}$/,
	/^\d{4}-\d{1,2}-\d{1,2}(\s\d{2}:\d{2}:\d{2})?$/
	
	]
	return a[i].test(str)
}
var pn=false;
var p1=false;
var p2=false;
var p3=false;
var p4=false;


function checkName(obj,i){
	
	var p=get(i);
	
	 pn=checkall(obj.value,0)
	if(pn){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 名字必须是汉字或英文</font>"	
	}
	
	
}
function checknumoutp(obj,k){
	var p=get(k);
	
	 p1=checkall(obj.value,1)
	if(p1){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 数据必须是整数或者小数</font>"	
	}
	
	
}
function checknuminp(obj,k){
	var p=get(k);
	
	 p4=checkall(obj.value,1)
	if(p4){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 数据必须是整数或者小数</font>"	
	}
	
	
}
function checknum(obj,k){
	var p=get(k);
	
	 p2=checkall(obj.value,2)
	if(p2){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 数据必须是整数</font>"	
	}
	
	
}
function checkdate(obj,k){
	var p=get(k);
	
	 p3=checkall(obj.value,3)
	if(p3){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 请在日历中选择或填写正确格式</font>"	
	}
	
	
}

	




function resetall(op){
	if(op==1){
	get("puid").defaultValue=get("puid").value
	get("myform").reset();
	 get("puname1").value="";
	 get("intime").value="";
	get("inp").value="";
	 get("outp").value="";
	 get("count").value="";
	 get("csname").innerHTML="";
	get("pu_inprice").innerHTML="";
	 get("pu_outprice").innerHTML="";
	 get("pu_num").innerHTML="";
	 get("pu_date").innerHTML="";
	
	
	}else if(op==2){
		get("puform").reset();
		
		
			get("csname1").innerHTML="";
			 get("punum").innerHTML="";
			 get("inprice1").innerHTML="";
			 get("date").innerHTML="";
			 get("outpricehk").innerHTML="";
		
		
	}
	
}

 
</script>
</html>