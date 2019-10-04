<%@page import="vo.ItemBean"%>
<%@page import="vo.BasketListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<BasketListBean> articleList = (ArrayList<BasketListBean>) request.getAttribute("articleList");

	// 	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
%>
<script type="text/javascript">
    
// function check() {
//	var item_code_count = document.BasketForm.item_code_count.value;
// 	alert(item_code_count);
<%-- 	var stock_count = <%=itemBean.getItem_stock_count()%>; --%>
//     if (stock_count==0) {
//         alert('제품이 품절되었습니다.');
//         location.href='./BasketDelete.bl';       
//         history.back();
//         return false;
//     }
//     else {
//     	if(stock_count<item_code_count){
//     		alert('제품이 '+stock_count+'개 남았습니다. 재주문해주세요.');
//     		location.href='./BasketDelete.bl';       
//             history.back();
//     		return false;
//     	}
//     	else{
    		
//     	return true;
//     	}
//     }
// }
</script>
<jsp:include page="../main/top.jsp"></jsp:include>


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

<section class="cart_list shopping_cart mt-5">
	<div class="container">
		<div class="row clearfix">


			<table class="table">
				<tr>
					<th></th>
					<th>상품명</th>
					<th>수량</th>
					<th>상품금액</th>
					<th>할인금액</th>
					<th>할인적용금액</th>
					<th>배송비</th>
					<th>주문</th>
				</tr>
				<%
					for (int i = 0; i < articleList.size(); i++) {
				%>
				<!-- 							<form method="get" name="BasketForm" onsubmit="return check()"> -->
				<tr>
					<td><input type="checkbox" name="cb"
						value="<%=articleList.get(i).getBasket_code()%>"> <input
						type="hidden" name="bId"
						value="<%=articleList.get(i).getBasket_idx()%>"> <input
						type="hidden" id="item_code_count" name="item_code_count"
						value="<%=articleList.get(i).getBasket_code_count()%>"></td>
					<td><%=articleList.get(i).getBasket_title()%></td>
					<td><%=articleList.get(i).getBasket_code_count()%></td>
					<td><fmt:formatNumber
							value="<%=articleList.get(i).getBasket_new_price()%>"
							pattern="#,###" />원</td>
					<td><fmt:formatNumber
							value="<%=articleList.get(i).getBasket_sel_price()%>"
							pattern="#,###" />원</td>
					<td><fmt:formatNumber
							value="<%=articleList.get(i).getBasket_new_price() - articleList.get(i).getBasket_sel_price()%>"
							pattern="#,###" />원</td>
					<td><fmt:formatNumber
							value="<%=articleList.get(i).getBasket_delivery_pee()%>"
							pattern="#,###" />원</td>

					<!-- 							<td><input type="submit" value="장바구니 담기" formaction="./selectorder.sh"><br> -->
					<!-- 							<input type="submit" value="장바구니 담기" formaction="./BasketDelete.bl"><td> -->
					<td>
<!-- 						<div class="col-xs-12 col-sm-6 mx-auto row"> -->
							<input type="button"
								class="genric-btn primary radius submit" value="주문하기"
								onclick="location.href='./selectorder.sh?bId=<%=articleList.get(i).getBasket_idx()%>'">
							<br> <input type="button"
								class="genric-btn default radius" value="삭제하기"
								onclick="location.href='./BasketDelete.bl?bId=<%=articleList.get(i).getBasket_idx()%>'">
<%-- 						</div> <!-- 					<input type="button" value="주문하기" --> 						onclick="location.href='./selectorder.sh?bId=<%=articleList.get(i).getBasket_idx()%>'"><br> --%>
						<!-- 						<input type="button" value="삭제하기" --> <%-- 						onclick="location.href='./BasketDelete.bl?bId=<%=articleList.get(i).getBasket_idx()%>'"> --%>
					</td>
				</tr>
<!-- 				</form> -->
				<%
					}
				%>

			</table>
		</div>
	</div>
</section>



<jsp:include page="../main/foot.jsp"></jsp:include>
