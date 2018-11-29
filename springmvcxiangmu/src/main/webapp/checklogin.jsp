<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%
String adname=(String)session.getAttribute("username");
if(adname==null){
	out.print("<script>  location.href='denglujiemian.jsp' </script>");
}

%>


