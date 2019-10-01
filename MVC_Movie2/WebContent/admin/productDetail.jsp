<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
    String sId = (String)session.getAttribute("sId");
    PageInfo pageInfo = (PageInfo) request.getAttribute("review_pageInfo");
    
    
    ArrayList<ReviewBoardBean> articleList = (ArrayList<ReviewBoardBean>) request.getAttribute("review_articleList");
    

    int listCount = pageInfo.getListCount();
    int review_nowPage = pageInfo.getPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    int maxPage = pageInfo.getMaxPage();
    
    
 


    
%>
<script type="text/javascript">
function check() {
	var item_code_count = document.orderForm.Item_code_count.value;
// 	alert(item_code_count);
	var stock_count = <%=itemBean.getItem_stock_count()%>;
    if (stock_count==0) {
        alert('제품이 품절되었습니다.');
        history.back();
        return false;
    }
    else {
    	if(stock_count<item_code_count){
    		alert('제품이 '+stock_count+'개 남았습니다. 수량을 줄여주세요.');
    		return false;
    	}
    	else{
    		
    	return true;
    	}
    }
}
</script>
<script type="text/javascript">   
// function update_form(b_no){
// 	  $.ajax({
// 	    url: "./productreview.jsp",
// 	    type: "POST",
// 	    cache: false,
// 	    dataType: "json",
// 	    data: "page=" + page,
// 	    success: function(data){
// 	      $('#b_no').val(data.b_no);
// 	      $('#b_type').val(data.b_type);  
// 	      $('#b_title').val(data.b_title);          
// 	      $('#b_content').val(data.b_content);
// 	      $('#b_file').val(data.b_file);
// 	      $('#b_user').val(data.b_user);
	      
// 	      $('#btn_proc').html('저장'); 
// 	      $('#btn_proc').off('click'); 
// 	      $('#btn_proc').on('click', update_proc);      
// 	    },
	    
// 	    error: function (request, status, error){        
// 	        var msg = "ERROR : " + request.status + "<br>"
// 	      msg +=  + "내용 : " + request.responseText + "<br>" + error;
// 	      console.log(msg);              
// 	    }
// 	  });
// 	}
var board = {};
var lstCnt = 10;
board.boardList = {
        init : function(cmpnNo, lstCnt) {
            var page = 1;
            board.boardList.param.page = Number(page);
            board.boardList.param.cmpnNo = cmpnNo;
            board.boardList.param.pageSize = lstCnt;
            board.boardList.data();
        },
       data : function() {
            $.ajax({
                url : './productReview.sh',
                data : board.boardList.param,
                success : function(result) {
                    var boardList = result.boardList;
                    if(boardList.length != 0){
                        board.boardList.totalCount = boardList[0].totalCount; // 총 건수
                    };
                    drawPagination(lstCnt);
                    var markup ="";    // mark 로직 작성
                    $("#event_div").html(markup);
                },
                error : function() {
                    alert('게시판 조회 중 오류가 발생했습니다.');
                }
            });
        },
        param : {
            page : 1,
            pageSize : lstCnt
        },
        totalCount : 0
    };
 
//페이징을 설정하고 페이징 영역에 화면에 그리는 함수
function drawPagination(lstCnt){
    $("#boardPagingDiv").pagination({
       items: board.boardList.totalCount,
       currentPage : board.boardList.param.pageNumber,
       itemsOnPage: lstCnt, // 설정 안할 경우 10
       displayedPages : lstCnt, // 설정 안할 경우 10
       selectOnClick : false, // 페이징 버튼을 눌렀을 때 자동으로 페이징을 다시 그릴지 여부 (기본값은 true)
       onPageClick: function(currentPage){ // 페이징 버튼을 눌렀을 때 이벤트 바인딩
           searchBoardListPaging(currentPage); // 페이징 버튼을 눌렀을 때 다시 비동기로 데이터를 가져와 화면과 페이징을 그립니다.
       }
   });
}
 
// 페이징 번호 눌렀을때 함수
function searchBoardListPaging (page) {
    board.boardList.param.page = Number(page);
    board.boardList.data();
    drawPagination(lstCnt);
}

