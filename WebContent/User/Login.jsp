<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> �α���</title>
</head>
<style>
</style>
<body>

					<%
						String id = (String) session.getAttribute("userID");
						if (id == null) {
					%>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="SignUp.jsp">ȸ������</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="Login.jsp">�α���</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">�α׾ƿ�</a></li>
					<%
						}
					%>
	
			<div id="login" >
				<FORM ACTION=LoginProcess.jsp Method=POST>
					���̵�:<INPUT TYPE=TEXT NAME=id style="border:none; border-bottom:1px solid;"required><BR> �н�����:<INPUT TYPE=PASSWORD NAME=password style="border:none; border-bottom:1px solid;" required>
					<br><br><INPUT TYPE="submit" VALUE='Ȯ��'  style="float:right;" class="btn btn-secondary btn-sm"><BR>
				</FORM>
				<a href="SignUp.jsp">ȸ������ �ϱ�</a>
				</div>

</body>
</html>