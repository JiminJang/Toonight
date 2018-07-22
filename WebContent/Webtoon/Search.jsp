<%@ page language="java" contentType="text/html; charset=euc-kr" errorPage="DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				
				<form class="search" action="Search.jsp">
					<input type="text" name="search" id="search" size="8" style="text-align: center; float: left; border: none;">
					<button type="submit" class="btn btn-secondary btn-sm" style="size: 40%; float: right;">search</button>
				</form>
			</div>
			
			<div id="content">
				<div class="album text-muted">
					<div class="container">
						<div class="row">
							<%
								String search = request.getParameter("search");
								Connection conn = null;
								Statement stmt = null;
								int count = 0;
								try {
									Class.forName("com.mysql.jdbc.Driver");
									conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/toonight", "root", "1234");
									if (conn == null)
										throw new Exception("데이터베이스에 연결할 수 없습니다.");
									stmt = conn.createStatement();
									ResultSet rs = stmt
											.executeQuery("select count(*) from web where webTitle like '%" + search + "%'");
									while (rs.next()) {
										count = rs.getInt(1);
									}
									rs.close();
									if (count == 0) {
							%>
							<script language=javascript>
 self.window.alert("검색결과가 존재하지 않습니다.");
 location.href="../Main.jsp";
 </script>
							<%
								} else {
										rs = stmt.executeQuery("select webID, webTitle from web where webTitle like '%"
												+ search + "%'");

										while (rs.next()) {

											int webID = rs.getInt(1);
											String webTitle = rs.getString(2);
											
							%>
							<div class="card" style="margin-right: 20px; margin-top: 9px; border: none; border-bottom: solid 1px; border-color: #D3D3D3;">
									<p class="card-text"><%=webID%></p>
									<p class="card-text"><%=webTitle%></p>
							</div>
							</a>
							<%
								}
									}
									rs.close();
									stmt.close();
									conn.close();
								} catch (SQLException e) {
									out.println(e.toString());
								}
							%>
						</div>
					</div>
				</div>
			</div>
</body>
</html>