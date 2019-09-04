<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// ItemBean itemBean = (ItemBean)request.getAttribute("article");
	// String nowPage = (String)request.getAttribute("page");
%>
<jsp:include page="top.jsp"></jsp:include>

 <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>제품 상세 페이지</h2>
              <p>제품 상세 페이지 <span>-</span> %=itemBean.getItem_title() %></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->
  <!--================End Home Banner Area =================-->


  <!--================Single Product Area =================-->
  <div class="product_image_area section_padding">
    <div class="container">
      <div class="row s_product_inner justify-content-between">
        <div class="col-lg-7 col-xl-7">
          <div class="product_slider_img">
            <div id="vertical">
              <div data-thumb="img/product/single-product/product_2.jpg">
                <img src="img/product/single-product/product_2.jpg" />
              </div>
<!--               <div data-thumb="img/product/single-product/product_1.png">
                <img src="img/product/single-product/product_1.png" />
              </div> -->
              <div data-thumb="img/product/single-product/product_3.jpg">
                <img src="img/product/single-product/product_3.jpg" />
              </div>
              <div data-thumb="img/product/single-product/product_4.jpg">
                <img src="img/product/single-product/product_4.jpg" />
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 col-xl-4">
          <div class="s_product_text">
            <h5>아이콘 <span>|</span> 아이콘</h5>
            <h3>바미르 케인 수납장 %=itemBean.getItem_title() %></h3>
            <h5 class="oneprice">300,000 원  %=itemBean.getItem_old_price() %></h5>
            <h2>150,000 원 %=itemBean.getItem_new_price() %></h2>
<!--             <ul class="list"> -->
<!--               <li> -->
<!--                 <a class="active" href="#"> -->
<!--                   <span>Category</span> : Household</a> -->
<!--               </li> -->
<!--               <li> -->
<!--                 <a href="#"> <span>Availibility</span> : In Stock</a> -->
<!--               </li> -->
<!--             </ul> -->
<select>
            <%
                //if (itemBean.getItem_option_color1().equals("블랙")) {
            %>
            <option>Black</option>
            <%
                //}
            %>
            <%
                //if (itemBean.getItem_option_color2().equals("화이트")) {
            %>
            <option>White</option>
            <%
                //}
            %>
            <%
                //if (itemBean.getItem_option_color3().equals("레드")) {
            %>
            <option>Red</option>
            <%
                //}
            %>
            <%
                //if (itemBean.getItem_option_color4().equals("옐로우")) {
            %>
            <option>Yellow</option>
            <%
                //}
            %></select>
            <p>
              %=itemBean.getItem_content1() %>
            </p>
            <div class="card_area d-flex justify-content-between align-items-center">
              <div class="product_count">
                <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                <input class="input-number" type="text" value="1" min="0" max="10">
                <span class="number-increment"> <i class="ti-plus"></i></span>
              </div>
              <a href="#" class="btn_3">add to cart</a>
              <a href="#" class="like_us"> <i class="ti-heart"></i> </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->



	<div style="width: 500; float: left;">
		<div>
			<nav>
				<img src="../image/doodle.png" width="350px" height="450px">
			</nav>
		</div>
	</div>
	<br>
	<br>
	<div style="width: 800; float: left;">
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이콘 / 아이콘 / 아이콘 / 아이콘 <br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>상품 : %=itemBean.getItem_title() %></b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>가격 : %=itemBean.getItem_old_price() %></b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>할인가격 : %=itemBean.getItem_new_price() %></b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>
		상세내용 요약</b><br>
		&emsp;&emsp;&emsp;%=itemBean.getItem_content1() %><br>
		
		<br> <br>
		
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Color</b> <select>
			<%
				//if (itemBean.getItem_option_color1().equals("블랙")) {
			%>
			<option>Black</option>
			<%
				//}
			%>
			<%
				//if (itemBean.getItem_option_color2().equals("화이트")) {
			%>
			<option>White</option>
			<%
				//}
			%>
			<%
				//if (itemBean.getItem_option_color3().equals("레드")) {
			%>
			<option>Red</option>
			<%
				//}
			%>
			<%
				//if (itemBean.getItem_option_color4().equals("옐로우")) {
			%>
			<option>Yellow</option>
			<%
				//}
			%></select>
			 <br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="Button"
			value="장바구니 담기" size="30"><br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="Button" value="즉시구매"><input
			type="Button" value="찜하기">
	</div>
	<br>

	<div style="clear: both;">
	<h3>제품설명</h3><br>
		%=itemBean.getItem_content2() %><br><br><br>
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

	<input type="submit" value="장바구니">
	<input type="submit" value="찜하기">
	<br>
	

<jsp:include page="foot.jsp"></jsp:include>
