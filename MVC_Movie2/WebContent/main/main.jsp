<%@page import="vo.EventBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.ItemBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>	
<%
ArrayList<ItemBean> bestProduct = bestProduct = (ArrayList<ItemBean>) request.getAttribute("bestProduct");
ArrayList<ItemBean> newProduct = (ArrayList<ItemBean>) request.getAttribute("newProduct");
ArrayList<ItemBean> recommendProduct = (ArrayList<ItemBean>) request.getAttribute("recommendProduct");
String sId = (String)session.getAttribute("sId");
ArrayList<EventBean> eventBean = (ArrayList<EventBean>) request.getAttribute("EventBean");

    
%>
<jsp:include page="../main/top.jsp"></jsp:include>


<!-- banner part start-->
<section class="banner_part">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">

				<div class="banner_slider owl-carousel">
					<!-- 여기 -->
					<%
				if (null != eventBean && eventBean.size() > 0) {
					for (EventBean eb : eventBean) {
				%>
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-12 col-12 mx-auto">
								<div class="banner_text">
									<div class="banner_text_iner text-center">
										<h1><%=eb.getEvent_subject()%></h1>
										<p><%=eb.getEvent_summary()%></p>
<!-- 										<a href="#" class="btn_2">buy now</a> -->
									</div>
								</div>
							</div>
<!-- 							<div class="banner_img d-none d-lg-block"> -->
<%-- 								<img src="./upload/event/<%=eb.getEvent_imageMain()%>" alt=""> --%>
<!-- 							</div> -->
						</div>
					</div>
					<%
					  }
					}else{%>
						<div class="single_banner_slider">
							<div class="row">
								<div class="col-lg-5 col-md-8">
									<div class="banner_text">
										<div class="banner_text_iner">
											<h1>Wood & Cloth Sofa</h1>
											<p>Incididunt ut labore et dolore magna aliqua quis ipsum
												suspendisse ultrices gravida. Risus commodo viverra</p>
											<a href="#" class="btn_2">buy now</a>
										</div>
									</div>
								</div>
								<div class="banner_img d-none d-lg-block">
									<img src="./assets/img/banner_img.png" alt="">
								</div>
							</div>
						</div>
					<%}%>

                    </div>
                    <div class="slider-counter"></div>
                </div>
            </div>
        </div>
    </section>
    
    
<!-- feature_part start-->
<section class="feature_part section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="section_tittle text-center">
					<h2>New Product</h2>
				</div>
			</div>
		</div>
		
		
		
		<div class="row align-items-center justify-content-between">
		<%
		if(newProduct!=null){
         %>
			<div class="col-lg-7 col-sm-6">
				<div class="single_feature_post_text">
					<p><%=newProduct.get(0).getItem_category1() %></p>
					<h3><%=newProduct.get(0).getItem_title() %></h3>
					<a href="productDetail.sh?Item_code=<%=newProduct.get(0).getItem_code()%>&page=1" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img
						src="./assets/img/product/single-product/<%=newProduct.get(0).getItem_bgpic() %>" alt="">
				</div>
			</div>
			<div class="col-lg-5 col-sm-6">
				<div class="single_feature_post_text">
					<p><%=newProduct.get(1).getItem_category1() %></p>
					<h3><%=newProduct.get(1).getItem_title() %></h3>
					<a href="productDetail.sh?Item_code=<%=newProduct.get(1).getItem_code()%>&page=1" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img
						src="./assets/img/product/single-product/<%=newProduct.get(1).getItem_bgpic() %>" alt="">
				</div>
			</div>
			<div class="col-lg-5 col-sm-6">
				<div class="single_feature_post_text">
					<p><%=newProduct.get(2).getItem_category1() %></p>
					<h3><%=newProduct.get(2).getItem_title() %></h3>
					<a href="productDetail.sh?Item_code=<%=newProduct.get(2).getItem_code()%>&page=1" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img
						src="./assets/img/product/single-product/<%=newProduct.get(2).getItem_bgpic() %>" alt="">
				</div>
			</div>
			<div class="col-lg-7 col-sm-6">
				<div class="single_feature_post_text">
					<p><%=newProduct.get(3).getItem_category1() %></p>
					<h3><%=newProduct.get(3).getItem_title() %></h3>
					<a href="productDetail.sh?Item_code=<%=newProduct.get(3).getItem_code()%>&page=1" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img
						src="./assets/img/product/single-product/<%=newProduct.get(3).getItem_bgpic() %>" alt="">
				</div>
			</div>
		<%}else{ %> 이번주 입고 상품이 없습니다 <%} %>
		</div>
	
	</div>
