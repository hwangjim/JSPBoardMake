<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "error/error.jsp" import = "java.util.ArrayList,model.vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "mDAO" class = "model.dao.MemberProjectDAO"/>
<jsp:useBean id = "bDAO" class = "model.dao.BoardProjectDAO" />
<jsp:useBean id = "bVO" class = "model.vo.BoardProjectVO" />
<jsp:setProperty property = "*" name = "bVO" />
<jsp:useBean id = "mVO" class = "model.vo.MemberProjectVO" />
<jsp:setProperty property = "*" name = "mVO" />

<%
	String action = request.getParameter("action");
	System.out.println("에잉 로그 나쁜놈 :" + action);
	
	if(action.equals("login")) {
		MemberProjectVO member = mDAO.selectOne(mVO);
		if(member != null) {
			session.setAttribute("member", member);
			response.sendRedirect("controller.jsp?action=main");
		} else {
			response.sendRedirect("login.jsp");
		}
	} else if(action.equals("sign")) {
		if(mDAO.insert(mVO)) {
			response.sendRedirect("login.jsp");
		} else {
			throw new Exception("sign에서 오류가 생겼니?");
		}
	} else if(action.equals("logout")) {
		session.invalidate();
		response.sendRedirect("login.jsp");
	} else if(action.equals("mypage")) {
		// session으로 받아오면 안됨 
		// 이유는 ? 능단평 중 "  "
				// session 안에 정보가 다들어있음 보안에 취약 
				// session 내에는 서버데이터가 많아 무거워짐 -> 속도, 품질저하 
				// 들고다니더라도 flag만, 이름 정도만 들고다님
				// selectOne을 사용하는 이유는 받아와서 데이터만 사용하는것이기 때문에
		MemberProjectVO member = mDAO.selectOne(mVO);
		if(member != null) {
			request.setAttribute("data", member);
			pageContext.forward("mypage.jsp");
		} else {
			throw new Exception("mypage에서 오류가 생겼니?");
		}
	} else if(action.equals("mupdate")) {
		if(mDAO.update(mVO)) {
			session.invalidate();
			response.sendRedirect("login.jsp");
		} else { 
			throw new Exception("mupdate에서 오류가 생겼니?");
		}
	} else if(action.equals("mdelete")) {
		MemberProjectVO member = (MemberProjectVO)session.getAttribute("member");
		if(member != null && mDAO.delete(member)) {
			// session 내 정보들 삭제
			session.invalidate();
			response.sendRedirect("login.jsp");
		} else {
			throw new Exception("mdelete에서 오류가 생겼니?");
		}
	} else if(action.equals("main")) {
		ArrayList<BoardProjectVO> datas = bDAO.selectAll(bVO);
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp");
	} else if(action.equals("board")) {
		// URL상 bid 번호를 다르게 하면 main으로 가게끔
		BoardProjectVO data = bDAO.selectOne(bVO);
		if(data == null) {
			response.sendRedirect("controller.jsp?action=main");
		}
		request.setAttribute("data", data);
		pageContext.forward("board.jsp");
	} else if(action.equals("insert")) {
		if(bDAO.insert(bVO)) {
			response.sendRedirect("controller.jsp?action=main");
		} else {
			throw new Exception("insert에서 오류가 생겼니?");
		}
	} else if(action.equals("update")) {
		if(bDAO.update(bVO)) {
			response.sendRedirect("controller.jsp?action=main");
		} else {
			throw new Exception("update에서 오류가 생겼니?");
		}
	} else if(action.equals("delete")) {
		if(bDAO.delete(bVO)) {
			response.sendRedirect("controller.jsp?action=main");
		} else {
			throw new Exception("delete에서 오류가 생겼니?");
		}
	} else {
		out.println("<script>alert('action 파라미터 값이 올바르지 않단다. 알겠니?');location.href='controller.jsp?action=main'</script>");
	}
%>













