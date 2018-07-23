<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

Class.forName("com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
	List<WebtoonDTO> list = WebtoonManager.webtoonNaverData();
    request.setAttribute("list", list);

    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");

	String command = String.format("insert into webtoon(webtoonTitle,webtoonPoster)select ?,? where not exists(select * from webtoon where webtoonTitle=?);");
	PreparedStatement pstmt = conn.prepareStatement(command);
    
    WebtoonDTO vo=list.get(0);
    for(int i=0; i<list.size(); i++){
    	vo =list.get(i);  
    	   String webTitle=vo.getTitle();
    		String webPoster=vo.getPoster();
    	
    		String sql= String.format("create table if not exists webtoon(webtoonID integer not null auto_increment,webtoonTitle varchar(20),webtoonPoster blob, webtoonGrade integer, webtoonFeels varchar (20), primary key(webtoonID))" );
    		Statement stmt=conn.createStatement();
    		stmt.executeUpdate(sql);
    		
    		pstmt.setString(1,webTitle);
    		pstmt.setString(2, webPoster);
    		pstmt.setString(3,webTitle);
    		


    		pstmt.execute();
    	
      //System.out.println(vo.toString());
	}
 
	pstmt.close();
	conn.close();


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>À¥Å÷</title>
</head>
<body>
   <h3>À¥Å÷ ¸ñ·Ï</h3>
   <a href = "Naver_Webtoon.jsp"><p>³×ÀÌ¹ö À¥Å÷</p></a>
   <a href = "Daum_Webtoon.jsp"><p>´ÙÀ½ À¥Å÷</p></a>
   <a href = "Lezhin_Webtoon.jsp"><p>·¹Áø À¥Å÷</p></a>
   <a href = "KToon_Webtoon.jsp"><p>ÄÉÀÌÅ÷ À¥Å÷</p></a>

</body>
</html>
