<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MY PAGE</title>
</head>
<body>
	<div id = "header">
		<a href="../Main.jsp">
			<img src="../Images/logo.png" style="float: left; width:15%;height : 10%">
		</a>
		<form class="search" action="../Webtoon/Search.jsp">
        	<input type="text" name="search" id="search" style="">
        	<button type="submit" class="btn btn-secondary btn-sm" style="size: 40%;">search</button>
        </form>  
	</div>
	<br>
	<div id = "content">
		<div id = "profile">
		<p>name</p>
		</div>
		<div id = "like_list">
		<P>���ƿ� ����Ʈ</P>
		</div>
		<div id = "recommend_list">
		<p>��õ ����Ʈ</p>

	</div>
	</div>







</body>
</html>