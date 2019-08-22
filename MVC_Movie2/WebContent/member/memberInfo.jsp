<%@page import="java.util.Date"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
	String sId = (String)session.getAttribute("sId");
	if(sId == null) {
	    out.println("<script>");
	    out.println("alert('잘못된 접근입니다!')");
	    out.println("location.href='index.jsp'");
	    out.println("</script>");
	}
	
	// request 객체의 MemberBean 가져오기
	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	
	// 주민번호 분리(앞자리 = 0번 배열, 뒷자리 = 1번 배열)
	String jumin1 = memberBean.getMember_jumin().split("-")[0];
	String jumin2 = memberBean.getMember_jumin().split("-")[1];
	
	// E-Mail 분리(계정 = 0번 배열, 도메인 = 1번 배열)
	String email1 = memberBean.getMember_email().split("@")[0];
	String email2 = memberBean.getMember_email().split("@")[1];
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function changeEditMode() {
		// Input 태그의 readonly 속성을 false 로 변경하면 편집이 가능
		document.infoForm.name.readOnly = false;
	}
</script>
</head>
<body>
	<h1>회원 정보</h1>
	<form action="MemberJoinPro.me" method="post" name="infoForm">
		<table>
			<tr><td>이름</td><td><input type="text" name="name" required="required" readonly="readonly" value="<%=memberBean.getMember_name()%>"></td><tr>
			<tr><td>아이디</td><td><input type="text" name="id" value=<%=memberBean.getMember_id() %>></td><tr>
			<tr>
				<td>성별</td>
					<td>
						<input type="radio" name="gender" <%if(memberBean.getMember_gender().equals("남")) {%>checked="checked"<%} %>>남
						<input type="radio" name="gender" <%if(memberBean.getMember_gender().equals("여")) {%>checked="checked"<%} %>>여
					</td>
				<tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" size="6" onkeyup="chkJumin(this, 1)" value=<%=jumin1 %>>&nbsp;-&nbsp;
					<input type="password" name="jumin2" size="6" onkeyup="chkJumin(this, 2)"value=<%=jumin2 %>>
				</td>
			<tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" size="6" value=<%=email1 %>>&nbsp;@&nbsp;<input type="text" name="email2" size="6" value=<%=email2 %>>
					<select onchange="chkEmailDomainSelect(this)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="itwillbs.co.kr">itwillbs.co.kr</option>				
					</select>
				</td>
			<tr>
			<tr><td>전화번호</td><td><input type="text" name="phone" value=<%=memberBean.getMember_phone() %>></td><tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원수정">
					<input type="button" value="수정모드전환" onclick="changeEditMode()">
					<input type="button" value="취소" onclick="history.back()">
					<input type="button" value="예매내역확인" onclick="location.href='MemberReservationInfo.me'">
				</td>
		</table>
	</form>
</body>
</html>












