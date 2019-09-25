<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<OrderBean> articleList = (ArrayList<OrderBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
	int delivery1_Count = pageInfo.getDelivery1_Count();
	int delivery2_Count = pageInfo.getDelivery2_Count();
	int delivery3_Count = pageInfo.getDelivery3_Count();
	int delivery4_Count = pageInfo.getDelivery4_Count();

	String[] delivery = {"입금전","배송전","배송중","배송완료"};
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
	
    <script>
    $(document).ready(function() {
        var table = $('#example').DataTable({
            columnDefs: [{
                orderable: true
            
            }]
        });
     
        $('button').click( function() {
            var data = table.$('input, select').serialize();
            alert(
                "The following data would have been submitted to the server: \n\n"+
                data.substr( 0, 120 )+'...'
            );
            return false;
        } );
    } );
	</script>
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

<!-- 게시판 리스트 grid -->

<title>관리자 주문관리</title>
</head>
<body>
	<header> 
	</header>
	
	<form action ="./orderList.ol"  name ="fr1" method="post" onsubmit="return pickNullCheck()" id="frm">
	<table border="1">
		<tr>
			<th colspan='4'>주문관리전체주문목록</th>
		</tr>
		<tr>
			<th>검색어</th>
			<td colspan='3'><select><option>주문번호</select> <input
				type="text" size="12" name="order_idx"></td>
		</tr>

		<tr>
			<th>기간검색</th>
			<td>시작날짜:<input type="text" name="pickStart" id="pickStart"><br>
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
			<td colspan='3'>
			<select name="pay">
				<option value="" selected>--선택--</option>
				<option value="입금대기">입금대기</option>
				<option value="입금완료">입금완료</option>
				<option value="결제완료">결제완료</option>
			</select>
			
	<!-- 	<input type="radio" name="pay" checked="checked" value="">전체 
			<input type="radio" name="pay" value="입금대기">입금대기
			<input type="radio" name="pay" value="입금완료">입금완료 
			<input type="radio" name="pay" value="주문완료">주문완료 -->
			
		</tr>
		<tr>
		
		<tr>
		<th>배송상태</th><td>
		<select name="delivery">
			<option value="" selected>--선택--</option>
			<option value="입금전">입금전</option>
			<option value="배송전">배송전</option>
			<option value="배송중">배송중</option>
			<option value="배송완료">배송완료</option>
		</select>
<!-- 	<input type="radio" name="delivery"  checked="checked" value="">전체
		<input type="radio" name="delivery" value="입금전">입금전
		<input type="radio" name="delivery" value="배송전">배송전
		<input type="radio" name="delivery" value="배송중">배송중
		<input type="radio" name="delivery" value="배송완료">배송완료</td> -->
		
		<tr>
		<th>주문취소</th><td>
		<select name="item_status">
			<option value="" selected>--선택--</option>
			<option value="취소">취소</option>
			<option value="교환">교환</option>
			<option value="반품">반품</option>
			<option value="환불">환불</option>
		</select>
		
<!-- 	<th>주문취소</th><td>
		<input type="radio" name="item_status"  checked="checked" value="">전체
		<input type="radio" name="item_status" value="취소">취소
		<input type="radio" name="item_status" value="교환">교환
		<input type="radio" name="item_status" value="반품">반품
		<input type="radio" name="item_status" value="환불">환불</td> -->
		<tr>
		<th>결제은행</th><td>
		<select name="bank">
			<option value="" selected>--선택--</option>
			<option value="신한은행">신한은행</option>
			<option value="국민은행">국민은행</option>
			<option value="농협은행">농협은행</option>
		</select>
		
		<tr>
<!-- 		<th>결제은행</th><td>
		<input type="radio" name="bank"  checked="checked" value="">전체
		<input type="radio" name="bank" value="신한은행">신한은행
		<input type="radio" name="bank" value="국민은행">국민은행
		<input type="radio" name="bank" value="농협은행">농협은행</td> -->
		
		<tr>
		<th>결제방법</th><td>
		<select name="payment">
			<option value="" selected>--선택--</option>
			<option value="현금">현금</option>
			<option value="포인트">포인트</option>
			<option value="현금+포인트">현금+포인트</option>
		</select>
<!-- 		<th>결제방법</th>
			<td colspan='3'><input type="radio" name="payment"  checked="checked" value="">전체 
			<input type="radio" name="payment" value="현금">현금
			<input type="radio" name="payment" value="포인트">포인트 
			<input type="radio" name="payment" value="현금+포인트">현금+포인트
			</td>
		</tr> -->
	</table>

	<input type="submit" value="검색">

	<input type="reset" value="초기화">
	</form>
	<br>
<table border="1">

		<tr>

			<th colspan='5'>관리자_주문관리_배송관리 (배송상태 당 갯수)</th>

		</tr>

		<tr>
			<th><a href="#" onclick="location.href='./orderList.ol?delivery=<%=delivery[0] %>'">
			입금전</a><br><%=delivery1_Count %> EA
			<th><a href="#" onclick="location.href='./orderList.ol?delivery=<%=delivery[1] %>'">
			배송전</a><br><%=delivery2_Count %> EA
			</th>
			<th><a href="#" onclick="location.href='./orderList.ol?delivery=<%=delivery[2] %>'">
			배송중</a><br><%=delivery3_Count %> EA
			<th><a href="#" onclick="location.href='./orderList.ol?delivery=<%=delivery[3] %>'">
			배송완료</a><br><%=delivery4_Count %> EA
			</th>

		</tr>

	</table>

	<p>
	<div style="height: 200px; width: 900px; float: left;">
		<br> <br>
		<form action ="./orderUpdate.ol" method="post">
		<table id="example" class="display compact" border="1">
		<thead>

			<tr>
				<th><input type="checkbox"></th>
				<th>주문일</th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>결제상태</th>
				<th>결제금액</th>
				<th>배송상태</th>
				<th>주문상태</th>
				<th>결제은행</th>
				<th>결제방법</th>
				<th>메모</th>
				<th>수정</th>
			</tr>
			</thead>
			
			<tbody>
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
				
				<td><select name="order_pay_status">
						<option <% if(articleList.get(i).getOrder_pay_status().equals("입금대기")){%>selected<%} %>>입금대기</option>
						<option <% if(articleList.get(i).getOrder_pay_status().equals("입금완료")){%>selected<%} %>>입금완료</option>
						<option <% if(articleList.get(i).getOrder_pay_status().equals("결제완료")){%>selected<%} %>>결제완료</option>
					</select></td>
				
				<td><%=articleList.get(i).getOrder_item_sel_price()%></td>
				<td><select name="order_delivery_status">
						<option <% if(articleList.get(i).getOrder_delivery_status().equals("입금전")){%>selected<%} %>>입금전</option>
						<option <% if(articleList.get(i).getOrder_delivery_status().equals("배송전")){%>selected<%} %>>배송전</option>
						<option <% if(articleList.get(i).getOrder_delivery_status().equals("배송중")){%>selected<%} %>>배송중</option>
						<option <% if(articleList.get(i).getOrder_delivery_status().equals("배송완료")){%>selected<%} %>>배송완료</option>
					</select></td>
					
				<td><select name="item_status" >
						<option <% if(articleList.get(i).getOrder_item_status().equals("취소")){%>selected<%} %>>취소</option>
						<option <% if(articleList.get(i).getOrder_item_status().equals("교환")){%>selected<%} %>>교환</option>
						<option <% if(articleList.get(i).getOrder_item_status().equals("반품")){%>selected<%} %>>반품</option>
						<option <% if(articleList.get(i).getOrder_item_status().equals("환불")){%>selected<%} %>>환불</option>
						<option <% if(articleList.get(i).getOrder_item_status().equals("완료")){%>selected<%} %>>완료</option>
					</select></td>
					
				<td><select name="bank">
						<option <% if(articleList.get(i).getOrder_bank().equals("신한은행")){%>selected<%} %>>신한은행</option>
						<option <% if(articleList.get(i).getOrder_bank().equals("국민은행")){%>selected<%} %>>국민은행</option>
						<option <% if(articleList.get(i).getOrder_bank().equals("농협은행")){%>selected<%} %>>농협은행</option>
					</select></td>
				
				<td><select name="payment">
					<option <% if(articleList.get(i).getOrder_payment().equals("현금")){%>selected<%} %>>현금</option>
					<option <% if(articleList.get(i).getOrder_payment().equals("포인트")){%>selected<%} %>>포인트</option>
					<option <% if(articleList.get(i).getOrder_payment().equals("현금+포인트")){%>selected<%} %>>현금+포인트</option>
				</select></td>
							
				<td><%=articleList.get(i).getOrder_memo()%></td>
				<th>
				<input type="hidden" name="order_idx" value="<%=articleList.get(i).getOrder_idx()%>">
				<input type="submit" value="수정" formaction="./orderUpdate.ol">
				</th>
			</tr>
			<%
				}
			%>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		</form>
	</div>
</body>
</html>