<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@ page errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String number = request.getParameter("number");
	WebtoonDTO vo = WebtoonManager.webtoonDetail(Integer.parseInt(number));
    
    System.out.println("number");
    request.setAttribute("vo", vo);
    
    Class.forName("com.mysql.jdbc.Driver");
    

	int webtoonID = Integer.parseInt(number);
	String currentUser = (String) session.getAttribute("userID");
	try {
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");
		Statement stmt = conn.createStatement();
		
		

	
			

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${vo.title } 상세정보</title>
</head>
<body>

	<img alt="" src="${vo.poster }">
 	<h5>${vo.title }</h5>
 	
	<a href=https://comic.naver.com${vo.url}>보러가기</a>
	<a href="../User/MyPage.jsp">My Page</a>
	<br>
 	<a href="" target="iframe1">감정, 별점</a>
 	<%
 	String sql1="select count(*) from wishlist where userID= "+currentUser+" and webtoonID= "+webtoonID;
 	ResultSet rs1=stmt.executeQuery(sql1);
 	while (rs1.next()){
 		int count=rs1.getInt(1);
 		System.out.println(count);
 		if(count==0){
 			%>
 			
 			<a href="Like.jsp">좋아요 </a>
 			
 			
 			<%
 			
 		}
 		else{
 			%>
 			
 			<a href="Dislike.jsp">좋아요 취소</a>
 			<%
 		}
 			
 	}
 	
 	
 	%>
 	
 
 	<br>
 	<iframe src = "" width="800" height="300" name="iframe1" seamless></iframe> <!-- 웹툰 감정 차트,소개 페이지 / 감정, 별점 선택 페이지 / 좋아요 페이지 필요 -->
 	<br>
 	<p> Review </p>
 	<form action="Comment.jsp" method="POST" style="text-align: center;">
		<input type="text" class="form-control" name="input_comment" placeholder="comment" style="width: 30em; height: 1.8em; display: inline;">
		<button type="submit" class="btn btn-secondary btn-sm">등록</button>
	</form>
	<hr>
	<%
					String sql = "select commentID, userID, content from comment where webtoonID=" + webtoonID;
						ResultSet rs = stmt.executeQuery(sql);
						while (rs.next()) {
							int commentID = rs.getInt(1);
							String userID = rs.getString(2);
							String content = rs.getString(3);
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
						stmt.close();
						conn.close();

					} catch (SQLException e) {
					}
				%>
			</div>
</body>
</html>
