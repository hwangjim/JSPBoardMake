<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "data" class = "model.vo.MemberProjectVO" scope = "request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지다맨이야</title>
</head>
<body>
<!-- 비로그인상태에서 마이페이지 접속을 막게끔 -->
<%
	String strReferer = request.getHeader("referer");

	if(strReferer == null) {
%>
	<script language = "javascript">
		alert("이게 어디서 URL 직접접근을 하고있어!")	
		document.location.href = "index.jsp";
	</script>
<%
	return;
	}
%>
<h1>얘 뭘 바꾸려고 애쓰니?</h1>
<form action="controller.jsp?action=mupdate" method = "post">
	<table border = "2">
		<tr>
			<td>아이디</td>
			<td><input type = "text" name = "mid" value = "${data.mid}" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type = "password" name = "mpw" value = "${data.mpw}" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type = "text" name = "mname" value = "${data.mname}" required></td>
		</tr>
		<tr>
			<td colspan = "2" align = "left">
				<input type = "submit" value = "변경했다맨이야">
			</td>
		</tr>	
	</table>
</form>
<br>
<hr>

<a href = "controller.jsp?action=main">메인으로</a>
<br><br>
<a href = "controller.jsp?action=mdelete">회원탈퇴</a>
</body>
</html>