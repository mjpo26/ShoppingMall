<%@page import="vo.MemberBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String) session.getAttribute("sId");
	int item_code_count = Integer.parseInt((String) request.getAttribute("item_code_count"));
	int itemCode = itemBean.getItem_code();

	String item_color = (String) request.getAttribute("item_color");
	// 	itemBean.setItem_color(Item_color);
%>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#checkBoxId").change(function() {
			if ($("#checkBoxId").is(":checked")) {
				alert("체크");
			} else {
				alert("체크 해제");
			}
		});
	});
</script>

<jsp:include page="../assets/top.jsp"></jsp:include>


<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>장바구니</h2>
						<p>
							장바구니 <span>-</span>장바구니 현황
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->
<!--================End Home Banner Area =================-->
<form action="orderPro.sh" method="post" name="orderForm">
	<section class="cart_list shopping_cart mt-5">
		<div class="container">
			<div class="row clearfix">

				<!-- <form action="orderPro.sh" method="post" name="orderForm"> -->
				<input type="hidden" name="itemCode" value=<%=itemCode%>> <input
					type="hidden" name="item_code_count" value=<%=item_code_count%>>
				<input type="hidden" name="itemCode" value=<%=itemCode%>> <input
					type="hidden" name="item_code_count" value=<%=item_code_count%>>
				<input type="hidden" name="item_color" value=<%=item_color%>>
				<input type="hidden" name="order_item_sel_price"
					value=<%=itemBean.getItem_sel_price()%>> <input
					type="hidden" name="item_point"
					value=<%=itemBean.getItem_point() * item_code_count%>>
				<table class="table">
					<tr>
						<th align="left" width="800" colspan="6"><span
							style="color: red; font-weight: bold;">상품 정보</span></th>
					</tr>
					<tr>
						<th width="200" align="center">상품이미지</th>
						<td width="200" align="center" colspan="2">상품이미지</td>
						<th width="200" align="center">상품명</th>
						<td width="200" align="center" colspan="2"><%=itemBean.getItem_title()%></td>
					</tr>

					<tr>
						<th width="200" align="center">수량</th>
						<td width="200" align="center" colspan="2"><%=item_code_count%></td>
						<th width="200" align="center">색상</th>
						<td width="200" align="center" colspan="2"><%=item_color%></td>

					</tr>
					<tr>
						<th width="200" align="center">적립금</th>
						<td width="200" align="center" colspan="2"><%=itemBean.getItem_point() * item_code_count%></td>
						<th width="200" align="center">가격</th>
						<td width="200" align="center" colspan="2"><%=itemBean.getItem_sel_price() * item_code_count%></td>

					</tr>
					<tr>
						<th align="left" width="800" colspan="6"><span
							style="color: red; font-weight: bold;">주문자 정보</span></th>
					</tr>
					<tr>
						<th width="200" align="center">이름</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_name()%></td>
						<th width="200" align="center">이메일</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_email()%></td>
					</tr>
					<tr>
						<th width="200" align="center">연락처</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_phone()%></td>
						<th width="200" align="center">배송지 정보</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_address1()%></td>
					</tr>
					<tr>
						<th width="200" align="center">무통장 은행</th>
						<td width="200" align="center" colspan="2"><select
							name="order_bank">
								<option value="신한은행">신한은행</option>
								<option value="국민은행">국민은행</option>
								<option value="농협은행">농협은행</option>
						</select>
						<th width="200" align="center">무통장 입금자명</th>
						<td width="200" align="center" colspan="2"><input type="text"
							value="<%=memberBean.getMember_name()%>"></td>
					</tr>
					<tr>
						<th width="200" align="center">배송문의</th>
						<td width="400" colspan="5"><textarea name="order_memo"
								rows="5" cols="40"></textarea>
					<tr>
						<th align="left" width="600" colspan="6"><span
							style="color: red; font-weight: bold;">주문결제내역 </span></th>
					</tr>

					<tr>
						<td align="left" width="600" colspan="6"><span
							style="font-weight: bold;">상품금액</span>: <%=itemBean.getItem_old_price() * item_code_count%>
							- <span style="font-weight: bold;">할인금액</span>: <%=itemBean.getItem_old_price() * item_code_count - itemBean.getItem_sel_price() * item_code_count%>
							= <span style="font-weight: bold;">총금액</span>: <%=itemBean.getItem_sel_price() * item_code_count%>
						</td>
					</tr>
					<tr>
						<td align="right" colspan="6"><input type="text"
							id="usedPoint" name="usedPoint">적립금사용 <input
							type="checkbox" id="checkBoxId" name="checkBoxId"
							onclick="usedpoint()">사용가능금액(<%=memberBean.getMember_mypoint()%>)</td>
					</tr>
				</table>
				<input type="submit" class="btn_3" value="상품주문"> <input
					type="reset" class="btn_3" value="취 소">
			</div>
		</div>
	</section>

</form>

<jsp:include page="../assets/foot.jsp"></jsp:include>
