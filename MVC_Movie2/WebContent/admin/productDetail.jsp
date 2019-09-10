<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
%>
<jsp:include page="../assets/top.jsp"></jsp:include>

<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>제품 상세 페이지</h2>
						<p>
							제품 상세 페이지 <span>-</span><%=itemBean.getItem_title()%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb start-->
<!--================End Home Banner Area =================-->


<!--================Single Product Area =================-->


<form method="post">
	<input type="hidden" name="Item_code"
		value=<%=itemBean.getItem_code()%>> <input type="hidden"
		name="Item_delivery_pee" value=<%=itemBean.getItem_delivery_pee()%>>
	<input type="hidden" name="Item_stock_count"
		value=<%=itemBean.getItem_stock_count()%>> <input
		type="hidden" name="Item_title" value=<%=itemBean.getItem_title()%>>
	<input type="hidden" name="Item_sel_price"
		value=<%=itemBean.getItem_sel_price()%>> <input type="hidden"
		name="Item_point" value=<%=itemBean.getItem_point()%>>
	<div class="product_image_area section_padding">
		<div class="container">
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img">
						<div id="vertical">
							<div
								data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic1()%>">
								<img
									src="./assets/img/product/single-product/<%=itemBean.getItem_pic1()%>" />
							</div>
							<div
								data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic2()%>">
								<img
									src="./assets/img/product/single-product/<%=itemBean.getItem_pic2()%>" />
							</div>
							<div
								data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic3()%>">
								<img
									src="./assets/img/product/single-product/<%=itemBean.getItem_pic3()%>" />
							</div>
							<div
								data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic4()%>">
								<img
									src="./assets/img/product/single-product/<%=itemBean.getItem_pic4()%>" />

							</div>
						</div>
					</div>
				</div>



				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">
						<div class="item_head">
							<h5>
								아이콘 <span>|</span> 아이콘
							</h5>
							<div class="admin_btn">
							<input type="button" value="수정" class="genric-btn primary-border small"
								onclick="location.href='./update.sh?Item_code=<%=itemBean.getItem_code()%>'">
							<input type="button" value="삭제" class="genric-btn primary-border small"
								onclick="location.href='./delete.sh?Item_code=<%=itemBean.getItem_code()%>'">
							</div>
						</div>
						<div class="item-info">
							<h3><%=itemBean.getItem_title()%></h3>
							<h5 class="oneprice"><%=itemBean.getItem_old_price()%>
							</h5>
							<h2><%=itemBean.getItem_sel_price()%>
							</h2>
							<h6>적립금 : <%=itemBean.getItem_point()%></h6>
							<p>
								<%=itemBean.getItem_content1()%>
							</p>
						</div>
						<div
							class="card_area d-flex justify-content-between align-items-center">
							<div class="product_option">
								<select>
									<%-- 	                    <%if (itemBean.getItem_option_color1() != null) {if (itemBean.getItem_option_color1().equals("블랙")) {%> --%>
									<option>Black</option>
									<%-- 	                    <%}}if (itemBean.getItem_option_color2() != null) { if (itemBean.getItem_option_color2().equals("화이트")) {%> --%>
									<option>White</option>
									<%-- 	                    <%}}if (itemBean.getItem_option_color3() != null) {if (itemBean.getItem_option_color3().equals("레드")) {%> --%>
									<option>Red</option>
									<%-- 	                    <%}}if (itemBean.getItem_option_color4() != null) {if (itemBean.getItem_option_color4().equals("옐로우")) {%> --%>
									<option>Yellow</option>
									<%-- 	                    <%}}%> --%>
								</select>
							</div>
							<div class="product_count">
								<span class="inumber-decrement"> <i class="ti-minus"></i></span>
								<input class="input-number" type="text" name="Item_code_count"
									value="1" min="0" max="10"> <span
									class="number-increment"> <i class="ti-plus"></i></span>
							</div>
				
						</div>
			          <div class="product_buying">
                             <input type="submit" value="장바구니 담기" formaction="./basket.sh"
                                 class="btn_3"> <input type="submit" value="즉시구매"
                                 formaction="./order.sh" class="btn_3 buy"> <a href="#"
                                 class="like_us" onclick="./wish.sh"> <i class="ti-heart"></i>
                             </a>
                         </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<!--================End Single Product Area =================-->


<input type="button" value="수정"
	onclick="location.href='./update.sh?Item_code=<%=itemBean.getItem_code()%>'">
<input type="button" value="삭제"
	onclick="location.href='./delete.sh?Item_code=<%=itemBean.getItem_code()%>'">
<form action="" name="Fr" method="get">

	<%-- 		   <input type="button" value="삭제" formaction="./delete.sh?Item_code=<%=itemBean.getItem_code()%>"> --%>
	<div style="width: 500; float: left;">
		<div>
			<nav>
				<%-- 				<input type="image" src="./image/<%=itemBean.pic1() %>" name="Item_bgpic" width="350px" height="450px" > --%>

			</nav>
		</div>
	</div>
	<br> <br>
	<div style="width: 800; float: left;">

		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이콘 / 아이콘 / 아이콘 / 아이콘 <br> <br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>상품 :<input type="text"
			name="Item_title" value=<%=itemBean.getItem_title()%>
			readonly="readonly"></b><br> <br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>가격 :<input type="text"
			name="Item_old_price" value=<%=itemBean.getItem_old_price()%>
			readonly="readonly">
		</b><br> <br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>할인가격 :
			<input type="text" name="Item_sel_price"
			value=<%=itemBean.getItem_sel_price()%> readonly="readonly">
		</b><br> <br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b> 상세내용
			요약</b><br> &emsp;&emsp;&emsp;
		<%=itemBean.getItem_content1()%><br> <br> <br> <br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Color</b> <label>수량 : </label><input
			type="text" name="Item_count" size="1"> <br> <br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="submit"
			value="장바구니 담기" formaction="./basket.sh"> <br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="submit" value="즉시구매"
			formaction="./order.sh"> <input type="submit" value="찜하기"
			formaction="./wish.sh">

	</div>
	<br>

	<div style="clear: both;">
		<h3>제품설명</h3>
		<br>
		<%=itemBean.getItem_content2()%><br> <br> <br> <input
			type="hidden" name="Item_code" value=<%=itemBean.getItem_code()%>>
		<input type="hidden" name="Item_delivery_pee"
			value=<%=itemBean.getItem_delivery_pee()%>> <input
			type="hidden" name="Item_stock_count"
			value=<%=itemBean.getItem_stock_count()%>>
</form>
<h3>*일괄구매 또는 코디세트</h3>
<table>
	<tr>
		<td><img alt="" src="../image/doodle.png" width="150px"
			height="150px"></td>
		<td><img alt="" src="../image/doodle.png" width="150px"
			height="150px"></td>
		<td><img alt="" src="../image/doodle.png" width="150px"
			height="150px"></td>
		<td><img alt="" src="../image/doodle.png" width="150px"
			height="150px"></td>
	</tr>
</table>
</div>


<h3>상품 이름</h3>
<!-- 정렬 기준 -->
<select>
	<option>설명</option>
	<option>가격</option>
	<option>옵션</option>
</select>


<br>


<jsp:include page="../assets/foot.jsp"></jsp:include>
