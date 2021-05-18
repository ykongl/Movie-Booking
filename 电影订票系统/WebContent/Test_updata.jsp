<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改订单</title>
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
<form action="updata.jsp"method="post" name="re">
			<table align="center" width="1000px" cellpadding="0" cellspacing="0" border="2">
			<tr align="center">
			<th colspan="6">修改订单</th></tr>
			<tr>
				<td align="center">id</td>
				<td align="center">用户姓名</td>
				<td align="center">联系方式</td>
				<td align="center">密码</td>
			</tr>
			<tr>
				<td align="center"><input type="text" name="id" id="id"></td>
				<td align="center"><input type="text" name="username" id="name"></td>
				<td align="center"><input type="text" name="email" id="email"></td>
				<td align="center"><input type="text" name="password" id="number"></td>
				
			</tr>
			<tr>
				<td align="center" colspan="4"><input type="submit"  name="Submit" value="修改" ></td>
				
			</tr>
			</table>
</form>
</body>

</html>
