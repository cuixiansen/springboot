<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">

   
      <script src="javascript/jQuery-1.12.4.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- ===============  bootstrap-table插件使用   =========================== -->
<script src="javascript/table/bootstrap-table.js"></script>
<link href="javascript/table/bootstrap-table.css" rel="stylesheet" />
<script src="javascript/table/locale/bootstrap-table-zh-CN.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--  ======================== 供应商搜索================== -->
      <ul class="nav navbar-nav">
      <li class="active"><a href="#" data-toggle="modal" data-target="#myModal1" onclick="deldata()">新增供应商<span class="sr-only"></span></a></li>
      
      </ul>
      <div class="navbar-form navbar-left" role="search">
      
      <input id="apename"  name="apename" type="text" class="form-control" placeholder="请输入要搜索的供应商"/>
      
    &nbsp;&nbsp;
		<select id="pe"  name="pe" class="form-control" style="color:gray">
		<option value="0">请选择供应商</option>	
		</select>&nbsp;&nbsp;
		<input type="button" class="btn btn-primary" value="搜索产品" onclick="showfind()" />
      
      </div>
      <!-- ===================供应商显示表============= --> 
<table id="mypetable"></table>
<!--  ====================== 修改模态框============------------------- -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" >修改供应商</h4>
      </div>
      <div class="modal-body">
 <!-- ================================                  --> 
 <!-- ================================      修改----------------------              --> 
 <!-- ================================                 --> 
         <form id="peform">
<table class="table table-hover table-condensed"  width="70%">
<tr>
<td>供应商id</td><td ><input type="text" name="peid" id="peid" readonly="true"/></td>
</tr>
<tr>
<td>供应商名称</td><td><input type="text" name="pename" id="pename"  onblur="checkNameajax(this,'pe_pename')"/><span id="pe_pename"></span></td>
</tr>
<tr>
<td>供应商地址</td><td><input type="text" name="peadd" id="peadd"   onblur="checkadd(this,'peaddre')"/><span id="peaddre"></span></td>
</tr>
<tr>
<td>供应商电话</td><td><input type="text" name="petel" id="petel" onblur="checktel(this,'pephone')"/><span id="pephone"></span></td>
</tr>
<tr>
<td>供应商账号</td><td><input type="text" name="peacount"  id="peacount" onblur="checkacount(this,'peact')"/><span id="peact"></span></td>
</tr>
<tr>
<td>供应商邮箱</td><td><input type="text" name="peemail" id="peemail" onblur="checkemail(this,'peeml')"/><span id="peeml"></span></td>
</tr>

<tr>
<td colspan="2" align="center"><a class="btn btn-default btn-block" onclick="resetall(1)">数据重置</a></td>
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
<!--           ========================  增加模态框===============     -->

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加供应商</h4>
      </div>
      <div class="modal-body">
      <!--   ================================增加                            -->
      <!--   ================================增加                            -->
      <!--   ================================增加                            -->
      <!--   ================================增加                            -->
      
      
        <form action="peservice?op=addpe" method="post"  id="providerform">
<table class="table table-hover table-condensed" widt=70%>

<tr>
<td>供应商名称</td><td><input type="text" name="pename" id="providername"  onblur="checkNameajax(this,'pe_pename1')"/><span id="pe_pename1"></span></td>
</tr>
<tr>
<td>供应商地址</td><td><input type="text" name="peadd" id="provideradd" onblur="checkadd(this,'peaddre1')"/><span id="peaddre1"></span></td>
</tr>
<tr>
<td>供应商电话</td><td><input type="text" name="petel" id="providertel" onblur="checktel(this,'pephone1')"/><span id="pephone1"></span></td>
</tr>
<tr>
<td>供应商账号</td><td><input type="text" name="peacount" id="provideracount" onblur="checkacount(this,'peact1')"/><span id="peact1"></span></td>
</tr>
<tr>
<td>供应商邮箱</td><td><input type="text" name="peemail" id="provideremail" onblur="checkemail(this,'peeml1')" /><span id="peeml1"></span></td>
</tr>

