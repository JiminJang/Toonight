<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%
	Cookie[] cookies = request.getCookies();
%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	request.setCharacterEncoding("euc-kr");
	String writer = getCookieValue(cookies, "writer");

	String webtoonName = request.getParameter("webtoonName");
	String webtoonSummary = request.getParameter("webtoonSummary");

	try {

		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");

		String command = String.format("insert into webtoon(writer,webtoonName,webtoonSummary)values(?,?,?)");
		PreparedStatement pstmt = conn.prepareStatement(command);
		pstmt.setString(1,writer);
		pstmt.setString(2, webtoonName);
		pstmt.setString(3, webtoonSummary);

		pstmt.execute();
		pstmt.close();
		conn.close();

	} catch (Exception e) {

		out.println(e.toString());

	}
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
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "List.jsp";
</script>