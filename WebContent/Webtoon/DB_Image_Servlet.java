public class DB_Image_Viewer extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("image/png"); 
Connection conn = null;
PreparedStatement pstmt = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String db_url = "jdbc:mysql://127.0.0.1:3306/toonight";


try{
Class.forName(jdbc_driver);
conn = DriverManager.getConnection(db_url,"root","1234");
Statement stmt = conn.createStatement();
InputStream input=null;
OutputStream output=response.getOutputStream();
String sql = "SELECT WEBTOONIMAGE FROM webtoon WHERE webtoonID=" + webtoonID;
ResultSet rs = stmt.executeQuery(sql);

if (rs.next()) {
	String img=rs.getString(1);
	
	input=rs.getBinaryStream(img);
	int byteRead;
	while((byteRead=input.read()) !=-1){
		output.write(byteRead);
		
	}
	
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
