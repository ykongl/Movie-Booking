package dy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin.do")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8");
			String sql = "select * from admin where username=? and password=?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, username);
			stat.setString(2, password);
			ResultSet rs = stat.executeQuery();
			if(rs.next()){
				admin Admin = new admin();
				Admin.setId(rs.getInt(1));
				Admin.setUsername(username);
				request.getSession(true).setAttribute("Admin", Admin);
				response.sendRedirect("admin-main.jsp");
			}
			else{
				response.sendRedirect("admin.html");
			}
			stat.close();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			
		}
		
	}
	

}
