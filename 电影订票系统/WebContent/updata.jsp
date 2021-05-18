<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% 
request.setCharacterEncoding("utf-8");
String Username = request.getParameter("username");  
String Email = request.getParameter("email");  
String Password = request.getParameter("password");
String id= request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
//桥接
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8");
//连接数据库

String sql = "UPDATE user SET"+" email='"+Email+"',"+"username='"+Username+"',"+"password='"+Password+"'"+ " WHERE (`id` = ?)";
Statement statement=con.createStatement();
//语句对象
//String sql = "select * from users where name='"+ name +"'and pwd='"+ pwd + "'";
//ResultSet rs=statement.executeQuery(sql);
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,id);
//ps.setString(2,email);
//ps.setString(3,name);
//ps.setString(4,password);
ps.executeUpdate();

con.close();
response.sendRedirect("user-single.jsp");
%>
