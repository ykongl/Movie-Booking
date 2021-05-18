<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<style>
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
<form action="Test_add.jsp"method="post" name="re">
			<table align="center" width="1000px" cellpadding="0" cellspacing="0" border="2">
			<tr align="center">
			<th colspan="6">添加</th></tr>
			<tr>
			    <td align="center">用户姓名</td>
				<td align="center">邮箱</td>
				<td align="center">密码</td>
			</tr>
			<tr>
			    <td align="center"><input type="text" name="username" id="name"></td>
				<td align="center"><input type="text" name="email" id="email"></td>
				<td align="center"><input type="password" name="password" id="pwd"></td>
			</tr>
			<tr>
				<td align="center" colspan="3"><input type="submit"  name="Submit" value="添加" ></td>
				
			</tr>
			</table>

</form>

</body>

</html>