</script>
<jsp:include page="../main/top.jsp"></jsp:include>  <!--스크립트 탑입니다 asdf -->

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
	<div class="container"> <!-- 이건 중요함 꼭 넣어야함 페이지에서 중앙 위치page asdf -->
		<form method="get" name="orderForm" onsubmit="return check()">
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
								<input class="input-number" type="text" id="Item_code_count" name="Item_code_count"
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
        
        
         <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        
        
        
        <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="row">
                 <div class="product_reivew clearfix">
                 <%                    
                    if (articleList != null & listCount > 0) {              
                        for (int i = 0; i < articleList.size(); i++) {
                    %>                  
                         <div class="col-12 review_list mb-4 float-left">
                         	<div class="review_title clearfix">
	                         	<h5 class="float-left">
	                         		<%=articleList.get(i).getReview_subject()%>
	                         	</h5>
	                         	<p class="float-right">
	                         		   작성자 : <%=articleList.get(i).getReview_writer() %> &nbsp;&nbsp;&nbsp;
	                         		     별점 : <%for(int j=0; j<articleList.get(i).getReview_starPoint(); j++ ){
										%> <i class="fa fa-star review_score"></i>
										<%} %> 
								</p>
                         	</div>       	
        
                         	
                         	
                           <script type="text/javascript">
			            	function doDisplay(i){
			            	    var detail = document.getElementById("review_detail"+i)
			            	    var summary = document.getElementById("review_summary"+i)
			            	    if(detail.style.display =='none'){
			            	    	detail.style.display ='block';
			            	    	summary.style.display ='none';
			            	    }else{
			            	    	summary.style.display ='block';
			            	    	detail.style.display ='none';
			            	    }
			            	}
		            	  </script>
		            	  
							<div class="bg-light p-3 review_bg" id="review_summary<%=i%>" onclick="doDisplay(<%=i%>);">
								<div class="review_summary">
								 <p class="float-left d-inline-block"><%=articleList.get(i).getReview_content()%></p>
								</div>
								 <i class="ti-angle-down float-right d-inline-block review_more" onclick="doDisplay(<%=i%>);"></i>
							</div>
							<div class="bg-light p-3 review_detail review_bg" id="review_detail<%=i%>" style="display:none;" onclick="doDisplay(<%=i%>);">
								<div class="review_content clearfix row">
								
		                           	<% if(articleList.get(i).getReview_file1()!=null){ %>                                	
                         			<div class="review_image float-left d-inline-block col-3">
		                               <img src="./upload/review/<%=articleList.get(i).getReview_file1()%>" class="rounded"                            
		                               onclick="location.href='ReviewBoardDetail.re?review_num=<%=articleList.get(i).getReview_num()%>&page=<%=nowPage%>'">
                         			</div><%}%>
		                         	<div class="review_text float-right d-inline-block col-9">
		                         	<i class="ti-angle-up float-right d-inline-block review_more" onClick="doDisplay(<%=i%>);"></i>		                         	
		                         	<p class="p-3">
		                         	<%=articleList.get(i).getReview_content()%>
		                         	</p>
		                         	</div>
								</div>
                         	</div>                   
                         </div>    
             
                    <%
                        }
                    %>

        
        <!-- ajax로 구현해야함ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ? action : productReviewAction  fdsa-->
                     <div id="pageList" class="text-center review_board board_paging">
			            <% if (review_nowPage <= 1) {  %>
			            <i class="ti-angle-left text-black-50"></i> &nbsp;&nbsp;&nbsp;
			            <% } else {  %>
			            <a href="productReview.sh?Item_code=<%=itemBean.getItem_code() %>&page=<%=review_nowPage - 1%>">
			            <i class="ti-angle-left"></i></a>&nbsp;&nbsp;&nbsp;
			            <% }
			            
			            for (int i = startPage; i <= endPage; i++) {
			            	 if (i == review_nowPage) { %>
			            <span class="current"><b><%=i%></b></span>&nbsp;
			            <% } else {  %>
			            <a href="productReview.sh?Item_code=<%=itemBean.getItem_code() %>&page=<%=i%>"> <%=i%>&nbsp;  </a>
			            <% }
		 				}
			            
			            if (review_nowPage >= maxPage) {%>
			            &nbsp;&nbsp;&nbsp; <i class="ti-angle-right text-black-50"></i>
			            <% } else { %>
			            <a href="productReview.sh?Item_code=<%=itemBean.getItem_code() %>&page=<%=nowPage + 1%>">&nbsp;&nbsp;&nbsp; 
			            <i class="ti-angle-right" ></i> </a>
			            <% }  %>
			        </div>
			        <%  } else { %> <section id="emptyArea">등록된 글이 없습니다.</section><% } %>
      
                    
                    
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

<!-- 끝 asdf -->
<jsp:include page="../main/foot.jsp"></jsp:include>
