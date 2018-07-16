<%@ page language="java" contentType="text/html; charset=euc-kr" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body>
	<div id="wrapper">
		<div id="container">
		
			<%
				Class.forName("com.mysql.jdbc.Driver");

				int webtoonID = Integer.parseInt(request.getParameter("webtoonID"));
				String currentUser = (String) session.getAttribute("userID");
				try {
					Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");
					Statement stmt = conn.createStatement();
					String sql = "SELECT WEBTOONNAME, WEBTOONSUMMARY, WRITER, WEBTOONIMAGE FROM webtoon WHERE webtoonID=" + webtoonID;
					ResultSet rs = stmt.executeQuery(sql);

					if (rs.next()) {
						String webtoonName = rs.getString(1);
						String webtoonSummary = rs.getString(2);
						String writer = rs.getString(3);
						Blob webtoonImage=rs.getBlob(4);
						
						
						
						
						
			%>
			<div id="content">
				<!-- 내용 -->
				<div>
					<p class="show-top1" style="border-bottom: 1px solid; border-top: 2px solid;">
						subject &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=webtoonName%></p>
						<p><img src="../Pic?webtoonID=<%=webtoonID%>"></p>
					<p class="show-top2" style="border-bottom: 1px solid">
						writer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=writer%></p>
					<p class="show-top2" style="border-bottom: 1px solid">
					<p style="margin-top: 2em; margin-bottom: 5em;"><%=webtoonSummary%></p>
					<p class="show-top2" style="border-bottom: 1px solid">
					
				</div>
				
				<div style="border-top: 2px solid">
					<br>
					<form action=List.jsp method="GET">
						<button type="submit" class="btn btn-secondary btn-sm" style="float: left;">list</button>
					</form>
					
					<%
						}
								
							

							rs.close();
					%>
				</div>
				<br>
				<hr>
				<form action="Comment.jsp" method="POST" style="text-align: center;">
					<input type="text" class="form-control" name="input_comment" placeholder="comment" style="width: 30em; height: 1.8em; display: inline;">
					<button type="submit" class="btn btn-secondary btn-sm">등록</button>
				</form>
				<hr>
				<%
					sql = "select commentID, userID, content from comment where webtoonID=" + webtoonID;
						ResultSet rs2 = stmt.executeQuery(sql);
						while (rs2.next()) {
							int commentID = rs2.getInt(1);
							String userID = rs2.getString(2);
							String content = rs2.getString(3);
							String cid = Integer.toString(commentID);

							if (userID != null) {
				%>
				<tr height="25" align="center">
					<td>&nbsp;</td>
					<td><%=userID%>:</td>
					<td align="left"><%=content%></td>
					<%
						if (currentUser != null) {
										if (currentUser.equals(userID)) {
					%>
					<td align="left">
						<form action=CommentDelete.jsp method="POST">
							<button type="submit" class="btn btn-secondary btn-sm" style="float: right;" formmethod="POST" data-confirm="댓글을 삭제합니다">delete</button>
						</form></td>
					<%
						response.addCookie(new Cookie("commentID", cid));
					%>
					<%
						}
									}
					%>
				</tr>
				<tr height="1" bgcolor="#D2D2D2">
					<td colspan="6"></td>
				</tr>
				<br>
				<hr>
				<%
					}
						}
						String id = Integer.toString(webtoonID);
						response.addCookie(new Cookie("webtoonID", id));

						rs.close();
						rs2.close();
						stmt.close();
						conn.close();

					} catch (SQLException e) {
					}
				%>
			</div>
		</div>
</body>
</html>
