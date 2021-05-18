<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="12345" url="jdbc:mysql://localhost:3306/movies"/>
<sql:query var="users" sql="SELECT * FROM user"></sql:query> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册用户信息界面</title>
<style type="text/css">
a{text-decoration: none;
}
body{
	font-size:100%;
	background: url(images/6.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;

}

</style>
</head>
<body>
<br>
<br>
<br>
<br>
<table align="center" width="600px" cellpadding="0" cellspacing="0" border="2">
			<tr align="center">
			<th colspan="6">注册信息用户界面</th></tr>
			
			<tr>
			<td align="center">序号</td>
				<td align="center">用户姓名</td>
				<td align="center">联系方式</td>
				<td align="center">密码</td>
				<td align="center">操作</td>
			</tr>
			<c:forEach var="qq" items="${users.rows}">
			<tr>
			<td align="center">${qq.id }</td>
			<td align="center">${qq.username }</td>
			<td align="center">${qq.email }</td>
			<td align="center">${qq.password }</td>
			<td align="center"><a href="delete.jsp?id=${qq.id }">删除</a></td>
			</tr>
			</c:forEach>
			<tr align="center"><th colspan="6"><a href="admin-main.jsp">返回</a></th></tr>
		</table>
</body>
</html>