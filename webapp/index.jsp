<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	pageContext.forward("controller.jsp?action=main");
%>
<!-- 	1. 개발환경 설명
			: Oracle / JDK 11 버전 / Tomcat 9.0 사용
			
		2. 에러 페이지 : error.jsp			
			
	 	3. 표지 페이지 = index.jsp
			
		4. 	M : BoardProjectVO, DAO / MemberProjectVO, DAO
			V : Controller.jsp를 제외한 모든 jsp파일
			C : Controller.jsp
		5. request.setCharacterEncoding으로 처리 
		
		6. 자바빈즈 활용 : 각 VO, DAO
	 	 -->