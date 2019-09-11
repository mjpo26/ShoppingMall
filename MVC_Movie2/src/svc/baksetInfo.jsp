<%@page import="vo.BasketListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.Date"%>
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
	BasketListBean basketListBean =(BasketListBean)request.getAttribute("basketListBean");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<h1>장바구니</h1>
	<table border="1">
		<tr>
			<th colspan="2">상품명</th>
			<td>수량</td>
			<td>상품금액</td>
			<td>할인금액</td>
			<td>할인적용금액</td>
			<td>배송비</td>
			<td>주문</td>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td><%=basketListBean.getBasket_title() %></td>
			<td><input type="text" name="count" size="1"><br> <input
				type="button" value="변경"></td>
			<td>old_price 0원</td>
			<td>sals_price원</td>
			<td>old_price-sals_price원</td>
			<td>pee</td>
			<td><input type="button" value="주문하기"><br>
			<input type="button" value="삭제하기"></td>
		</tr>

	</table>
</body>
</html>