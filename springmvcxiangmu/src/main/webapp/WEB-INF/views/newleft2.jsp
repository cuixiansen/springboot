<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">


</script>
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
		
		<div class="container-fluid" >
			<div class="row " style="height:100px;">
		<div class="col-lg-12 " style="border-bottom: currentColor; solid;" align="center"><h2>xx管理系统</h2></div>
		<div    style="width:100px;height:30px;margin-top:40px;margin-left:90%;" ><a type="button" class="btn btn-danger " href="outlogin"> <span class="glyphicon glyphicon-alert" aria-hidden="true"></span>退出登录</a></div>
		</div>
		<!--   =============左边模态框=========================                           -->
	<div class="row">
			<div class="col-md-2" >
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<c:forEach items="${navilist}" var="a">
<shiro:hasPermission name="${a.power_code}">
  <div class="panel panel-default">
  
    <div class="panel-heading" role="tab" id="heading${a.powerID }">
      <h4 class="panel-title">
       <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${a.powerID }" aria-expanded="true" aria-controls="collapse${a.powerID }">
            ${a.power_name}                     
        </a>
        <span class="caret"></span>
      </h4>
    
    </div>
   
    <div id="collapse${a.powerID }" class="panel-collapse collapse " role="tabpanel" aria-labelledby="heading${a.powerID }">
      <div class="panel-body ">
      <c:forEach items="${a.list}" var="secondnavi">
      	
      	<shiro:hasPermission name="${secondnavi.power_code}"><center><a class="btn btn-default btn-block"  href="${secondnavi.url }" target="myifream"><span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>${secondnavi.power_name }</a></center>
        </shiro:hasPermission>
        </c:forEach>
      	
      	
        </div>
    </div>
     
  </div>
  </shiro:hasPermission> 
  </c:forEach>
  
  
  
    
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