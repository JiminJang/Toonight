<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

Class.forName("com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
	List<WebtoonDTO> list = WebtoonManager.webtoonAllData();
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>웹툰</title>
</head>
<body>
	<h3>웹툰 목록</h3>
	<p>네이버 웹툰</p>
	<ul class = "naver_webtoon">
		<c:forEach var="vo" items="${list }">    <!-- list의 데이터가 순서대로 임시변수 'vo'에 대입 -->
        	<li class="li_Webtoon">
        		<a href="Detail.jsp?number=${vo.number }"> <!-- 해당하는 number 웹툰의 detail.jsp로 이동 -->             
        		<!-- 제목과 썸네일 --> 
            	 ${vo.title }	
            	<img src="${vo.poster }" width="100" height="100" border="0">
            	</a>
            </li>            
        </c:forEach>
     </ul>
     
     <p>다음 웹툰</p>
	
</body>
</html>