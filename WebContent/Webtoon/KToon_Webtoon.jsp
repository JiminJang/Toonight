<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Class.forName("com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
List<WebtoonDTO> list1 = WebtoonManager.webtoonNaverData();
   List<WebtoonDTO> list2 = WebtoonManager.webtoonKToonData();
    request.setAttribute("list2", list2);
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
   <p>케이툰</p>
   <ul class = "webtoon_content">
<%

WebtoonDTO vo=list2.get(0);
       for(int i=0; i<list2.size(); i++){

           vo=list2.get(i);
      
            String sql4="select webtoonID from webtoon where webtoonTitle='"+vo.getTitle()+"';";
           
            ResultSet rs4=stmt.executeQuery(sql4);
            while (rs4.next()){
               int webtoonID=rs4.getInt(1);
               
               %>
              
               
              <a href="Detail.jsp?number=<%=webtoonID%>"><%=vo.getTitle() %></a><br>
   

     </ul>
</body>
</html>
<%
           }
          
       
      //System.out.println(vo.toString());
   }
 
   conn.close();
   %>