<tr>
<td colspan="2" align="center"><a class="btn btn-default btn-block"  onclick="resetall(2)" >数据重置</a></td>
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
<script type="text/javascript">
//-----------==初始表===========-----------
$("#mypetable").bootstrapTable({
	url : 'selectAllPe',
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
         field: 'peID',
         title: '供应商ID'
     }, {
         field: 'pe_name',
         title: '供应商名称'
     }, {
         field: 'pe_add',
         title: '供应商地址'
     },{
         field: 'acount',
         title: '账号'
     },{
         field: 'pe_tel',
         title: '供应商电话'
     },{
         field: 'email',
         title: '邮箱'
     },{
    	 field: 'peID',
         formatter: autoadd,
         title: '操作'
     }]
     
 });
//操作方法
function autoadd(value, row ,index){
	 return "<a calss='btn' onclick=del('"+value+"')>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
	 "<a calss='btn' data-toggle='modal' data-target='#myModal' onclick=modify('"+value+"')>修改</a>"
}
//--------------------------删除方法----------------
function del(id){
	 $.ajax({ 
	     url:"deletePe",
	     type:"post",
	     data: {_method:"DELETE","id":id},
	    success:function(msg){
	   
	 	 if("ok"==msg){
	 		 alert("删除成功")
$("#mypetable").bootstrapTable("refresh")
		 		
		  }else if("use"==msg){
			  alert("供应商已被使用，无法删除")
		  }
	 	 else{
			  alert("删除失败")
		  }
	   }
	});   
}

