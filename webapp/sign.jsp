<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입 하러왔니?</title>
</head>
<body>
<h1>자 ~ 회원가입 를! 할거에요</h1>
<form action="controller.jsp?action=sign" method = "post">
	<table border = "2">
		<tr>
			<td>아이디</td>
			<td><input type = "text" name = "mid" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type = "password" name = "mpw" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type = "text" name = "mname" required></td>
		</tr>
		<tr>
			<td>계정 권한 정도</td>
			<td>
				<select name = "act">
					<option selected>MEMBER</option>
					<option>ADMIN</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "left">
				<input type = "submit" value = "회원가입">
			</td>	
		</tr>
	</table>
</form>
<hr>
<a href = "login.jsp">뒤로 돌아가기</a>
</body>
</html>