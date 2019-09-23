<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
    String sId = (String)session.getAttribute("sId");
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


<div class="product_image_area section_padding">
	<div class="container">
		<form method="post">
		    <input type="hidden" name="sId" value=<%=sId%>>
			<input type="hidden" name="Item_code" value=<%=itemBean.getItem_code()%>> 
			<input type="hidden" name="Item_delivery_pee" value=<%=itemBean.getItem_delivery_pee()%>>
			<input type="hidden" name="Item_stock_count" value=<%=itemBean.getItem_stock_count()%>> 
			<input type="hidden" name="Item_title" value=<%=itemBean.getItem_title()%>>
            <input type="hidden" name="Item_sel_price" value=<%=itemBean.getItem_sel_price()%>> 
            <input type="hidden" name="Item_old_price" value=<%=itemBean.getItem_old_price()%>> 
			<input type="hidden" name="Item_point" value=<%=itemBean.getItem_point()%>>
			
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img">
						<div id="vertical">
							<div data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic1()%>">
								<img src="./assets/img/product/single-product/<%=itemBean.getItem_pic1()%>" />
							</div>
							<div data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic2()%>">
								<img src="./assets/img/product/single-product/<%=itemBean.getItem_pic2()%>" />
							</div>
							<div data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic3()%>">
								<img src="./assets/img/product/single-product/<%=itemBean.getItem_pic3()%>" />
							</div>
							<div data-thumb="./assets/img/product/single-product/<%=itemBean.getItem_pic4()%>">
								<img src="./assets/img/product/single-product/<%=itemBean.getItem_pic4()%>" />
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
							<h5 class="oneprice"><%=itemBean.getItem_old_price()%> </h5>
							<h2><%=itemBean.getItem_sel_price()%> </h2>
							<h6>
								적립금 : <%=itemBean.getItem_point()%></h6>
							<p> <%=itemBean.getItem_content1()%> </p>
						</div>
						<div class="card_area d-flex justify-content-between align-items-center">
							색상 : <div class="product_option">
								<select name="item_color">
								    <option value="black">Black</option>
					     			<option value="white">White</option>
								    <option value="red">Red</option>
									<option value="yellow">Yellow</option>
								</select>
							</div>
							수량 : <div class="product_count">
								<span class="inumber-decrement"> <i class="ti-minus"></i></span>
								<input class="input-number" type="text" name="Item_code_count"
									value="1" min="0" max="10"> <span
									class="number-increment"> <i class="ti-plus"></i></span>
							</div>

						</div>
						<div
							class="card_area d-flex justify-content-between align-items-center product_buying">
							<input type="submit" value="장바구니 담기" formaction="./BasketInsert.bl"
								class="btn_3"> <input type="submit" value="즉시구매" formaction="order.sh" class="btn_3 buy"> <a href="#"
								class="like_us" onclick="./wish.sh"> <i class="ti-heart"></i>
							</a>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!--================End Single Product Area =================-->


 <!--================Product Description Area =================-->
  <section class="product_description_area">
    <div class="container">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
            aria-selected="true">제품 설명</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
            aria-selected="false">상세 스펙</a>
        </li>

        <li class="nav-item">
          <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false">제품 후기</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
          <form action="" name="Fr" method="get">
              <input type="hidden" name="Item_code" value=<%=itemBean.getItem_code()%>>
              <input type="hidden" name="Item_delivery_pee" value=<%=itemBean.getItem_delivery_pee()%>> 
              <input type="hidden" name="Item_stock_count" value=<%=itemBean.getItem_stock_count()%>>
          </form>
          <p>
            <%=itemBean.getItem_content2()%>
          </p>
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
          <div class="table-responsive">
            <table class="table">
              <tbody>
                <tr>
                  <td>
                    <h5>너비</h5>
                  </td>
                  <td>
                    <h5>128mm</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>높이</h5>
                  </td>
                  <td>
                    <h5>508mm</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>깊이</h5>
                  </td>
                  <td>
                    <h5>85mm</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>무게</h5>
                  </td>
                  <td>
                    <h5>52gm</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>품질 검사</h5>
                  </td>
                  <td>
                    <h5>완료</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>Freshness Duration</h5>
                  </td>
                  <td>
                    <h5>03days</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>When packeting</h5>
                  </td>
                  <td>
                    <h5>Without touch of hand</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>Each Box contains</h5>
                  </td>
                  <td>
                    <h5>60pcs</h5>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        
        <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="row">
            <div class="col-lg-6">
              <div class="row total_rate">
                <div class="col-6">
                  <div class="box_total">
                    <h5>Overall</h5>
                    <h4>4.0</h4>
                    <h6>(03 Reviews)</h6>
                  </div>
                </div>
                <div class="col-6">
                  <div class="rating_list">
                    <h3>Based on 3 Reviews</h3>
                    <ul class="list">
                      <li>
                        <a href="#">5 Star
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i> 01</a>
                      </li>
                      <li>
                        <a href="#">4 Star
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i> 01</a>
                      </li>
                      <li>
                        <a href="#">3 Star
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i> 01</a>
                      </li>
                      <li>
                        <a href="#">2 Star
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i> 01</a>
                      </li>
                      <li>
                        <a href="#">1 Star
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i> 01</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="review_list">
                <div class="review_item">
                  <div class="media">
                    <div class="d-flex">
                      <img src="./assets/img/product/single-product/review-1.png" alt="" />
                    </div>
                    <div class="media-body">
                      <h4>Blake Ruiz</h4>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo
                  </p>
                </div>
                <div class="review_item">
                  <div class="media">
                    <div class="d-flex">
                      <img src="./assets/img/product/single-product/review-2.png" alt="" />
                    </div>
                    <div class="media-body">
                      <h4>Blake Ruiz</h4>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo
                  </p>
                </div>
                <div class="review_item">
                  <div class="media">
                    <div class="d-flex">
                      <img src="./assets/img/product/single-product/review-3.png" alt="" />
                    </div>
                    <div class="media-body">
                      <h4>Blake Ruiz</h4>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo
                  </p>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="review_box">
                <h4>Add a Review</h4>
                <p>Your Rating:</p>
                <ul class="list">
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                </ul>
                <p>Outstanding</p>
                <form class="row contact_form" action="contact_process.php" method="post" novalidate="novalidate">
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="text" class="form-control" name="name" placeholder="Your Full name" />
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="email" class="form-control" name="email" placeholder="Email Address" />
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="text" class="form-control" name="number" placeholder="Phone Number" />
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-group">
                      <textarea class="form-control" name="message" rows="1" placeholder="Review"></textarea>
                    </div>
                  </div>
                  <div class="col-md-12 text-right">
                    <button type="submit" value="submit" class="btn_3">
                      Submit Now
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Product Description Area =================-->



  <!-- product_list part start-->
  <section class="product_list best_seller">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="section_tittle text-center">
            <h2>코디 상품 <!-- <span>shop</span> --></h2>
          </div>
        </div>
      </div>
      <div class="row align-items-center justify-content-between">
        <div class="col-lg-12">
          <div class="best_product_slider owl-carousel">
            <div class="single_product_item">
              <img src="./assets/img/product/single-product/0006_1.jpg" alt="">
              <div class="single_product_text">
                <h4>올리브 벽걸이 장식장</h4>
                <h3>15,000</h3>
              </div>
            </div>
            <div class="single_product_item">
              <img src="./assets/img/product/single-product/0005_1.jpg" alt="">
              <div class="single_product_text">
                <h4>올리브 벽걸이 장식장</h4>
                <h3>15,000</h3>
              </div>
            </div>
            <div class="single_product_item">
              <img src="./assets/img/product/single-product/0004_1.jpg" alt="">
              <div class="single_product_text">
                <h4>올리브 벽걸이 장식장</h4>
                <h3>15,000</h3>
              </div>
            </div>
            <div class="single_product_item">
              <img src="./assets/img/product/single-product/0003_1.jpg" alt="">
              <div class="single_product_text">
                <h4>올리브 벽걸이 장식장</h4>
                <h3>15,000</h3>
              </div>
            </div>
            <div class="single_product_item">
              <img src="./assets/img/product/single-product/0002_1.jpg" alt="">
              <div class="single_product_text">
                <h4>올리브 벽걸이 장식장</h4>
                <h3>15,000</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- product_list part end-->

<!-- 
<h3>상품 이름</h3>
정렬 기준
<select>
	<option>설명</option>
	<option>가격</option>
	<option>옵션</option>
</select>
 -->

<br>


<jsp:include page="../assets/foot.jsp"></jsp:include>
