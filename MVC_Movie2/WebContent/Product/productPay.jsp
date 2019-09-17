<%@page import="vo.MemberBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("article");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="orderPro.sh" method="post" name="orderForm">
		<table border="1">
			<tr>
				<th width="100">상품이미지</th>
				<th width="400">상품명</th>
				<th width="100">수량</th>
				<th width="100">적립금</th>
				<th width="100">가격</th>
			</tr>

			<tr>
				<td align="center">상품이미지</td>
				<td align="center"><%=itemBean.getItem_title()%></td>
				<td align="center">불러오기</td>
				<td align="center"><%=itemBean.getItem_old_price() * 0.01%></td>
				<td align="center"><%=itemBean.getItem_old_price()%></td>
			</tr>
		</table>

		<br> <br>

		<table border="1">
			<tr>
				<th align="left" width="400" colspan="2">주문자 정보</th>
			</tr>

			<tr>
				<th width="100" align="center">이름</th>
				<td align="center"><%=memberBean.getMember_name()%></td>
			</tr>
			<tr>
				<th width="100" align="center">이메일</th>
				<td align="center"><%=memberBean.getMember_email()%></td>
			</tr>
			<tr>
				<th width="100" align="center">연락처</th>
				<td align="center"><%=memberBean.getMember_phone()%></td>
			</tr>
		</table>

		<br> <br>

		<table border="1">
			<tr>
				<th align="left" width="400" colspan="4">배송지 정보</th>
			</tr>

			<tr>
				<th width="100" align="center">이름</th>
				<td align="center" colspan="3"><%=memberBean.getMember_name()%></td>
			</tr>
			<tr>
				<th width="100" align="center">연락처1</th>
				<td align="center"><%=memberBean.getMember_phone()%></td>
				<th width="100" align="center">비상연락망</th>
				<td align="center">불러오기</td>
			</tr>
			<tr>
				<th width="100" align="center">배송지 선택</th>
				<td align="center" colspan="3">주소 선택</td>
			</tr>
			<tr>
				<th width="100" align="center">배송지</th>
				<td align="center" colspan="3"><%=memberBean.getMember_address1()%></td>
			</tr>

			<tr>
				<th width="100" align="center">무통장 입금자명</th>
				<td align="center" colspan="3"><input type="text">(주문자와
					동일시 생략)</td>
			</tr>
		</table>
		<br> <br>

		<table border="1">
			<tr>
				<th align="left" width="600" colspan="6">주문결제내역</th>
			</tr>

			<tr>
				<td align="center">상품금액 상품가격불러오기 + 할인금액 할인금액불러오기 = 총금액 총금액불러오기</td>
			</tr>
			<tr>
				<td align="right" colspan="3"><input type="text">적립금사용<input
					type="checkbox">사용가능금액(<%=memberBean.getMember_mypoint()%>)</td>
			</tr>
		</table>
		<input type="submit" value="상품주문"> 
		<input type="reset" value="취소">
	</form>
</body>
</html>