<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%  //String id=(String)request.getParameter();
 /*Cookie []arr=request.getCookies();
String id1=null;
for(Cookie c:arr){
	if("JSESSIONID".equals(id+c.getName())
		id1=c.getValue();
	c.setMaxAge(60);
	response.addCookie(c);
	
}*/


String id=(String)session.getAttribute("baochi");
%>



<body >

<!-- <h2>当前在线人数：${denglunum }</h2>  -->
<h2 color="red"> 欢迎<font color="red">:${sessionScope.username}</font>使用系统</h2>

</body>
</html>