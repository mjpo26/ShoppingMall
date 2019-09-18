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
<!-- 날짜선택 임포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 날짜선택임포트 끝 -->

<!-- 날짜선택 스크립트 -->
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>

<script type = "text/javascript">
function pickNullCheck(){
	if(document.fr1.pickStart.value==""){
//		document.fr1.pickStart.value=="2015-01-01";
		var pickStart = $('#pickStart').val('01/01/2010');

		return false;
	}
	if(document.fr1.pickEnd.value==""){
 	//	document.fr1.pickEnd.value=="2020-01-01";
		var pickEnd =  $('#pickEnd').val('01/01/2020');
	
		return false;
	}
	
	//
	
	
}

</script>
<!-- 날짜선택 스크립트 끝 -->


<title>관리자 주문관리</title>
</head>
<body>
	<header> 
	</header>
	
	<form action ="./orderList.ol"  name ="fr1" method="post" onsubmit="return pickNullCheck()">
	
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
			<td>시작날짜:<input type="text" name="pickStart" id="pickStart">
				끝 날짜:<input type="text" name="pickEnd" id="pickEnd"></td>
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
			<td colspan='3'><input type="radio" name="pay" checked="checked" value="">전체 
			<input type="radio" name="pay" value="입금대기">입금대기
			<input type="radio" name="pay" value="입금완료">입금완료 
			<input type="radio" name="pay" value="주문완료">주문완료
		</tr>
		<tr>
		
		<tr>
		<th>결제은행</th><td>
		<input type="radio" name="delivery"  checked="checked" value="">전체
		<input type="radio" name="delivery" value="배송전">배송전
		<input type="radio" name="delivery" value="배송중">배송중
		<input type="radio" name="delivery" value="배송완료">배송완료</td>
		
		<tr>
		<th>결제은행</th><td>
		<input type="radio" name="bank"  checked="checked" value="">전체
		<input type="radio" name="bank" value="신한은행">신한은행
		<input type="radio" name="bank" value="국민은행">국민은행
		<input type="radio" name="bank" value="농협은행">농협은행</td>
		
		<tr>
			<th>결제방법</th>
			<td colspan='3'><input type="radio" name="payment"  checked="checked" value="">전체 
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
<table border="1">

		<tr>

			<th colspan='5'>관리자_주문관리_배송관리</th>

		</tr>

		<tr>
			<th>배송전<br>//db 배송대기수량 작성
			</th>
			<th>배송중<br>//db 배송중인수량 작성
			<th>배송완료<br>//db 배송완료수량 작성
			</th>

		</tr>

	</table>

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
				<th>주문일</th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>결제상태</th>
				<th>결제금액</th>
				<th>배송상태</th>
				<th>결제은행</th>
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
				<td><%=articleList.get(i).getOrder_item_title()%></td>
				<td><%=articleList.get(i).getOrder_pay_status()%></td>
				<td><%=articleList.get(i).getOrder_item_sel_price()%></td>
				<td><%=articleList.get(i).getOrder_delivery_status()%></td>
		  		<td><%=articleList.get(i).getOrder_bank() %></td> 
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