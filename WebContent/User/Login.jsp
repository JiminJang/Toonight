<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 로그인</title>
</head>
<style>
</style>
<body>

					<%
						String id = (String) session.getAttribute("userID");
						if (id == null) {
					%>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="SignUp.jsp">회원가입</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="Login.jsp">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">로그아웃</a></li>
					<%
						}
					%>
	
			<div id="login" >
				<FORM ACTION=LoginProcess.jsp Method=POST>
					아이디:<INPUT TYPE=TEXT NAME=id style="border:none; border-bottom:1px solid;"required><BR> 패스워드:<INPUT TYPE=PASSWORD NAME=password style="border:none; border-bottom:1px solid;" required>
					<br><br><INPUT TYPE="submit" VALUE='확인'  style="float:right;" class="btn btn-secondary btn-sm"><BR>
				</FORM>
				<a href="SignUp.jsp">회원가입 하기</a>
				</div>

</body>
</html>