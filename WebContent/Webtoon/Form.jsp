    <%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>Joy �Խñ� �ۼ��ϱ�</title>
</head>
<body>

				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
			
						<h3>�۾���</h3>
						<hr>
							<form action="New.jsp" method="POST" enctype-"multipart/form-data">
								<label for="titlearea" class="input-label">���� ���� </label>
								 <input name="webtoonName" id="titlearea" type="text">
								 <label for="titlearea" class="input-label">�̹��� </label>
								 <input type="file" name="image">
								 
								  <label for="contentarea" class="input-label">���� �ٰŸ� </label>
								<textarea name="webtoonSummary" id="contentarea tippost_content" rows="7"></textarea>
								
								<label for="titlearea" class="input-label">�۰�</label>
								<textarea name="webtoonWriter" id="contentarea tippost_content" rows="7"></textarea>
								
								<label for="titlearea" class="input-label">�ּ� </label>
								<textarea name="url" id="contentarea tippost_content" rows="7"></textarea>
								
								<br>
								<hr>
						<hr>
						<button type="submit" class="btn btn-secondary btn-sm" style="float: right;">���</button>
						</form>
						<form action=List.jsp method="GET">
							<button type="submit" class="btn btn-secondary btn-sm" style="float: left;">list</button>
						</form>
			

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