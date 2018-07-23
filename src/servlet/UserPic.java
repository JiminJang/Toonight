package servlet;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserPic
 */
@WebServlet("/UserPic")
public class UserPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
		
		
	
	    Statement stmt=null;
	    String sql=null;
	    BufferedInputStream bin=null;
	    BufferedOutputStream bout=null;
	    InputStream in =null;

	    response.setContentType("image/jpeg");  
	    ServletOutputStream out;  
	    out = response.getOutputStream();  
	    
	    
	    Connection conn = null;
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String db_url = "jdbc:mysql://127.0.0.1:3306/toonight";

		try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(db_url,"root","1234");
		int userID=Integer.parseInt(request.getParameter("userID"));
	        try {
	            stmt = conn.createStatement();
	    		sql = "SELECT userImage FROM user WHERE userID=" + userID;
	            ResultSet result = stmt.executeQuery(sql);
	            if(result.next()){
	                in=result.getBinaryStream("userImage");
	                int byteRead;
	                while((byteRead=in.read())!=-1) {
	                	out.write(byteRead);
	                }
	                in.close();
	            }

	        } catch (SQLException ex) {
	        }finally{
	        try{
	            if(bin!=null)bin.close();  
	            if(in!=null)in.close();  
	            if(bout!=null)bout.close();  
	            if(out!=null)out.close();
	            if(conn!=null)conn.close();
	        }catch(IOException | SQLException ex){
	            System.out.println("Error : "+ex.getMessage());
	        }
	        }
		
		}catch (Exception ex) {
        }
	      }
	
		
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


}}
