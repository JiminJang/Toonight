<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>

<%@ page import="java.io.*" %>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String image= request.getParameter("image");

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/toonight", "root", "1234");
		if (name == null || id == null || password == null)
			throw new Exception("누락된 데이터가 있습니다.");

		if (conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");

		stmt = conn.createStatement();
		
		
		File imgfile= new File(image);
		FileInputStream fin=new FileInputStream(imgfile);

		String command = String.format("insert into user(name,userID,password,userImage)values(?,?,?,?)");
		PreparedStatement pstmt = conn.prepareStatement(command);
		pstmt.setString(1,name);
		pstmt.setString(2, id);
		pstmt.setString(3, password);
		pstmt.setBinaryStream(4,fin,(int)imgfile.length());
		
		
	

		pstmt.execute();
		pstmt.close();
		conn.close();
	} finally {
		try {
			stmt.close();
		} catch (Exception ignored) {
		}
		try {
			conn.close();
		} catch (Exception ignored) {
		}
	}
	response.sendRedirect("SignUpResult.jsp");
%>