<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardProjectVO,java.util.ArrayList" %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="member" class="model.vo.MemberProjectVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>메인페이지</title>
</head>
<body>
<script type="text/javascript">
	// 마이페이지로 접근을 위한 비밀번호 검증 단계
	function checkmypage(){
		checkans = prompt('비밀번호를 입력하렴 알겠니?');
		if(checkans == "${member.mpw}"){
			document.getElementById('mypagechange').submit();
            // 선택자로 info를 선택한 다음form 자체를 submit으로 실행
            // --- 사용한 이유
            // 데이터를 post방식으로 보내주기 위해

			//location.href="controller.jsp?action=mypage";
		} else {
			alert('얘 그게 맞니? 틀렸단다!');
			return;
		}
	}
</script>
<!-- 비 로그인시 새 글을 작성할 수 없고, 로그인, 회원가입 창만 보여짐 -->
<%
	// 만약 id가 없는 즉, 비 로그인 상태라면
	if(member.getMid() == null) {
%>
	<!-- 비 로그인 상태시 브라우저화면에 뜨게될 문구와 버튼 -->
<h1>비로그인이니? 불쌍맨이니?</h1>
<a href = "controller.jsp?action=login">로그인</a>
<a href = "sign.jsp">회원가입</a><br><br>
<%
	// 로그인 상태라면
	} else {
%>
<!-- post방식으로 정보를 저장, 받아온다. -->
<form id="mypagechange" action="controller.jsp" method="post">
<!-- 마이페이지일시 hidden으로 -->
<input type="hidden" name="action" value="mypage">
<input type="hidden" name="mid" value="${member.mid}">
<input type="hidden" name="mpw" value="${member.mpw}">
</form>
<h1>자~ 우리&nbsp;<a href="javascript:checkmypage()">${member.mname}</a>&nbsp;&nbsp;시청자 나부랭탱이가 왔네?&nbsp;&nbsp;
<br>반갑다맨이야~ 구독 좋아요 왕감사맨~</h1>
<a href="controller.jsp?action=logout">로그아웃</a> <br><br>
<%
	}
%>

<table border="2" >
	<tr>
		<th>번 호</th><th>제 목</th><th>작성자</th>
	</tr>
<%
	for(BoardProjectVO v:(ArrayList<BoardProjectVO>)datas){
%>
	<tr>
		<th><a href="controller.jsp?action=board&bid=<%=v.getBid()%>"><%=v.getBid()%></a></th>
		<td><%=v.getTitle()%></td>
		<td><%=v.getWriter()%></td>
	</tr>
<%
	}
	
%>
</table>
<br>
<hr>
<!-- 비로그인시 문구출력 -->
<%
	if(member.getMid() == null) {
%>
<h2>얘 회원만 게시글을 볼 수 있단다 불쌍맨이니?</h2>
<h3>회원가입을 하든가 로그인을 하든가 하렴 알겠니? </h3>
<%
	} else {
%>
<!-- 로그인시 게시판에 새 글을 작성할수 있게끔 -->
<a href="form.jsp">새 글 작성</a>
<%
	}
%>

</body>
</html>