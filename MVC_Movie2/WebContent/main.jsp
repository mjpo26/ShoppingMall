<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 저장된 세션 아이디 가져오기
	String sId = (String)session.getAttribute("sId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header>
		<p align="right">
		<%if(sId != null) { %>
			<%=sId %>님 |<a href="LogoutPro.me"> 로그아웃</a> 
		<%} else { %>	
			<a href="LoginForm.me">로그인</a> 
		<%} %>
		</p>
	</header>
	
	<h1>메인 페이지</h1>
	<a href="BoardWriteForm.qb"><input type="button" value="글 등록"></a> 
	<a href="BoardList.qb"><input type="button" value="게시판"></a> 
</body>
</html>