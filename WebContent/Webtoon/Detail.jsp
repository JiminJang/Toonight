<%@page import="webtoon.WebtoonManager"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String number = request.getParameter("number");
	WebtoonDTO vo = WebtoonManager.webtoonDetail(Integer.parseInt(number));
    
    System.out.println("number");
    request.setAttribute("vo", vo);
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
 	<a href="" target="iframe1">좋아요</a>
 	<br>
 	<iframe src = "" width="800" height="300" name="iframe1" seamless></iframe> <!-- 웹툰 감정 차트,소개 페이지 / 감정, 별점 선택 페이지 / 좋아요 페이지 필요 -->
 	<br>
 	<p> Review </p>
 	<input></input><button>댓글작성</button>

</body>
</html>