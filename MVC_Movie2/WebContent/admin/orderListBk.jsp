<%@page import="vo.OrderListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<OrderListBean> articleList = (ArrayList<OrderListBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">

		<tr>
			<th colspan='14'>검색결과 리스트 출력</th>
		</tr>

		<tr>
			<td colspan='14'>[검색결과 0건]&nbsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp; <select><option>등록일
					<option>오름차순
					<option>내림차순</select><select>
					<option>10개
					<option>20개
					<option>50개
			</select> <input type="button" value="검색">
			</td>
		</tr>

		<tr>
			<th><input type="checkbox"></th>
			<th>주문일(결제일)</th>
			<th>주문번호</th>
			<th>주문자</th>
			<th>상품명</th>
			<th>주문상태</th>
			<th>배송상태</th>
			<th>결제상태</th>
			<th>메모</th>
		</tr>
		<%
				for (int i = 0; i < articleList.size(); i++) {
		%>
		<tr>
			<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
			<th><input type="checkbox"></th>
			<th><%=articleList.get(i).getOrder_date()%></th>
			<th><%=articleList.get(i).getOrder_idx()%></th>
			<th><%=articleList.get(i).getOrder_member_id()%></th>
			<th><%=articleList.get(i).getOrder_item_title() %></th>
			<th><%=articleList.get(i).getOrder_pay_status()%></th>
			<th><%=articleList.get(i).getOrder_delivery_status()%></th>
			<th><%=articleList.get(i).getOrder_payment()%></th>
			<th><%=articleList.get(i).getOrder_memo() %></th>
		</tr>
		<%
				}
			%>
	</table>


	<section id="pageList">
		<%
			if (nowPage <= 1) {
		%>
		[이전]&nbsp;
		<%
			} else {
		%>
		<a href="orderList.ol?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
		<%
			}
		%>

		<%
			for (int i = startPage; i <= endPage; i++) {
					if (i == nowPage) {
		%>
		[<%=i%>]
		<%
			} else {
		%>
		<a href="orderList.ol?page=<%=i%>">[<%=i%>]
		</a>&nbsp;
		<%
			}
		%>
		<%
			}
		%>

		<%
			if (nowPage >= maxPage) {
		%>
		&nbsp;[다음]
		<%
			} else {
		%>
		<a href="orderList.ol?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
		<%
			}
		%>
	</section>
</body>
</html>