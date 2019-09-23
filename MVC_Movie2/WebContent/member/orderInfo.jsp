<%@page import="vo.MemberBean"%>
<%@page import="vo.OrderListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<OrderListBean> articleList = (ArrayList<OrderListBean>) request.getAttribute("articleList");
 	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
	<h1>주문 내역</h1>
	<table border="1">
		<tr>
			<td>주분번호</td>
			<td>주문일자</td>
			<th>상품명</th>
			<td>색상</td>
			<td>배송상태</td>
			<td>나의포인트</td>
			<td>리뷰작성</td>
			
		</tr>
		<%
			for (int i = 0; i < articleList.size(); i++) {
			    int num=Integer.parseInt(articleList.get(i).getOrder_idx());
		%>
		<tr>
			<td><%=articleList.get(i).getOrder_idx()%></td>
			<td><%=articleList.get(i).getOrder_date()%></td>
			<td><%=articleList.get(i).getOrder_item_title()%></td>
			<td><%=articleList.get(i).getOrder_item_option_color()%></td>
			<td><%=articleList.get(i).getOrder_delivery_status()%></td>
 			<td><%=memberBean.getMember_mypoint()%></td>
			<td><a href="ReviewBoardWriteForm.re?num=<%=num%>">
			<input type="button" value="리뷰달기"></a></td>
		</tr>

		<%
			}
		%>




	</table>
</body>
</html>