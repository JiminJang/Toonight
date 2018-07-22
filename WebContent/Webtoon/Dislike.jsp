<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Cookie[] cookies = request.getCookies();
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String userID = (String) session.getAttribute("userID");
	String id = getCookieValue(cookies, "webtoonID");
	int webtoonID = Integer.parseInt(id);
System.out.println(webtoonID);
System.out.println(userID);
	if (userID == null) {
%>
<script language=javascript>
self.window.alert("로그인이 필요합니다.");
location.href="../User/Login.jsp?";
</script>
<%
	} else {

		try {

			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root",
					"1234");
			String command = String.format("delete from wishlist where webtoonID=? and userID=?");
			PreparedStatement pstmt = conn.prepareStatement(command);
			int uid=Integer.parseInt(userID);
			pstmt.setInt(1, webtoonID);
			pstmt.setInt(2, uid);

			pstmt.execute();
			pstmt.close();
			conn.close();

		} catch (Exception e) {

			out.println(e.toString());

		}
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
 self.window.alert(" 좋아요를 취소했습니다.");
 location.href="Detail.jsp?number=<%=webtoonID%>";
 </script>