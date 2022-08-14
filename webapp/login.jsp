<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인해라맨이야</title>
</head>
<body>
<h1>케인TV</h1>
<h2>로그인하면 왕도네 부탁해용~</h2>
<br>
<!-- 로그인 창 -->
<form action ="controller.jsp?action=login" method = "post">
	<table border = "2">
		<tr>
			<td>아이디</td>
			<td><input type = "text" name = "mid" placeholder = "너의 아이디를 입력하렴" required ></td>
		</tr>	
		<tr>
			<td>비밀번호</td>
			<td><input type = "password" name = "mpw" placeholder = "너의 비밀번호를 입력하렴" required></td>
		</tr>	
		<tr>
			<td colspan = "2" align = "left">
			<input type = "submit" value = "로그인맨">
		</td>
		</tr>	
	</table>

</form>
<br>
<hr>
<br>
<a href = "sign.jsp">회원가입해라맨이야</a><br><br>
<a href = "controller.jsp?action=main">메인으로 돌아간다맨이야</a>
</body>
</html>