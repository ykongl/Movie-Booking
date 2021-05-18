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

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/contact.do")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        User newContact = new User();
		
		newContact.setUsername(request.getParameter("username"));
		newContact.setEmail(request.getParameter("email"));
		newContact.setPhone(request.getParameter("phone"));
		newContact.setSubject(request.getParameter("subject"));
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies?user=root&password=12345&useUnicode=true&characterEncoding=UTF8");
			String sql = "insert into contact(username,email,phone,subject) values(?,?,?,?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1,newContact.getUsername());
			stat.setString(2,newContact.getEmail());		
			stat.setString(3,newContact.getPhone());
			stat.setString(4,newContact.getSubject());
			stat.executeUpdate();
			stat.close();
			conn.close();
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}

}
