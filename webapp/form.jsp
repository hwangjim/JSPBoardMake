<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "member" class = "model.vo.MemberProjectVO" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판맨</title>
</head>
<body>
<%
	String strReferer = request.getHeader("referer");

	if(strReferer == null) {
%>
	<script language = "javascript">
		alert("이게 어디서 URL 직접접근을 하고있어!")	
		document.location.href = "login.jsp";
	</script>
<%
	return;
	}
%>
<h1>케인TV</h1>
<h2>자 지금은 잡담하는 시간이 아니에용~</h2>
<form action="controller.jsp" method = "post">
	<input type = "hidden" name = "action" value = "insert">
	<table border = "2">
		<tr>
			<td>별거없는제목</td>
			<td><input type = "text" name = "title" required></td>
		</tr>
		<tr>
			<td>별거없는내용</td>
			<td><input type = "text" name = "content" required></td>
		</tr>
		<tr>
			<td>작성자나부랭탱이</td>
			<td><input type = "text" name = "writer" value = "${member.mid}" readonly required></td>			
		</tr>
		<tr>
			<td colspan = "2" align = "left">
				<input type = "submit" value = "작성완료맨">
			</td>
		</tr>		
	</table>
</form>
<hr>
<a href = "controller.jsp?action=main">메인으로</a>
</body>
</html>