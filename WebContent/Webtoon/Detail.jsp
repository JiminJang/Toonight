<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String number = request.getParameter("number");
    Class.forName("com.mysql.jdbc.Driver");
  
   int webtoonID = Integer.parseInt(number);
   String currentUser = (String) session.getAttribute("userID");
   try {
      Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");
      Statement stmt = conn.createStatement();
      String sql="select webtoonTitle, webtoonPoster,webtoonUrl from webtoon where webtoonID="+webtoonID;
      ResultSet result=stmt.executeQuery(sql);
      while(result.next()){
         String title=result.getString(1);
         String poster=result.getString(2);      
         String url=result.getString(3);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=title%> 상세정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
   
<body>
   <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#000030;">   
      <!-- 헤더 로고 -->
      <a class="navbar-brand" href="../Main.jsp">
         <img src="../Images/small_logo.png" class="d-inline-block align-top" width="130" height="50">
      </a>
      <!--링크-->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto" >
               <li class="nav-item"><a class="nav-link" href="List.jsp" style="color:#FFFFFF;">웹툰</a></li>
               <li class="nav-item"><a class="nav-link" href="../User/MyPage.jsp" style="color:#FFFFFF;">마이페이지</a></li>
               <li class="nav-item"><a class="nav-link" href="../User/Logout.jsp" style="color:#FFFFFF;">로그아웃</a></li>
            </ul>
       </div>
      <!-- 검색창 -->         
      <div style="text-align:center; margin-top:4%;">
               <form class="search" action="Search.jsp" method="POST">
                  <input type="text" name="search" id="search" style="">
                  <button type="submit" class="btn btn-secondary btn-sm" style="size: 40%;">search</button>
               </form>   
            </div>                       
    </nav><br><br>
         <!-- 헤더 끝 --> 
   <div class="wrap">
      <!-- 웹툰 포스터, 제목, 감정/별점, 좋아요, iframe까지 -->
      <div class="detail_content" style="clear:both">
         <!-- 웹툰 포스터 -->
         <img alt="" src="<%=poster%>" class="rounded mx-auto d-block">         
         <!-- 웹툰 제목 -->
         <h2 style="text-align:center"><a href="https://comic.naver.com/<%=url %>" class="webtoon_title"><%=title%></a></h2>
         <br>
            <div class="btn_wrap" style="text-align:center;">
               <!-- 감정/별점 통계 목록 -->
               <a href="Info.jsp" target="iframe1" class="btn btn-dark">감정/별점목록</a>   
               <!-- 감정/별점 등록 버튼 -->
               <a href="Feeling.jsp" target="iframe1" class="btn btn-dark">감정/별점등록</a>   
               <!-- 좋아요 버튼 -->             
            <%
               }
             String sql1="select count(*) from wishlist where userID= "+currentUser+" and webtoonID= "+webtoonID;
             ResultSet rs1=stmt.executeQuery(sql1);
             while (rs1.next()){
                int count=rs1.getInt(1);
                System.out.println(count);
                if(count==0){
            %>             
                   <a href="Like.jsp" class="btn btn-dark">좋아요 </a>                
             <%             
                }
                else{
             %>   
                   <a href="Dislike.jsp" class="btn btn-dark">좋아요 취소</a>
             <%
                }                
             }
             
            %>
                
         </div>
          <br>
          <div style="text-align:center;">
             <iframe src = "Intro.jsp" name="iframe1" width="80%" height="450" frameborder="0"></iframe> <!-- 웹툰 감정 차트,소개 페이지 / 감정, 별점 선택 페이지 / 좋아요 페이지 필요 -->
          </div>
       </div>
       <br>
       <p> Review </p>
        <form action="Comment.jsp" method="POST" style="text-align: center;">
      <input type="text" class="form-control" name="input_comment" placeholder="comment" style="width: 30em; height: 1.8em; display: inline;">
      <button type="submit" class="btn btn-secondary btn-sm">등록</button>
   </form>
   <hr>
   <%
               String sql4 = "select commentID, userID, content from comment where webtoonID=" + webtoonID;
                  ResultSet rs = stmt.executeQuery(sql4);
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
                  response.addCookie(new Cookie("number",number));
               } catch (SQLException e) {
               }
            %>
      </div>
   </body>
</html>