<%@page import="vo.MemberBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<OrderBean> articleList = (ArrayList<OrderBean>) request.getAttribute("articleList");
%>

<jsp:include page="../assets/top.jsp"></jsp:include>


<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>주문내역</h2>
						<p>
							주문내역 <span>-</span>주문내역 현황
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->
<!--================End Home Banner Area =================-->

<section class="cart_list shopping_cart mt-5">
	<div class="container">
		<div class="row clearfix">


			<table class="table">
				<tr>
					<td>주문번호</td>
					<td>상품번호</td>
					<td>상품명</td>
					<td>주문일자</td>
					<td>상품명</td>
					<td>색상</td>
					<td>배송상태</td>
					<td>리뷰작성</td>

				</tr>
				<%
					for (int i = 0; i < articleList.size(); i++) {
						int num = articleList.get(i).getOrder_idx();
						String status = articleList.get(i).getOrder_delivery_status();
				%>
<%-- 				<a href="productDetail.sh?Item_code=<%=articleList.get(i).getOrder_item_code()%>&page=1"> --%>
				<tr>
					<td><%=articleList.get(i).getOrder_idx()%></td>
					<td><%=articleList.get(i).getOrder_item_code()%></td>
					<td><%=articleList.get(i).getOrder_item_title()%></td>
					<td><%=articleList.get(i).getOrder_date()%></td>
					<td><%=articleList.get(i).getOrder_item_title()%></td>
					<td><%=articleList.get(i).getOrder_item_option_color()%></td>
					<td><%=articleList.get(i).getOrder_delivery_status()%></td>
					<%
						if (status.equals("배송완료")) {
					%>
					<td><a
						href="ReviewBoardWriteForm.re?order_item_code=<%=articleList.get(i).getOrder_item_code()%>">
							<input type="button" value="리뷰달기">
					</a></td>

					<%
						} else {
					%>
					<td></td>
					<%
						}
					%>
				</tr>
				<%
					}
				%>

			</table>
		</div>
	</div>
</section>



<jsp:include page="../assets/foot.jsp"></jsp:include>