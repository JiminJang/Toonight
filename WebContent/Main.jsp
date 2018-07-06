<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Main</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<ul class="nav justify-content-end">
					<%
						String id = (String) session.getAttribute("userID");
						if (id == null) {
					%>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="User/SignUp.jsp">회원가입</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="User/Login.jsp">로그인</a></li>
					<%
						} else if (id.equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" href="Manager/ManagerMode.jsp">괸리자모드</a></li>
					<li class="nav-item"><a class="nav-link" href="User/Logout.jsp">로그아웃</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="User/MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="User/Logout.jsp">로그아웃</a></li>
					<%
						}
					%>
				</ul>
				
			<a href="Main.jsp"><img src="Images/biglogo.png" style="float: left; height: 20%;" ></a>
				<form class="search" action="Webtoon/Search.jsp">
					<input type="text" name="search" id="search"  >
					<button type="submit" class="btn btn-secondary btn-sm" style="size: 40%; float: right;">search</button>
				</form>
			</div>
			
				
			</div>
		</div>
	
</body>
</html>