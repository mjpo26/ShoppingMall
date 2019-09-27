<%@page import="vo.PageInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<ItemBean> articleList = (ArrayList<ItemBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
%>
<jsp:include page="../assets/top.jsp"></jsp:include>


<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>상품 목록</h2>
						<p>
							상품 목록 <span>-</span> 상품 보기
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="review_board_list board_list mt-5">
	<div class="container">


		<div class="row clearfix">
			<%
				if (articleList != null & listCount > 0) {
					for (int i = 0; i < articleList.size(); i++) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 float-left review_list">
				<figure class="figure">
					<div class="review_photo">
						<img
							src="./assets/img/product/single-product/<%=articleList.get(i).getItem_pic1()%>"
							class="figure-img"
							onclick="location.href='./productDetail.sh?Item_code=<%=articleList.get(i).getItem_code()%>&page=<%=nowPage%>'">
					</div>

					<figcaption
						class="figure-caption position-absolute fixed-top review_title mx-auto">
						<p><%=articleList.get(i).getItem_title()%></p>
					</figcaption>
					<figcaption
						class="figure-caption position-absolute fixed-bottom review_writer mx-auto">
						<p><%=articleList.get(i).getItem_title()%></p>
					</figcaption>
				</figure>
			</div>
			<%--         <div class="row clearfix"> 
						<td align="center"><%=articleList.get(i).getItem_code() %></td>
						<td align="center"><%=articleList.get(i).getItem_Date() %></td>
						
                            <div class="float-right col"><p class="text-right">조회수:<%=articleList.get(i).getReview_readcount()%></p> </div>
                         </div> --%>

			<%
				}
			%>
		</div>


<!-- 		<section id="writeButton"> -->
<!-- 			<a href="BoardWriteForm.bo"><input type="button" value="글쓰기"></a> -->
<!-- 		</section> -->

	  <div id="pageList" class="text-center event_board board_paging">
	
				<%
					if (nowPage <= 1) {
				%>
				      <i class="ti-angle-left text-black-50"></i> &nbsp;&nbsp;&nbsp;
				<%
					} else {
				%>
				<a href="product_list.sh?page=<%=nowPage - 1%>"><i class="ti-angle-left"></i></a>&nbsp;&nbsp;&nbsp;
				<%
					}
				%>

				<%
					for (int i = startPage; i <= endPage; i++) {
							if (i == nowPage) {
				%>
			   <span class="current"><b><%=i%></b></span>&nbsp;
				<%
					} else {
				%>
				<a href="product_list.sh?page=<%=i%>">  <%=i%>
				</a>&nbsp;
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (nowPage >= maxPage) {
				%>
			   &nbsp;&nbsp;&nbsp; <i class="ti-angle-right text-black-50"></i> 
				<%
					} else {
				%>
				<a href="product_list.sh?page=<%=nowPage + 1%>">&nbsp;&nbsp;&nbsp; <i class="ti-angle-right" ></i></a>
				<%
					}
				%>
				 </div>
		<%
			} else {
		%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
		<%
			}
		%>
	</div>
	<!--container  -->
</section>
<jsp:include page="../assets/foot.jsp"></jsp:include>


















