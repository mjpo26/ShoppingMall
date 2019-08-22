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
<script type="text/javascript">
	// 주민번호 입력 숫자 갯수 체크
	function chkJumin(jumin, type) {
		if(type == 1) {
			if(jumin.value.length == 6) {
				document.joinForm.jumin2.focus();
			}
		} else {
			if(jumin.value.length == 7) {
				document.joinForm.email1.focus();
			}
		}
	}

	// E-Mail 도메인 선택
	function chkEmailDomainSelect(domain) {
		document.joinForm.email2.value = domain.value;
	}
</script>
<body>
	<h1>회원 가입</h1>
	<form action="MemberJoinPro.me" method="post" name="joinForm">
		<table>
			<tr><td>이름</td><td><input type="text" name="name" required="required"></td><tr>
			<tr><td>아이디</td><td><input type="text" name="id"></td><tr>
			<tr><td>패스워드</td><td><input type="password" name="passwd"></td><tr>
			<tr>
				<td>성별</td>
					<td>
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
					</td>
				<tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" size="6" onkeyup="chkJumin(this, 1)">&nbsp;-&nbsp;
					<input type="password" name="jumin2" size="6" onkeyup="chkJumin(this, 2)">
				</td>
			<tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" size="6">&nbsp;@&nbsp;<input type="text" name="email2" size="6">
					<select onchange="chkEmailDomainSelect(this)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="itwillbs.co.kr">itwillbs.co.kr</option>				
					</select>
				</td>
			<tr>
			<tr><td>전화번호</td><td><input type="text" name="phone"></td><tr>
			<tr>
				<td><input type="submit" value="회원가입"></td>
				<td><input type="button" value="취소" onclick="history.back()"></td>
		</table>
	</form>
</body>
</html>















