<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>
<!--  ======================== 目录搜索================== -->
      <ul class="nav navbar-nav">
    <shiro:hasPermission name="role:insert">  <li class="active"><a href="#" data-toggle="modal" data-target="#myModal1" onclick="deldata()">新增角色<span class="sr-only"></span></a></li>
      </shiro:hasPermission>
      </ul>
     <shiro:hasPermission name="role:select"> <div class="navbar-form navbar-left" role="search">
      
      <input id="acaname"  name="acaname" type="text" class="form-control" placeholder="请输入要搜索的角色"/>
      
    &nbsp;&nbsp;
		
		<input type="button" class="btn btn-primary" value="搜索角色" onclick="searchcate()" />
      
      </div></shiro:hasPermission>
      <!-- ===================用户显示表============= --> 
<table id="myadmintable"></table>
      <!-- ===================目录修改模太框============= --> 
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改用户</h4>
      </div>
      <div class="modal-body">
   <form   id="categoryform">
   <input type="text" id="admin_id" name="id" hidden>
   <input type="text" id="role_name" name="role_name" hidden>
 
<table id="updatetable" class="table table-hover table-condensed" width="70%">
	<tr><td>名称</td></tr>
<tr><td><input type="text" name="rolename"  id="name1" onblur= 'checkName(this, "name2") '/><span id="name2"> </span></td></tr>
<tr><td>描述</td></tr>
<tr><td><input type="text" name="rolebeizhu"  id="beizhu1" onblur= 'checkdesc(this, "beizhu2") ' /><span id="beizhu2" > </span></td></tr>
<tr><td>代码</td></tr>
<tr><td><input type="text" name="roledesc"  id="desc1" onblur= 'checkbeizhu(this, "desc2") ' /><span id="desc2" > </span></td></tr>
		

</table>
</form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="anniu" onclick="submitmodify()">确定修改</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================增加表motaikuang============================= -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加用户</h4>
      </div>
      <div class="modal-body">
       <form  method="post" id="insertform">
<table id="inserttable" class="table table-hover table-condensed" width="70%">
<tr><td>名称</td></tr>
<tr><td><input type="text" name="rolename"  id="name" onblur= 'checkName(this, "name3") '/><span id="name3"> </span></td></tr>
<tr><td>描述</td></tr>
<tr><td><input type="text" name="rolebeizhu"  id="beizhu" onblur= 'checkdesc(this, "beizhu3") ' /><span id="beizhu3" > </span></td></tr>
<tr><td>代码</td></tr>
<tr><td><input type="text" name="roledesc"  id="desc" onblur= 'checkbeizhu(this, "desc3") ' /><span id="desc3" > </span></td></tr>


</table>
<table id="admintaable"></table>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button"  id="anniu1" class="btn btn-primary" onclick="submitadd()">确定提交</button>
      </div>
    </div>
  </div>
</div>
</body>
<!--======================= ajax使用bootStrapTable插件 ==============-->
<script type="text/javascript">
//-----------==初始表===========-----------
$("#myadmintable").bootstrapTable({
	url : 'selectRoleByPage',
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
         field: 'roleID',
         title: 'ID'
     }, {
         field: 'role_name',
         title: '角色名称'
     }, {
         field: 'roleID',
         formatter:showpower,
         title: '拥有权限'
     },{ 
         field: 'role_beizhu',
         title: '描述'
     },{
         field: 'role_desc',
         title: '代码'
     },{
    	 field: 'roleID',
         formatter: autoadd,
         title: '操作'
     }]
     
 });
 
 //post方法获得参数
 function queryParams(params) {  //bootstrapTable自带参数  
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
		    	
		    		"rolename":$("#acaname").val(),
		    		
		    		
		    		"offset" : this.pageNumber,
		    		"limit" : this.pageSize
		    };  
		    return temp;  
		 }

