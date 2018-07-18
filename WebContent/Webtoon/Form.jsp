    <%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

<title>���� ����ϱ�</title>
</head>
<body>
	<div id = "header">
		<a href="../Main.jsp">
			<img src="../Images/logo.png" style="float: left; width:15%;height : 10%">
		</a>
		<form class="search" action="Webtoon/Search.jsp">
        	<input type="text" name="search" id="search" style="">
        	<button type="submit" class="btn btn-secondary btn-sm" style="size: 40%;">search</button>
        </form>  
	</div>
	<br>
	<div id = "content">
		<div style="float:left; background-color:pink; width:20%; height:30%;"></div>
		<div>
		<form action="New.jsp" method="POST" enctype-"multipart/form-data">
			<input name="webtoonName" id="titlearea" type="text" placeholder="���� ����" style="display:block">
			<input name="url" id="contentarea tippost_content" placeholder="���� ��ũ" style="display:block">
			<input name="webtoonWriter" id="contentarea tippost_content" placeholder="�۰�">
			<label for="titlearea" class="input-label">�̹��� </label>
			<input type="file" name="image" placeholder="image" style="display:block">
			
			<textarea name="webtoonSummary" id="contentarea tippost_content" rows="7" placeholder="���� �ٰŸ�" style="display:block"></textarea>
			<br><br><br>
			<button type="submit" class="btn btn-secondary btn-sm" style="float: right;">���</button>
		</form>
		<form action=List.jsp method="GET">
			<button type="submit" class="btn btn-secondary btn-sm" style="float: left;">list</button>
		</form>
		</div>
	</div>
</body>
</html>
<%
	if (session.getAttribute("userID") == null) {
%>
<script language=javascript>
	self.window.alert(" �α����� �ʿ��մϴ�.  .");
	location.href = "../User/Login.jsp";
</script>
<%
	} else
		response.addCookie(new Cookie("writer", session.getAttribute("userID").toString()));
%>