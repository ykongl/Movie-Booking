<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

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
			<th colspan="6">控制界面</th></tr>
			<tr>
			<tr>
			<td align="center">序号</td>
				<td align="center">用户姓名</td>
				<td align="center">联系方式</td>
				<td align="center">密码</td>
			</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
String host = "jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8";
String user = "root";
String pwd="12345";

Connection conn = DriverManager.getConnection(host, user, pwd);
Statement stmt = conn.createStatement();
int res;
/*res= stmt.executeUpdate("INSERT INTO user(username,email,password)values('zhangsan','123456@qq.com','12345')");
out.println(res);*/

res = stmt.executeUpdate("UPDATE user set username='张三' where username='zhangsan'");
out.println(res);

/* res = stmt.executeUpdate("delete from user where id=7");
out.println(res); */

ResultSet rs = stmt.executeQuery("SELECT * FROM user");
while(rs.next()){
	out.println("<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("username")+"</td><td>"+rs.getString("email")+"</td><td>"+rs.getString("password")+"</td></tr>");
}

conn.close();
%>
</table>
</body>
</html>