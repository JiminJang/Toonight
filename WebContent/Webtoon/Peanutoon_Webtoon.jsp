<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Class.forName("com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
List<WebtoonDTO> list5=WebtoonManager.webtoonPeanutoonData();
    request.setAttribute("list5", list5);
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");

    Statement stmt=conn.createStatement();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>웹툰</title>
</head>
<body>
   <h3>웹툰 목록</h3>
   <p>피너툰</p>
   <ul class = "webtoon_content">
<%
   
       for(int i=0; i<list5.size(); i++){
      
         WebtoonDTO vo2=list5.get(i);
            String sql4="select webtoonID from webtoon where webtoonTitle='"+vo2.getTitle()+"';";
           
            ResultSet rs4=stmt.executeQuery(sql4);
            while (rs4.next()){
               int webtoonID=rs4.getInt(1);
               
               %>
              
               
              <a href="Detail.jsp?number=<%=webtoonID%>"><%=vo2.getTitle() %></a><br>
   

     </ul>
</body>
</html>
<%
           }
          
       
      //System.out.println(vo.toString());
   }
 
   conn.close();
   %>