</section>


<!-- awesome_shop start-->
<section class="our_offer section_padding">
	<div class="container">
		<div class="row align-items-center justify-content-between">
			<div class="col-lg-6 col-md-6">
				<div class="offer_text">
					<span>FUNCTIONAL SOFA</span>
					<h2>KOMFORT SOFA</h2>
					<p>생활오염, 얼룩으로부터 깨끗하고 안전하게<br> 기능과 실용성을  모두 갖춘 체리쉬 콤포어 쇼파</p>
					
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="offer_img">
<!-- 					<img src="./assets/img/offer_img.png" alt=""> -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- awesome_shop part start-->

<!-- upcoming_event part start-->
    <!-- banner part start-->
    <!-- product_list part start 베스트 상품-->
    <section class="product_list best_seller section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>Best Sellers <span>베스트 상품</span></h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                    
                    <%
                     if(bestProduct!=null){
                         int arraySize = bestProduct.size();                                     
                         if(arraySize>8) arraySize=8;                              
                         for(int i = 0; i<arraySize; i++){ 
                    %>
					<div class="single_product_item">
						<img
							src="./assets/img/product/single-product/<%=bestProduct.get(i).getItem_pic1() %>"
							alt=""
							onclick="location.href='productDetail.sh?Item_code=<%=bestProduct.get(i).getItem_code()%>&page=1'">
						<div class="single_product_text">
							<h4><%=bestProduct.get(i).getItem_title()%></h4>
							<h3><fmt:formatNumber value="<%=bestProduct.get(i).getItem_sel_price()%>" pattern="#,###" />원</h3>
						</div>
					</div>
					<%    
                           }// bestProduct for 문 종료9
                     }// bestProduct!=null if문 종료
                     %>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- product_list part end-->


<!-- subscribe_area part start-->
<section class="subscribe_area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="subscribe_area_text text-center">
					<h5>모브의 맞춤 홈 인테리어 제안</h5>
					<h2>MO:V HOME STYLING</h2>
					<p> 인테리어 없이 가구, 패브릭, 조명, 소품 등 고객의 라이프 스타일에 맞게<br>
						 1:1 상담을 통해 고객님의 공간을 연출해드립니다.</p>
					<div class="input-group">
						<div class="input-group-append mx-auto">
							<a href="./QnA_BoardList.qa" class="input-group-text btn_2" id="basic-addon2">게시판 문의</a>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</section>
<!--::subscribe_area part end::-->



<!-- product_list start-->
<section class="product_list padding_top">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="section_tittle text-center">
					<h2>
						Recommend <span>이달의 추천 상품</span>
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="product_list_slider owl-carousel">
					<div class="single_product_list_slider">
						<div class="row align-items-center">
							<!-- justify-content-between 해제 -->
							<%
                                  if(recommendProduct!=null){
                                	  int arraySize = recommendProduct.size();                                	  
                                	  if(arraySize>12) arraySize=12;                         	  
                                	  for(int i = 0; i<arraySize; i++){ 
// 	                                     for(int i = 1; i<=1; i++){ 
//                                       out.println(i);
                                         %>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img
										src="./assets/img/product/single-product/<%=recommendProduct.get(i).getItem_pic1() %>"
										alt=""
										onclick="location.href='productDetail.sh?Item_code=<%=recommendProduct.get(i).getItem_code()%>&page=1'">
									<div class="single_product_text">
										<h4><%=recommendProduct.get(i).getItem_title()%></h4>
										<h3><fmt:formatNumber value="<%=recommendProduct.get(i).getItem_sel_price()%>" pattern="#,###" />원</h3>
										<a
											href="./basket.sh?Item_code=<%=recommendProduct.get(i).getItem_code()%>"
											class="add_cart">+ add to cart<i class="ti-heart"></i></a> <a
											href="./wish.sh?Item_code=<%=recommendProduct.get(i).getItem_code()%>"
											class="add_cart"></a>
									</div>
								</div>
							</div>
							<%    
                                           }// bestProduct for 문 종료9
                                  }// bestProduct!=null if문 종료
                                         %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- product_list part start-->


<!-- subscribe_area part start -->
<!-- <section class="client_logo padding_top"> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row align-items-center"> -->
<!-- 			<div class="col-lg-12"> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_1.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_2.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_3.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_4.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_5.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_3.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_1.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_2.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_3.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="single_client_logo"> -->
<!-- 					<img src="./assets/img/client_logo/client_logo_4.png" alt=""> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->
<!--::subscribe_area part end::-->
<jsp:include page="../main/foot.jsp"></jsp:include>
