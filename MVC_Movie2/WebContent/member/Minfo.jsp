<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="vo.MemberBean"%>
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
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="./MemberUpdate.me">회원수정</a> <a href="./BasketInfo.bl">장바구니 조회</a>
<fieldset>
			<legend>회원 정보</legend>
<br>아이디 : <%=memberBean.getMember_id() %>
<br>이름 :	<%=memberBean.getMember_name() %>
<br>우편번호 : <%=memberBean.getMember_postcode1() %>
<br>주소	: <%=memberBean.getMember_address1() %>
<br>상세주소:
<br>휴대폰번호 : <%=memberBean.getMember_phone() %>
<br>이메일 : <%=memberBean.getMember_email() %>
<br><br>

<br>sms 수신여부 : <%=memberBean.getMember_sms_ok() %>  |  email수신여부 : <%=memberBean.getMember_email_ok() %>
</fieldset>
<h2>장바구니 현황</h2>


</body>
</html>