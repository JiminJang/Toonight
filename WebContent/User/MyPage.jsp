<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>


<%

Class.forName("com.mysql.jdbc.Driver");

request.setCharacterEncoding("euc-kr");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");
    

String userID = (String) session.getAttribute("userID");


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MY PAGE</title>
</head>
<body>
	<div id = "header">
		<a href="../Main.jsp">
			<img src="../Images/logo.png" style="float: left; width:15%;height : 10%">
		</a>
		<form class="search" action="../Webtoon/Search.jsp">
        	<input type="text" name="search" id="search" style="">
        	<button type="submit" class="btn btn-secondary btn-sm" style="size: 40%;">search</button>
        </form>  
	</div>
	<br>
	<div id = "content">
		<div id = "profile">
		<p>name</p>
		</div>
		<div id = "like_list">
		<P>좋아요 리스트</P>
		<%


		Statement stmt = conn.createStatement();

	String sql = "select webtoon.webtoonID, webtoonTitle, webtoonPoster from (wishlist join user on wishlist.userID=user.userID) join webtoon on (wishlist.webtoonID=webtoon.webtoonID) where user.userID= " + userID;
	ResultSet rs = stmt.executeQuery(sql);
	while (rs.next()) {
		int webtoonID=rs.getInt(1);
		String webtoonTitle=rs.getString(2);
		String webtoonPoster=rs.getString(3);
		
		%>
		<img src="<%=webtoonPoster%>">
		<a href="../Webtoon/Detail.jsp?number=<%=webtoonID%>"><p><%= webtoonTitle%></p></a>
		
		<% 
    	
    	
      //System.out.println(vo.toString());
	}
 
	stmt.close();
	conn.close();


		
		
		
		
		%>
		</div>
		<div id = "recommend_list">
		<p>추천 리스트</p>

	</div>
	</div>







</body>
</html>