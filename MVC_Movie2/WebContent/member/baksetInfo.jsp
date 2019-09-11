<%@page import="vo.BasketListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
    	ArrayList<BasketListBean> articleList = (ArrayList<BasketListBean>)request.getAttribute("articleList");
	
	
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
			<%for(int i = 0; i < articleList.size(); i++) {%>
					<tr>
					<td><input type="checkbox"></td>
					
					<td><%=articleList.get(i).getBasket_title() %></td>
					<td><%=articleList.get(i).getBasket_code_count() %></td>
					<td><%=articleList.get(i).getBasket_new_price() %></td>
					<td><%=articleList.get(i).getBasket_sel_price() %></td>
					<td><%=articleList.get(i).getBasket_new_price()-articleList.get(i).getBasket_sel_price() %> </td>
					<td><%=articleList.get(i).getBasket_delivery_pee() %>원</td>
					<td><input type="button" value="주문하기"><br>
					<input type="button" value="삭제하기"></td>
					</tr>
					
			<%} %>


			
			
	</table>
</body>
</html>