//初始化
 $.ajax({
    url:"selectAllPee",
    type:"post",
    
   success:function(pe){
   	
	// var pe=JSON.parse(msg)
	 
   	
      
   		for(var i=0;i<pe.length;i++){
       		var option="<option value='"+pe[i].peID+"'>"+pe[i].pe_name+"</option>"
            $("#pe").append($(option))
       	}
   		
   }
});
 //修改的模态框初始化方法
 function modify(id){
	 get("pe_pename").innerHTML="";
	 get("peaddre").innerHTML="";
	 get("pephone").innerHTML="";
	 get("peact").innerHTML="";
	 get("peeml").innerHTML="";
	 
	
	 $.ajax({
	     url:"selectPeById",
	     type:"post",
	     data:{
	    	    "id":id
	    	 
	    	 
	     },
	    success:function(a){
	    	
	 	 
	 	 $("#peid").val(a.peID)
	 	  $("#pename").val(a.pe_name)
	 	   $("#peadd").val(a.pe_add)
	 	     $("#petel").val(a.pe_tel)
	 	       $("#peemail").val(a.email)
	 	         $("#peacount").val(a.acount)
	 	           
	 	   j=get("peid").value
	 	   b=get("pename").value
	 	   c=get("peadd").value
	 	   d=get("petel").value
	 	   e=get("peemail").value
	 	   f=get("peacount").value
	 	  
	    }
	 });   
 
 
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
 var i= null;
 var k= null;
 var l= null;
 var m= null;
function ismodify(){
 
 if( 
	 	  
	 	   c==get("peadd").value &&
	 	   d==get("petel").value  &&
	 	   e==get("peemail").value &&
	 	   f==get("peacount").value)
	 {return true}
 else{return false}
}

 
 
 //确定修改的方法
 function submitmodify(){
	/* if(!pn||!p1||!p2||!p3||!p4){
			checkName(get("pename"),"pe_pename")	 ;
			checkadd(get("peadd"),"peaddre")	 ;
			checktel(get("petel"),"pephone")	 ;
			checkacount(get("peacount"),"peact")	 ;
			checkemail(get("peemail"),"peeml")	 ;
			 }*/
		if(b==get("pename").value ){	 
	if(ismodify()){
		alert("数据未作修改，无法提交")
	}else{ pn=true
		checkadd(get("peadd"),"peaddre")	 ;
	checktel(get("petel"),"pephone")	 ;
	checkacount(get("peacount"),"peact")	 ;
	checkemail(get("peemail"),"peeml")	 ;
	update()
		}
	
		}else{	 
		checkNameajax(get("pename"),"pe_pename")	 ;
		checkadd(get("peadd"),"peaddre")	 ;
		checktel(get("petel"),"pephone")	 ;
		checkacount(get("peacount"),"peact")	 ;
		checkemail(get("peemail"),"peeml")	 ;
		update()
		} }
			 
 function update(){
 if(pn&&p1&&p2&&p3&&p4){
	 $.ajax({
	     url:"updatePe",
	     type:"post",
	     data:$("#peform").serialize(),
	    success:function(msg){
	    	
	 	 
	 	 if("ok"==msg){
	 		 alert("修改成功")
	 		$("#myModal").modal("hide")
	 	
	 		$("#mypetable").bootstrapTable("refresh")
	 		
	 	 }else if("notok"==msg){
	 		 alert("修改shibai，无法提交")
	 	 }
	 	 else{
	 		 alert("修改失败!")
	 	 }
	 	
	    }
	 });
	 
			 }else{alert("请正确填写数据，否则无法提交")}
}
 //增加是删除数据
 function deldata(){
	 get("pe_pename1").innerHTML="";
	 get("peaddre1").innerHTML="";
	 get("pephone1").innerHTML="";
	 get("peact1").innerHTML="";
	 get("peeml1").innerHTML="";
	 get("providername").value="";
	 get("provideradd").value="";
	 get("provideremail").value="";
	 get("provideracount").value="";
	 get("providertel").value="";
	 
	 
 }
 //检查是否为空
 function isnull(){
	 if( get("pe_pename1").innerHTML==""||
	 get("peaddre1").innerHTML==""||
	 get("pephone1").innerHTML==""||
	 get("peact1").innerHTML==""||
	 get("peeml1").innerHTML=="")
		 {return true}
	 else{return false}
 }
 //==========================增加的方法==============
 function submitadd(){
	 if(isnull()){
		 alert ("不能存在空行，请填满")
	 }
	 else{
			checkNameajax(get("providername"),"pe_pename")	 ;
			checkadd(get("provideradd"),"peaddre")	 ;
			checktel(get("providertel"),"pephone")	 ;
			checkacount(get("provideracount"),"peact")	 ;
			checkemail(get("provideremail"),"peeml")	 ;
			 
			 
			 
			 
			 if(pn&&p1&&p2&&p3&&p4){
	 $.ajax({
		
	     url:"insertPe",
	     type:"post",
	     data:$("#providerform").serialize(),
	    success:function(msg){
	    
	 	 if(msg=="ok"){
	 		 alert("增加成功")
	 		$("#myModal1").modal("hide")
	 	
	 		$("#mypetable").bootstrapTable("refresh")
	 		
	 	 }else{
	 		 alert("添加失败!")
	 	 }
	 	
	    }
	 });
			 }else{alert("请按要求填写数据，否则无法提交")}
	 
 }}
 //post方法获得参数
 function queryParams(params) {  //bootstrapTable自带参数  
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
		    		"pename":$("#apename").val(),
		    		"pid":$("#pe").val(),
		    		
		    		"cpage" : this.pageNumber,
		    		"limit" : this.pageSize
		    };  
		    return temp;  
		 }
 
 
 //模糊查询--------------------
 function showfind(){
	/* $.ajax({
	        url:"peservice",
	        type:"post",
	        data:{"op":"getpebyajax",
	        	  "currentpage":1,
	        	  "pagesize":4,
	        	  "pename":$("#apename").val(),
	        	  "pid":$("#pe").val()
	        	  
	        
	               },
	       success:function(msg){
	    	   alert(msg);
	       } })*/
	 $("#mypetable").bootstrapTable('destroy')
	 $("#mypetable").bootstrapTable({
			url : "selectPeByConditionByPage",
			method : 'post',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',	
		     striped: true,                      //是否显示行间隔色
		     cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     pagination: true,                   //是否显示分页（*）
		     sortable: false,                     //是否启用排序
		     sortOrder: "asc",                   //排序方式
		    queryParams:queryParams ,//传递参数（*）
		     sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
		     pageNumber:1,                       //初始化加载第一页，默认第一页
		     pageSize: 5,                       //每页的记录行数（*）
		     pageList: [5,10, 25, 50, 100],        //可供选择的每页的行数（*）
		     
		     showColumns: true,                  //是否显示所有的列
		     showRefresh: true,                  //是否显示刷新按钮
		     minimumCountColumns: 2,             //最少允许的列数
		     clickToSelect: true,                //是否启用点击选中行
		   
		     columns: [ {
		         field: 'peID',
		         title: '供应商ID'
		     }, {
		         field: 'pe_name',
		         title: '供应商名称'
		     }, {
		         field: 'pe_add',
		         title: '供应商地址'
		     },{
		         field: 'acount',
		         title: '账号'
		     },{
		         field: 'pe_tel',
		         title: '供应商电话'
		     },{
		         field: 'email',
		         title: '邮箱'
		     },{
		    	 field: 'peID',
		         formatter: autoadd,
		         title: '操作'
		     }]
		     
		 });
	 
 }
 //---------------------------------------------正则表达式-
 var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
