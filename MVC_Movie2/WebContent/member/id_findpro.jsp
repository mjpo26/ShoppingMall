<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberBean memberBean =(MemberBean)request.getAttribute("memberBean");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	성공적으로 아이디를 찾았습니다<br>
	아이디는 <%=memberBean.getMember_id() %><br>
	
	<input type="button" value="로그인 이동" onclick="location.href='./MemberLoginForm.me'">
	
	
	
</body>
</html>