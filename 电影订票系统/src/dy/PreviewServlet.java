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
 * Servlet implementation class PreviewServlet
 */
@WebServlet("/preview.do")
public class PreviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String Username = request.getParameter("username");
		String FilmNmae = request.getParameter("filmName");
		String Number = request.getParameter("number");
		String Price = request.getParameter("price");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8");
			String sql = "insert into cart(username,filmName,number,price) values(?,?,?,?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, Username);
			stat.setString(2, FilmNmae);
			stat.setString(3, Number);
			stat.setString(4, Price);
			
			stat.executeUpdate();
			stat.close();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			
		}
		request.getRequestDispatcher("message.jsp").forward(request, response);
	}
	

}