function get(id){
	 return document.getElementById(id);
}
function checkall(str,i){
	var a=[
		
	/^[\u4e00-\u9fa5_a-zA-Z]+$/,
	/^[1]{1}[0-9]{10}$/, //电话号码验证
	/^[0-9|A-Z|a-z]{11}$/,//账号
	
	/^(\w{2,5}\.)?\w{2,55}@\w{2,5}\.[A-Z|a-z]{2,3}(\.cn)?$/, //邮箱验证
	/^[\u4e00-\u9fa5_a-zA-Z_0-9]+$/
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
function checktel(obj,k){
	var p=get(k);
	
	 p1=checkall(obj.value,1)
	if(p1){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 必须是以1开头的十一位数字</font>"	
	}
	
	
}
function checkacount(obj,k){
	var p=get(k);
	
	 p2=checkall(obj.value,2)
	if(p2){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'>账号必须由英文与数字组成且为11位</font>"	
	}
	
	
}
function checkemail(obj,k){
	var p=get(k);
	
	 p3=checkall(obj.value,3)
	if(p3){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'>  请正确填写邮箱格式必须带有@</font>"	
	}
	
	
}
function checkadd(obj,k){
	var p=get(k);
	
	 p4=checkall(obj.value,4)
	if(p4){
		p.innerHTML="<font color='green'> 符合规则</font>"
	}else{
		
		p.innerHTML="<font color='red'> 地址不能空，请正确填写</font>"	
	}
	
	
}
	






function resetall(op){
	if(op==1){
		get("peid").defaultValue=get("peid").value;
	get("peform").reset();
	get("penam").innerHTML="";
	get("peaddre").innerHTML="";
	get("pephone").innerHTML="";
	get("peact").innerHTML="";
	get("peeml").innerHTML="";
	}else if(op==2){
		deldata();
	}
	
}

function checkNameajax(obj,i){
	var pename=obj.value
	var p=get(i);
	 
	xmlhttp.open("GET","checkPeName?pename="+pename,true);
	 xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    var f=xmlhttp.responseText;
	    if(f=="true"){
	    	
	    	
	    		checkName(obj,i)
	    	
	   }else{p.innerHTML="<font color='red'> 重名,重新输入</font>"
		 pn=false;
	   }
	    
	  }
	
	
}
	 xmlhttp.send();
}






 
 </script>
</html>