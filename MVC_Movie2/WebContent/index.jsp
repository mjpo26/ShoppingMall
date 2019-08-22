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
		<!-- 세션 아이디가 있을 경우 로그아웃 링크(Logout.me) 표시, 없을 경우 로그인 링크(LoginForm.me) 표시 -->
		<p align="right">
		<%if(sId != null) { %>
			<a href="MemberInfo.me"><%=sId %>님</a> | <a href="MemberLogoutPro.me">로그아웃</a> 
		<%} else { %>	
			<a href="MemberLoginForm.me">로그인</a> 
		<%} %>
		</p>
	</header>
	<h1>영화관 정보</h1>
	<h3><a href="MovieList.mo">영화목록</a></h3>
</body>
</html>















