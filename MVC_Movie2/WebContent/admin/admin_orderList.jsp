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
</head>
<body>
	<header> </header>
	
	<form action ="./orderList.ol"  name ="fr" method="post">
	
	<table border="1">
		<tr>
			<th colspan='4'>주문관리전체주문목록</th>
		</tr>

		<tr>
			<th>검색어</th>
			<td colspan='3'><select><option>주문번호</select> <input
				type="text" size="12" name="ItemCode"></td>
		</tr>

		<tr>
			<th>기간검색</th>
			<td colspan="4"><select name="search">
					<option>오늘
					<option>7일
					<option>15일
					<option>1개월
			</select> 날짜선택 <input type="date" value="2019-08-23"></td>
		</tr>

		<tr>
			<th>상품 검색</th>
			<td colspan='3'><label>상품명</label>
					<input type="text" size="20" name="ItemName"><br>
			<label>주문자</label>
					<input type="text" size="20" name="Buyer">
					
		</tr>

		<tr>
			<th>결제상태</th>
			<td colspan='3'><input type="radio" name="pay" value="*">전체 
			<input type="radio" name="pay" value="입금대기">입금대기
			<input type="radio" name="pay" value="입금완료">입금완료 
			<input type="radio" name="pay" value="주문완료">주문완료
		</tr>


		<tr>
			<th>결제방법</th>
			<td colspan='3'><input type="radio" name="payment" value="*">전체 
			<input type="radio" name="payment" value="현금">현금
			<input type="radio" name="payment" value="포인트">포인트 
			<input type="radio" name="payment" value="현금+포인트">현금+포인트
			</td>
		</tr>
	</table>

	<input type="submit" value="검색">

	<input type="reset" value="초기화">
	</form>
	<br>
	<br>

	<br>
	<br>
	<p>
	<div style="height: 200px; width: 900px; float: left;">
		<br> <br>
		<table border="1">

			<tr>
				<th colspan='14'>검색결과 리스트 출력</th>
			</tr>

			<tr>
				<td colspan='14'>[검색결과 <%=listCount%>건]&nbsp;

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
				<th>상품색깔</th>
				<th>상품명</th>
				<th>결제상태</th>
				<th>결제방법</th>
				<th>메모</th>
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
			%>
			<tr>
				<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
				<th><input type="checkbox"></th>
				<td><%=articleList.get(i).getOrder_date()%></td>
				<td><%=articleList.get(i).getOrder_idx()%></td>
				<td><%=articleList.get(i).getOrder_member_id()%></td>
				<td><%=articleList.get(i).getOrder_item_option_color() %></td>
				<td><%=articleList.get(i).getOrder_item_title()%></td>
				<td><%=articleList.get(i).getOrder_pay_status()%></td>
				<td><%=articleList.get(i).getOrder_payment()%></td>
				<td><%=articleList.get(i).getOrder_memo()%></td>
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
	</div>
</body>
</html>