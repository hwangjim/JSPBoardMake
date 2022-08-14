<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "data" class = "model.vo.BoardProjectVO" scope = "request" />
<jsp:useBean id = "member" class = "model.vo.MemberProjectVO" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세맨</title>
</head>
<body>
<!-- URL을 바꿔서 접속할 경우 차단 -->
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
<!-- 로그인시 게시글 삭제 여부  -->
<script type="text/javascript">
	function deleteboard() {
		delans = confirm('얘! 삭제해도 되겠니?');
		if(delans == true) {
			document.boardForm.action.value = "delete";
			document.boardForm.submit();
		} else {
			return;
		}
	}
</script>
<h1>케인TV</h1>
<h2>자 지금 게시판을 적는시간이에요 날 놀리는 시간이아니라~</h2>
<form name = "boardForm" action = "controller.jsp" method = "post">
	<input type = "hidden" name = "action" value = "update">
	<input type = "hidden" name = "bid" value = "${data.bid}">
	<table border = "2">
		<tr>
			<td>별거없는제목</td>
			<td><input type = "text" name = "title" value = "${data.title}"></td>
		</tr>
		<tr>
			<td>별거없는내용</td>
			<td><input type = "text" name = "content" value = "${data.content}"></td>
		</tr>
		<tr>
			<td>작성자나부랭탱이</td>
			<td><input type = "text" name = "writer" value = "${data.writer}"></td>
		</tr>
		<!-- 비로그인시에는 변경, 삭제 버튼이 나타나지않는동시에 admin이나 로그인후 본인 게시글을 들어갔을때
		변경, 삭제 버튼이 나오게끔 -->
		<%
			if(member.getMid() != null && (member.getAct().equals("ADMIN") || member.getMid().equals(data.getWriter()))) {
		%>
		<tr>
			<td colspan = "2" align = "left">
				<input type = "submit" value = "변경맨">&nbsp;<input type = "button" value = "삭제맨" onClick = "deleteboard()">
			</td>
		</tr>
	<%
			}
	%>
	</table>
</form>
<hr>
<a href = "controller.jsp?action=main">메인으로</a>
</body>
</html>