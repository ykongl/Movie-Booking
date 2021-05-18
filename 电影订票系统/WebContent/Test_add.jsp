<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% 
request.setCharacterEncoding("utf-8");
String Username = request.getParameter("username");
String Email = request.getParameter("email");  
 
String Password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
//桥接
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8");
//连接数据库
String sql = "insert into user values(null,?, ?, ?)";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,Username);
ps.setString(2,Email);
ps.setString(3,Password);
ps.executeUpdate();
con.close();
response.sendRedirect("user-single.jsp");
%>
