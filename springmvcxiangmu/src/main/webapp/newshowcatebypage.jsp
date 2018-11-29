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
      
<head>l
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>
<!--  ======================== 目录搜索================== -->
      <ul class="nav navbar-nav">
      <li class="active"><a href="#" data-toggle="modal" data-target="#myModal1" onclick="deldata()">新增目录<span class="sr-only"></span></a></li>
      
      </ul>
      <div class="navbar-form navbar-left" role="search">
      
      <input id="acaname"  name="acaname" type="text" class="form-control" placeholder="请输入要搜索的产品"/>
      
    &nbsp;&nbsp;
		<select id="cate"  name="cate" class="form-control" style="color:gray">
		<option value="0">请选择目录</option>	
		</select>&nbsp;&nbsp;
		<input type="button" class="btn btn-primary" value="搜索产品" onclick="searchcate()" />
      
      </div>
      <!-- ===================目录显示表============= --> 
<table id="mycatetable"></table>
      <!-- ===================目录修改模太框============= --> 
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改目录</h4>
      </div>
      <div class="modal-body">
   <form   id="categoryform">
<table class="table table-hover table-condensed" width="70%">
<tr>
<td>目录id</td><td ><input type="text" name="ctid"  id="cid" readonly="true"/></td>
</tr>
<tr>
<td>类名</td><td><input type="text" name="catename"  id="catename"  onblur="checkNameajax(this,'c_catename');" /><span id="c_catename"></span></td>
</tr>
<tr>
<td>备注</td><td><input type="text" name="ctbeizhu" id="catedesc" onblur="checkdesc(this,'beizhu');" /><span id="beizhu"></span></td>
</tr>
<tr>
<td colspan="2"><input type="reset" value="数据重置" onclick="resetall(2)"/></td>
</tr>

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
        <h4 class="modal-title" id="myModalLabel">增加目录</h4>
      </div>
      <div class="modal-body">
       <form  method="post" id="caform">
<table class="table table-hover table-condensed" width="70%">

<tr>
<td>类别</td><td><input type="text" name="catename1"  id="kind"  onblur="checkNameajax(this,'catenme1')"/><span id="catenme1"> </span></td>
</tr>
<tr>
<td>备注</td><td><input type="text" name="catebeizhu1"  id="desc"  onblur="checkdesc(this,'beizhu1')"/><span id="beizhu1" > </span></td>
</tr>


<tr>
<td colspan="2"><input type="button" value="数据重置" onclick="resetall(1)"/></td>
</tr>

</table>
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
$("#mycatetable").bootstrapTable({
	url : 'selectCateByPage',
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
 
 //post方法获得参数
 function queryParams(params) {  //bootstrapTable自带参数  
		    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
		    	
		    		"caname":$("#acaname").val(),
		    		"cid":$("#cate").val(),
		    		
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
	 $("#mycatetable").bootstrapTable('destroy')
	$("#mycatetable").bootstrapTable({
			url : "selectCateByconditionByPage",
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
	 
}
//操作方法
function autoadd(value, row ,index){
	 return "<a calss='btn' onclick=del('"+value+"')>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
	 "<a calss='btn' data-toggle='modal' data-target='#myModal' onclick=modify('"+value+"')>修改</a>"
}
//--------------------------删除方法----------------
 function del(id){
	 $.ajax({
	     url:"deleteCate",
	     type:"post",
	     data:{
	    	    "id":id	    	  
	     },
	    success:function(msg){
	    //alert(msg)

	 	 if("success"==msg){
$("#mycatetable").bootstrapTable("refresh")
		 		
		  }else if("use"==msg){
			  alert("该目录已被使用无法删除")
		  } else{alert("删除失败")}
	   }
	});   
 }
 
	//初始化
	
	$.ajax({
		url : "selectAllCate",
		type : "post",
		data : "op=getallcate",
		success : function(catelist) {

			//var cate = JSON.parse(catelist)

			for (var i = 0; i < catelist.length; i++) {
				var option = "<option value='"+catelist[i].cgID+"'>"
						+ catelist[i].cg_name + "</option>"
				$("#cate").append($(option))
			}

		}
	});
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

		$.ajax({
			url : "findCateById",
			type : "post",
			data : {

				"id" : id

			},
			success : function(a) {

				//var a = JSON.parse(msg)
				$("#cid").val(a.cgID)
				$("#catename").val(a.cg_name)
				$("#catedesc").val(a.cg_desc)
				$("#c_catename").html("")
				$("#beizhu").html("")

				b = get("catename").value
				c = get("catedesc").value

			}
		});

	}
	//确定修改的方法
	function submitmodify() {

		if (b == get("catename").value) {
			if (ismodify()) {
				alert("未做任何修改无法提交")
			} else {
				pn = true;
				checkdesc(get("catedesc"), "beizhu")
				update();
			}
		}

		else {
			checkNameajax(get("catename"), "c_catename")

			checkdesc(get("catedesc"), "beizhu")
			update()
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
		get("catenme1").innerHTML = "";
		get("beizhu1").innerHTML = "";
		get("desc").value = "";
		get("kind").value = ""
	}
	//判断空行
	function isnull() {
		if (get("desc").value == "" || get("kind").value == "") {
			return true
		} else {
			return false
		}
	}
	//确定增加----------------------
	function submitadd() {
		if (isnull()) {
			alert("存在空行，无法提交")
		} else {
			checkNameajax(get("kind"), "catenme1")
			checkdesc(get("desc"), "beizhu1")
			if (p1 && pn) {
				$.ajax({
					url : "insertCate",
					type : "post",
					data : $("#caform").serialize(),
					success : function(msg) {
                          alert(msg)
						if (msg =="success") {

							$("#myModal1").modal("hide")

							$("#mycatetable").bootstrapTable("refresh")

						} else {
							alert("添加失败!请按要求输入数据")
						}

					}
				});
			} else {
				alert("添加失败!请按要求输入数据")
			}
		}
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
		var caname = obj.value
		var p = get(i);
		//$("#anniu1").css("display","none");
		xmlhttp.open("GET",
				"checkCanameByAjax?catename=" + caname, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var f = xmlhttp.responseText;
				if (f == "true") {

					checkName(obj, i)
					p2 = true;
					//	$("#anniu1").css("display","block");
				} else {
					p2 = false
					pn = false;
					// $("#anniu1").css("display","block");
					p.innerHTML = "<font color='red'> 重名,请重新输入</font>"

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

		]
		return a[i].test(str)
	}

	function checkName(obj, i) {

		var p = get(i);

		pn = checkall(obj.value, 0)
		if (pn) {
			p.innerHTML = "<font color='green'> 符合规则</font>"
		} else {

			p.innerHTML = "<font color='red'> 必须是汉字或英文</font>"
		}

	}
	function checkdesc(obj, i) {

		var p = get(i);

		p1 = checkall(obj.value, 0)
		if (p1) {
			p.innerHTML = "<font color='green'> 符合规则</font>"
		} else {

			p.innerHTML = "<font color='red'> 必须是汉字或英文</font>"
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