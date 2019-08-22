<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 세션에 저장된 id 값이 있을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
	String sId = (String)session.getAttribute("sId");
	if(sId != null) {
	    out.println("<script>");
	    out.println("alert('잘못된 접근입니다!')");
	    out.println("location.href='index.jsp'");
	    out.println("</script>");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="MemberLoginPro.me" method="post" name="loginForm">
		<table>
		<tr><td>아이디 : </td><td><input type="text" name="id"></td>
		<tr><td>패스워드 : </td><td><input type="password" name="password"></td>
		<tr>
			<td><input type="submit" value="로그인"></td>
			<td><input type="button" value="회원가입" onclick="location.href='MemberJoinForm.me'"></td>
		</tr>
		</table>
	</form>
</body>
</html>















