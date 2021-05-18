package dy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dy.User;

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        User newUser = new User();
		
		newUser.setUsername(request.getParameter("username"));
		newUser.setEmail(request.getParameter("email"));
		newUser.setPassword(request.getParameter("password"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8");
			String sql = "insert into user(username,email,password) values(?,?,?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1,newUser.getUsername());
			stat.setString(2,newUser.getEmail());		
			stat.setString(3,newUser.getPassword());
			stat.executeUpdate();
			stat.close();
			conn.close();
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			
		}
		request.getRequestDispatcher("login.html").forward(request, response);
	}

}