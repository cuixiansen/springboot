<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">

   
      <script src="javascript/jQuery-1.12.4.js"></script>
      <script src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
/*$(document).click(function(e){
	var a=e.target.innerHTML;
	alert(a)
	if("显示目录"==a){
		$("#myifream").attr("src","admin/products/puser")
		
	}
	
	
	
})*/




</script>

</head>
<body>
		
		<body>
		
		<div class="container-fluid">
			<div class="row" style="height:100px;">
		<div class="col-lg-12 container-fluid" style="border-bottom: currentColor; solid;" align="center"><h2>xx管理系统</h2></div>
		<div style="width:100px;height:30px;margin-top:40px;margin-left:90%;" ><a href="outlogin">退出登录</a></div>
		</div>
		<!--   =============左边模态框=========================                           -->
	<div class="row">
			<div class="col-md-2" >
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  产品管理
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body ">
      	<center><a class="btn btn-default btn-block"  href="showpu" target="myifream">显示产品</a></center>
      	<!--  <center><a class="btn btn-default btn-block" href=admin/products/puservice?op=addpu>增加产品</a></center>-->
      	<center><a class="btn btn-default btn-block" href=admin/products/puservice?op=addpu>增加产品</a></center>
      	<center><a class="btn btn-default btn-block">修改产品</a></center>
      	<center><a class="btn btn-default btn-block">删除产品</a></center>
      	<center><a class="btn btn-default btn-block">查询产品</a></center>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
              供应商管理
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
      	<center><a class="btn btn-default btn-block" href="newshowallpe.jsp" target="myifream">显示供应商</a></center>
      	<center><a class="btn btn-default btn-block">增加供应商</a></center>
      	<center><a class="btn btn-default btn-block">修改供应商</a></center>
      	<center><a class="btn btn-default btn-block">删除供应商</a></center>
      	<center><a class="btn btn-default btn-block">查询供应商</a></center>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
          目录管理
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
      	<center><a class="btn btn-default btn-block"   href="newshowcatebypage.jsp"  target="myifream">显示目录</a></center>
      	<center><a class="btn btn-default btn-block">增加目录</a></center>
      	<center><a class="btn btn-default btn-block">修改目录</a></center>
      	<center><a class="btn btn-default btn-block">删除目录</a></center>
      	<center><a class="btn btn-default btn-block">查询目录</a></center>
        </div>
    </div>
    </div>
    <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingfour">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="true" aria-controls="collapsefour">
                                  订单管理
        </a>
      </h4>
    </div>
    <div id="collapsefour" class="panel-collapse collapse  " role="tabpanel" aria-labelledby="headingfour">
      <div class="panel-body ">
      	<center><a class="btn btn-default btn-block" href="newshoworders.jsp" target="myifream">显示订单</a></center>
      	<center><a class="btn btn-default btn-block" href="admin/order/orderservlet?op=showorderbypage&currentpage=1&pagesize=4">增加订单</a></center>
      	<center><a class="btn btn-default btn-block">修改订单</a></center>
      	<center><a class="btn btn-default btn-block">删除订单</a></center>
      	<center><a class="btn btn-default btn-block">查询订单</a></center>
        </div>
    </div>
  </div>
    
    
  </div>
  </div>
  
  
  <!--==================这是右边的主体部分=============-->
		<div class="col-md-10" >
		
		<iframe id="myifream" frameborder="0" name="myifream" src="right.jsp" width="100%" height="600px">
		
		</iframe>
		</div>
			
		
	</div>
</div>
		
	
	</body>
</html>