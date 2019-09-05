<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	 ItemBean itemBean = (ItemBean)request.getAttribute("article");
	 String nowPage = (String)request.getAttribute("page");
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
              <p>제품 상세 페이지 <span>-</span><%=itemBean.getItem_title() %> </p>
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
            
            	<div data-thumb="./assets/img/product/single-product/product_2.jpg">
                <img src="./assets/img/product/single-product/product_2.jpg" />
              </div>            	
            
            
            
              
<!--               <div data-thumb="img/product/single-product/product_1.png">
                <img src="img/product/single-product/product_1.png" />
              </div> -->
              <div data-thumb="./assets/img/product/single-product/product_3.jpg">
                <img src="./assets/img/product/single-product/product_3.jpg" />
              </div>
              <div data-thumb="./assets/img/product/single-product/product_4.jpg">
 				<img src="./assets/img/product/single-product/product_4.jpg" />

              </div>
            </div>
          </div>
        </div>
        
        
        
        <div class="col-lg-5 col-xl-4">
          <div class="s_product_text">
            <h5>아이콘 <span>|</span> 아이콘</h5>
            <h3><!-- 바미르 케인 수납장 --> <%=itemBean.getItem_title() %></h3>
            <h5 class="oneprice"><!-- 300,000 원 --> <%=itemBean.getItem_new_price() %>  </h5>
            <h2><!-- 150,000 원 --><%=itemBean.getItem_old_price() %></h2>
<!--             <ul class="list"> -->
<!--               <li> -->
<!--                 <a class="active" href="#"> -->
<!--                   <span>Category</span> : Household</a> -->
<!--               </li> -->
<!--               <li> -->
<!--                 <a href="#"> <span>Availibility</span> : In Stock</a> -->
<!--               </li> -->
<!--             </ul> -->
            <p>
              <%=itemBean.getItem_content1() %>
            </p>
            <div class="card_area d-flex justify-content-between align-items-center">
              <div class="product_count">
                <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                <input class="input-number" type="text" value="1" min="0" max="10">
                <span class="number-increment"> <i class="ti-plus"></i></span>
              </div> 
              <input type="submit" value="add to cart" formaction="./basket.sh" class="btn_3" >
              <a href="#" class="like_us"> <i class="ti-heart"></i> </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->


			   <input type="button" value="수정" onclick="location.href='./update.sh?Item_code=<%=itemBean.getItem_code()%>'">
		   <input type="button" value="삭제" onclick="location.href='./delete.sh?Item_code=<%=itemBean.getItem_code()%>'">
<form action="" name="Fr" method="get">

<%-- 		   <input type="button" value="삭제" formaction="./delete.sh?Item_code=<%=itemBean.getItem_code()%>"> --%>
	<div style="width: 500; float: left;">
		<div>
			<nav>
				<input type="image" src="./image/<%=itemBean.getItem_bgpic() %>" name="Item_bgpic" width="350px" height="450px" >
				
			</nav>
		</div>
	</div>
	<br>
	<br>
	<div style="width: 800; float: left;">
	
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이콘 / 아이콘 / 아이콘 / 아이콘 <br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>상품 :<input type="text" name="Item_title" value=<%=itemBean.getItem_title() %> readonly="readonly"></b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>가격 :<input type="text" name="Item_old_price" value=<%=itemBean.getItem_old_price() %> readonly="readonly"> </b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>할인가격 : <input type="text" name="Item_old_price" value=<%=itemBean.getItem_new_price() %> readonly="readonly"></b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>
		상세내용 요약</b><br>
		&emsp;&emsp;&emsp;<%=itemBean.getItem_content1() %><br>
		
		<br> <br>
		
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Color</b> 
	
			<label>수량 : </label><input type="text" name="Item_count" size="1">
			 <br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<input type="submit" value="장바구니 담기" formaction="./basket.sh">
		<br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		   <input type="submit" value="즉시구매" formaction="./order.sh">
		   <input type="submit" value="찜하기" formaction="./wish.sh">
		
	</div>
	<br>

	<div style="clear: both;">
	<h3>제품설명</h3><br>
		<%=itemBean.getItem_content2() %><br><br><br>
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
