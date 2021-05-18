<%@ page contentType="textml;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>数据删除</title>
</head>
<body>
<%!
    public static final String DBDRIVER="com.mysql.jdbc.Driver";
    public static final String DBURL="jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8";
    public static final String DBUSER="root";
    public static final String DBPASS="12345";
%>
    <%
    Connection conn=null;
    PreparedStatement pst=null;
    int rs=0;
    String id=request.getParameter("id");
%>

    <%
   try{
	  Class.forName(DBDRIVER);
	  conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
	  String sql_delete="delete from user where id="+id+"";
	  
	  //获取要删除的此id的数据库信息
	  pst=conn.prepareStatement(sql_delete);
	  rs=pst.executeUpdate();
	  if(rs!=0){
		  request.getRequestDispatcher("admin-main.jsp").forward(request, response);
%>
<%
        }
    }
    catch(Exception e){
        out.println(e);
    }
    
%>
</body>
</html>
