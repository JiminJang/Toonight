<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy ȸ������</title>
</head>
<body>
	
			
			<script>
				window.onload = function() {
					document.getElementById("isCheck").value = "false";
					document.getElementById("checkId").onclick = function() {
						var sid = document.getElementById("id").value;
						if (sid == null || sid.length == 0) {
							alert("���̵� �Է��ϰ� �˻��ϼ���");
						} else {
							window
								.open("CheckId.jsp?id=" + sid, "",
									"width=300 height=300");
						}
					}
					
					document.getElementById("SignUpForm").onsubmit=function(){
						var isCheck=document.getElementById("isCheck").value;
						if(isCheck != "true"){
							alert("���̵� �ߺ�üũ�� ���� �ʾҽ��ϴ�.");
						    return false;
						}
						return true;
					}
					//id ���� ��Ŀ���� ���� �ߺ�üũ�� �ٽ� �ϵ��� isCheck�� ���� ����
					document.getElementById("id").onblur = function() {
						document.getElementById("isCheck").value = "false";
					}
				}
			</script>
			<div id="content">
			<div id="login">
				<H4>ȸ�� ������ �Է��ϼ���</H4>
				<FORM ID="SignUpForm" ACTION=SignUpProcess.jsp Method=POST>
					<input style="border:none; border-bottom:1px solid;" type="hidden" id="isCheck" /> ���̵�:<INPUT TYPE=TEXT NAME=id id="id" style="border:none; border-bottom:1px solid;" required><input type="button" class="btn btn-secondary btn-sm" value="�ߺ�Ȯ��" id="checkId" /> <BR> �н�����:<INPUT TYPE=PASSWORD style="border:none; border-bottom:1px solid;" NAME=password id="password" required><BR> �̸�:<INPUT TYPE=TEXT style="border:none; border-bottom:1px solid;" NAME=name id="name" required><INPUT TYPE="SUBMIT" class="btn btn-secondary btn-sm" VALUE='ȸ������'> <INPUT TYPE="RESET" class="btn btn-secondary btn-sm" VALUE='���'>
				</FORM>
				</div>
			</div>
		
</body>
</html>