//模糊查询----------------
function searchcate(){
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
	 $("#myadmintable").bootstrapTable('destroy')
	$("#myadmintable").bootstrapTable({
			url : "selectRoleByconditionByPage",
			method : 'post',
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		     striped: true,                      //是否显示行间隔色
		     cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     pagination: true,                   //是否显示分页（*）
		     sortable: false,                     //是否启用排序
		     sortOrder: "asc",                   //排序方式
		    queryParams: queryParams,//传递参数（*）
		     sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
		     pageNumber:1,                       //初始化加载第一页，默认第一页
		     pageSize: 5,                       //每页的记录行数（*）
		     pageList: [5,10, 25, 50, 100],        //可供选择的每页的行数（*）
		     
		     showColumns: true,                  //是否显示所有的列
		     showRefresh: true,                  //是否显示刷新按钮
		     minimumCountColumns: 2,             //最少允许的列数
		     clickToSelect: true,                //是否启用点击选中行
		     columns: [ {
		         field: 'roleID',
		         title: 'ID'
		     }, {
		         field: 'role_name',
		         title: '角色名称'
		     }, {
		         field: 'roleID',
		         formatter:showpower,
		         title: '拥有权限'
		     },{ 
		         field: 'role_beizhu',
		         title: '描述'
		     },{
		         field: 'role_desc',
		         title: '代码'
		     },{
		    	 field: 'roleID',
		         formatter: autoadd,
		         title: '操作'
		     }]
		 });
	 
}
//操作方法
function autoadd(value, row ,index){
	 return "<shiro:hasPermission name='role:delete'><a type='button' class='btn btn-info btn-sm' onclick=del('"+value+"')>删除<span class='glyphicon glyphicon-remove  aria-hidden='true'></span></a></shiro:hasPermission >&nbsp;&nbsp;&nbsp;&nbsp;"+
	 "<shiro:hasPermission name='role:update'><a type='button' class='btn btn-info btn-sm' data-toggle='modal' data-target='#myModal' onclick=modify('"+value+"')>修改<span class='glyphicon glyphicon-wrench ' aria-hidden='true'></span></a></shiro:hasPermission >"
}
function showpower(value, row ,index){
	 return  "<input type='text' value='2' id='"+value+"a' hidden /> <a calss='btn'  onclick=findpower('"+value+"')>显示权限</a>"
}


// 
function  findpower(id){
	//alert($("#"+id+""))
	
	
	$.ajax({
	     url:"selectPowerByRID",
	     type:"post",
	     data:{
	    	    "id":id	    	  
	     },
	    success:function(msg){
	    	// alert(msg)
	    	 //alert(obj)
	    	 //alert(id)
	    	//this.parent.innerHTML="<input type='text' value='"+msg+"'>"
	    	$("#"+id+"a").parent().html(msg)
	    	//$("#"+id+"a").parent().html("<input style='border: 0px;outline:none;cursor: pointer; background-color:transparent' readonly type='text' value='"+msg+"'>")
	   }
 	});  
	
}
//--------------------------删除方法----------------
 function del(id){
	
	 if(confirm("确定删除?")){
	 $.ajax({
	     url:"deleteRolePower",
	     type:"post",
	     data:{
	    	    "id":id	    	  
	     },
	    success:function(msg){
	    //alert(msg)

	 	 if("ok"==msg){
	 		alert("删除成功") 
$("#myadmintable").bootstrapTable("refresh")
		 		
		  } else{alert("删除失败")}
	   }
	});
	 }
 }
 
	//修改订单一开始的初始化
	
	$.ajax({
		url : "selectAllPowers",
		type : "post",
		data : "op=getallcate",
		success : function(arr) {

			//var cate = JSON.parse(catelist)

			for (var i = 0; i < arr.length; i++) {
				var option = "<input type='checkbox' id="+arr[i].powerID+" name=powerid value='"+arr[i].powerID+"'>"
						+ arr[i].power_name + ":"+arr[i].navi_desc+"<br>"
				$("#updatetable").append($(option))
				$("#inserttable").append($(option))
				
			}
			

		}
	});
