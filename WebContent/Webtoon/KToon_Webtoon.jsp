<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

Class.forName("com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
	List<WebtoonDTO> list = WebtoonManager.webtoonKToonData();
    request.setAttribute("list", list);

    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");

	String command = String.format("insert into webtoon(webtoonTitle,webtoonPoster)select ?,? where not exists(select * from webtoon where webtoonTitle=?);");
	PreparedStatement pstmt = conn.prepareStatement(command);
    
    WebtoonDTO vo1=list.get(0);
    
    Statement stmt=conn.createStatement();
    for(int i=0; i<list.size(); i++){
    	vo1 =list.get(i);  
    	   String webTitle=vo1.getTitle();
    		String webPoster=vo1.getPoster();
    	
    		String sql= String.format("create table if not exists webtoon(webtoonID integer not null auto_increment,webtoonTitle longtext,webtoonPoster blob, webtoonGrade integer, webtoonFeels varchar (20), primary key(webtoonID))" );
    		
    		
    		stmt.executeUpdate(sql);

    		pstmt.setString(1,webTitle);
    		pstmt.setString(2, webPoster);
    		pstmt.setString(3,webTitle);
    		pstmt.execute();
    }


          	  %>

              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>À¥Å÷</title>
</head>
<body>
   <h3>À¥Å÷ ¸ñ·Ï</h3>
   <ul class = "naver_webtoon">
   <%
   
       for(int i=0; i<list.size(); i++){
		
			WebtoonDTO vo2=list.get(i);

            String sql4="select webtoonID from webtoon where webtoonTitle='"+vo2.getTitle()+"';";
           
            ResultSet rs4=stmt.executeQuery(sql4);
            while (rs4.next()){
          	  int webtoonID=rs4.getInt(1);
          	  
          	  %>
          	 
          	  
              <a href="KToon_Detail.jsp?number=<%=webtoonID%>"><%=vo2.getTitle() %></a><br>
   

     </ul>
     
</body>
</html>
<%
  
            }}
	pstmt.close();
	conn.close();
	
	%>    