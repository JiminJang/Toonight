
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<p>save</p>



<%

Class.forName("com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");

Cookie[] cookies = request.getCookies();

String number = getCookieValue(cookies, "number");

int webtoonID=Integer.parseInt(number);

String id = (String) session.getAttribute("userID");
int userID=Integer.parseInt(id);

String[] feelings;
feelings=request.getParameterValues("feeling");

String[] ratings;
ratings=request.getParameterValues("rating");
int grade=Integer.parseInt(ratings[0]);

int n1=Integer.parseInt(feelings[0]);
int n2=Integer.parseInt(feelings[1]);
int n3=Integer.parseInt(feelings[2]);
String command="select count(*) from feelings where userID=? and webtoonID=?";

PreparedStatement pstmt = conn.prepareStatement(command); 

pstmt.setInt(1,userID);
pstmt.setInt(2,webtoonID);
//pstmt.execute();
 
ResultSet rs=pstmt.executeQuery();
while(rs.next()){
	int count= rs.getInt(1);
	if(count==0){
	out.println("count=0");

String command1 = String.format("insert into feelings(webtoonID,userID, grade, f?,f?,f?) values (?,?,?,?,?,?) ;");

PreparedStatement pstmt1 = conn.prepareStatement(command1); 
pstmt1.setInt(1,n1);
pstmt1.setInt(2,n2);
pstmt1.setInt(3,n3);
pstmt1.setInt(4,webtoonID);
pstmt1.setInt(5,userID);
pstmt1.setInt(6,grade);

pstmt1.setInt(7,1);
pstmt1.setInt(8,1);
pstmt1.setInt(9,1);
pstmt1.execute();


pstmt1.close();

	}else{
		out.println("count!=0");
		String sql11="update feelings  set grade=?, f?=1, f?=1, f?=1 where webtoonID=? and userID=? ";

PreparedStatement pstmt2 = conn.prepareStatement(sql11); 

pstmt2.setInt(1,grade);
pstmt2.setInt(2,n1);
pstmt2.setInt(3,n2);
pstmt2.setInt(4,n3);
pstmt2.setInt(5,webtoonID);
pstmt2.setInt(6,userID);
pstmt2.execute();

pstmt2.close();
	}
}

pstmt.close();
%>
<%!private String getCookieValue(Cookie[] cookies, String name) {
		String value = null;
		if (cookies == null)
			return null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name))
				return cookie.getValue();
		}
		return null;
	}%>
</body>
</html>