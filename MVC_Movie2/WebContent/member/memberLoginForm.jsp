<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="MemberLoginForm.me">로그인</a>
<a href="MemberJoinForm.me">회원가입</a>
<a href="idSearch.me">아이디찾기</a>
<a href="passSearch.me">패스워드찾기</a><br>
	<h1>로그인</h1>
	<form action="MemberLoginPro.me" method="post" name="loginForm">
		<table>
		<tr><td>아이디 : </td><td><input type="text" name="id"></td>
		<tr><td>패스워드 : </td><td><input type="password" name="password"></td>
		<tr>
			<td><input type="submit" value="로그인"></td>
			<td><input type="button" value="가입" onclick="location.href='MemberJoinForm.me'"></td>
		</tr>
		</table>
	</form>
</body>
</html>