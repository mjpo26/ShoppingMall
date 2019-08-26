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
 	function chkEmailDomainSelect(domain) {
 		document.joinForm.email2.value = domain.value;
}
</script>
<body>
<a href = "#">주문내역</a>
<a href = "#">회원정보</a>
<a href = "#">관심상품</a>
<a href = "#">적립금/예치금</a>
<a href = "#">게시물관리</a>
<a href = "#">배송주소록</a><br>
	<h1>회원 가입</h1>
	<table border="1"><tr><td>회원 구분</td><td>일반 회원</td></tr></table>
	<form action="MemberJoinPro.me" method="post" name="joinForm">
		<table>
		
			
			<tr><td>아이디 *</td><td><input type="text" name="id"></td><tr>
			<tr><td>패스워드*</td><td><input type="password" name="passwd"></td><tr>
			<tr><td>패스워드확인*</td><td><input type="password" name="passwd2"></td><tr>
			<tr><td>이름</td><td><input type="text" name="name"></td><tr>
			<tr><td>주소</td><td><input type="text" name="addres"></td><tr>
			<tr><td>휴대전화</td><td><input type="text" name="name"></td><tr>
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
			</tr>
			<tr><td>SMS수신여부</td>
			<td>동의<input type="checkbox" name="chsns"> 비동의<input type="checkbox" name="chsns"></td>
			</tr>
			<tr><td>Email수신여부</td>
			<td>동의<input type="checkbox" name="chemail"> 비동의<input type="checkbox" name="chemail"></td>
			</tr>
			</table>
			<input type="submit" value="수정 확인">
			<input type="reset" value="취소">
	</form>
</body>
</html>