//增加订单一开始的初始化

	
	
	//检查是否修改

	var b = null;
	var c = null;

	function ismodify() {

		if (b == get("catename").value && c == get("catedesc").value)

		{
			return true
		} else {
			return false
		}
	}
	//修改的模态框初始化方法
	function modify(id) {
		$('input:checkbox').prop("checked", false);
		$("#beizhu2").html("")
		$("#desc2").html("")
		$("#name2").html("")
			
		$('#admin_id').val(id);
		$.ajax({
			url : "selectpowersById",
			type : "post",
			data : {

				"id" : id

			},
			success : function(arr) {
				$("#name1").val(arr[0].role_name)
				$("#role_name").val(arr[0].role_name)
				$("#beizhu1").val(arr[0].role_beizhu)
				$("#desc1").val(arr[0].role_desc)
				//var a=JSON.parse(arr)
				//alert(a[0].roleID)
				//alert($("input[name='roleid']").length)
				//var b=$("input[name='roleid']");
				
				
				for (var j=0;j<arr[1].length;j++){
					
					 $("input[name='powerid']") .each(function(i){
						 
						// alert($(this).val())
						  //alert(i+"====="+obj.value)
						 if($(this).val()==arr[1][j].powerID){
							 //alert(a[i].roleID)
							 $(this).prop('checked',true);
							
						 }
					});
				}
				
				//var a = JSON.parse(msg)
// 				 $("input[name='roleid']") 
// 				$("#cid").val(a.cgID)
// 				$("#catename").val(a.cg_name)
// 				$("#catedesc").val(a.cg_desc)
// 				$("#c_catename").html("")
// 				$("#beizhu").html("")

// 				b = get("catename").value
// 				c = get("catedesc").value

			}
		});

	}
	//确定修改的方法
	function submitmodify() {
		p1=false
		p2=false
		pn=false
		if(get("name1").value==get("role_name").value){pn=true,checkbeizhu(get("desc1"),"desc2")
		   	checkdesc(get("beizhu1"),"beizhu2")}
		else{
	   	checkName(get("name1"),"name2")
	   	checkbeizhu(get("desc1"),"desc2")
	   	checkdesc(get("beizhu1"),"beizhu2")}
	   //	alert(get("name1").value+p1+"   "+p2+"  "+pn)
	  
		if($("input[name='powerid']").not("input:checked" ).length==$("input[name='powerid']").length)
		{alert("至少选择一个主导行点和一个导航点")}
		else{
		 	if(p1&&pn&&p2){
		$.ajax({
			url : "updateRolePower",
			type : "post",
			data : $("#categoryform").serialize(),
			success : function(msg) {
				// alert(msg)
				if ("ok" == msg) {
					alert("修改成功")
					$("#myModal").modal("hide")

					$("#myadmintable").bootstrapTable("refresh")

				} else if ("未修改" == msg) {
					alert("未作修改无法提交!")
				} else {
					alert("修改失败!")
				}
		}

		});
	  }
		 	else{alert("请按要求填写数据")}
		 	
	}
}
	//封装成一个方法，判断是否能够修改
	function update() {
		if (p1 && pn) {
			$.ajax({
				url : "updateCate",
				type : "post",
				data : $("#categoryform").serialize(),
				success : function(msg) {
      alert(msg)
					if ("ok" == msg) {
						alert("修改成功")
						$("#myModal").modal("hide")

						$("#mycatetable").bootstrapTable("refresh")

					} else if ("未修改" == msg) {
						alert("未作修改无法提交!")
					} else {
						alert("修改失败!")
					}
				}

			});

		} else {

			alert("请按要求填写数据")
		}
	}

	
	
	
	//增加时把原有的数据删除
	function deldata() {
	$("#name").val("")
		$("#beizhu").val("")
		$("#desc").val("")
		$('input:checkbox').prop("checked", false);
	$("#beizhu3").html("")
	$("#desc3").html("")
	$("#name3").html("")
		
	}
	//判断空行
	function isnull() {
		if (get("desc").value.trim() == "" || get("name").value.trim() == ""||get("beizhu").value.trim() == "") {
			return true
		} else {
			return false
		}
	}
	//判断修改的空行
	function isupdatenull() {
		if (get("desc1").value.trim() == "" || get("name1").value.trim() == ""||get("beizhu1").value.trim() == "") {
			return true
		} else {
			return false
		}
	}
	//确定增加----------------------
	function submitadd() {
// 		if (isnull()) {
// 			alert("存在空行，无法提交")
// 		} else {
// 			checkNameajax(get("kind"), "catenme1")
// 			checkdesc(get("desc"), "beizhu1")
// 			if (p1 && pn) {
//	alert($("input[name='powerid']").not("input:checked" ).length+"       "+$("input[name='powerid']").length)
   if(isnull())	{alert("存在空行无法提交")}
   else{
	
	if($("input[name='powerid']").not("input:checked" ).length==$("input[name='powerid']").length)
		{alert("至少选择一个主导行点和一个导航点")}
	else{
		if(p1&&pn&&p2){
				$.ajax({
					url : "insertRoleAndPower",
					type : "post",
					data : $("#insertform").serialize(),
					success : function(msg) {
                        //  alert(msg)
						if (msg =="ok") {
                            alert("添加成功")
							$("#myModal1").modal("hide")

							$("#myadmintable").bootstrapTable("refresh")

						} else {
							alert("添加失败!请按要求输入数据")
						}

					}
	 			});
		}
		else{alert("请按要求填入数据")}
	   }
     }
// 			} else {
// 				alert("添加失败!请按要求输入数据")
// 			}
// 		}
		/*p1=false;
		 pn=false;
		 p2=false;*/
	}
	//--------------ajax判断有无重名------------
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	function checkNameajax(obj, i) {
		var name = obj.value
		var p = get(i);
		//$("#anniu1").css("display","none");
		xmlhttp.open("GET",
				"checkRname?name=" + name, false);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var f = xmlhttp.responseText;
				if (f == "true") {
					p.innerHTML = "<font color='green'> 符合规则</font>"
									
				} else {
					
				
					p.innerHTML = "<font color='red'> 重名,请重新输入</font>"
                    pn=false;
				}

			}

		}
		xmlhttp.send();
	}

	function get(id) {
		return document.getElementById(id);
	}
	//-----------------------------------=======正则表达式===============--------------
	var pn = false;
	var p1 = false;
	var p2 = false;
	function get(id) {
		return document.getElementById(id);
	}
	function checkall(str, i) {
		var a = [ /^[\u4e00-\u9fa5_a-zA-Z]+$/,
			 /^[a-zA-Z]+$/
		]
		return a[i].test(str)
	}

	function checkName(obj, i) {

		var p = get(i);

		pn = checkall(obj.value, 0)
		if (pn) {
			checkNameajax(obj, i)
		} else {

			p.innerHTML = "<font color='red'> 必须是汉字或英文</font>"
			pn=false
		}

	}
	function checkdesc(obj, i) {

		var p = get(i);

		p1 = checkall(obj.value, 0)
		if (p1) {
			p.innerHTML = "<font color='green'> 符合规则</font>"
		} else {

			p.innerHTML = "<font color='red'> 必须是汉字或英文</font>"
			p1=false
		}

	}
	function checkbeizhu(obj, i) {

		var p = get(i);

		p2 = checkall(obj.value, 1)
		if (p2) {
			p.innerHTML = "<font color='green'> 符合规则</font>"
		} else {

			p.innerHTML = "<font color='red'> 代码必须是英文</font>"
			p2=false
		}

	}

	function resetall(op) {
		if (op == 2) {
			get("cid").defaultValue = get("cid").value
			get("categoryform").reset();
			get("c_catename").innerHTML = "";
			get("beizhu").innerHTML = "";
		} else if (op == 1) {

			get("caform").reset();
			get("catenme1").innerHTML = "";
			get("beizhu1").innerHTML = "";
		}

	}
</script>




</html>
