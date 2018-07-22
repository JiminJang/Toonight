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
<title>����</title>
</head>
<body>
	<h3>���� ���</h3>
	<p>���̹� ����</p>
	<ul class = "naver_webtoon">
		<c:forEach var="vo" items="${list }">    <!-- list�� �����Ͱ� ������� �ӽú��� 'vo'�� ���� -->
        	<li class="li_Webtoon">
        		<a href="Detail.jsp?number=${vo.number }"> <!-- �ش��ϴ� number ������ detail.jsp�� �̵� -->             
        		<!-- ����� ����� --> 
            	 ${vo.title }	
            	<img src="${vo.poster }" width="100" height="100" border="0">
            	</a>
            </li>            
        </c:forEach>
     </ul>
     
     <p>���� ����</p>
	
</body>
</html>