package servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Pic
 */
@WebServlet("/Pic")
public class Pic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub\
		Connection conn = null;
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String db_url = "jdbc:mysql://127.0.0.1:3306/toonight";

		try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(db_url,"root","1234");
		
		int webtoonID = Integer.parseInt(request.getParameter("webtoonID"));
		Statement stmt = conn.createStatement();
		String sql = "SELECT WEBTOONIMAGE FROM webtoon WHERE webtoonID=" + webtoonID;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
		// 바이너리 데이터를 저장하고 있는 컬럼으로부터 데이터를 가져온다
		InputStream in = rs.getBinaryStream("webtoonImage");
		// BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
		BufferedImage bimg = ImageIO.read(in);
		in.close();

		ServletOutputStream sos = response.getOutputStream();

		ImageIO.write(bimg, "png", sos);
		}
		rs.close();
		stmt.close();
		conn.close();

		}
		catch(Exception e) {
		System.err.println(e);
		}
	}

}
