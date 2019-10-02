<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<ReviewBoardBean> articleList = (ArrayList<ReviewBoardBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
%>

<jsp:include page="../main/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>리뷰 게시판</h2>
						<p>
							리뷰 목록 <span>-</span> 상품 리뷰 모음
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

			<div class="col-lg-3 col-md-4 col-sm-6 float-left review_list" onclick="location.href='ReviewBoardDetail.re?review_num=<%=articleList.get(i).getReview_num()%>&page=<%=nowPage%>'">
				<figure class="figure">
					<%
						if (articleList.get(i).getReview_file1() != null) {
					%>
					<div class="review_photo">
						<img
							src="./upload/review/<%=articleList.get(i).getReview_file1()%>"
							class="figure-img">
					</div>
					<%
						} else {
					%>
					<img
							src="./upload/review/000.jpg"
							class="figure-img">
					<%
						}
					%>

					<figcaption
						class="figure-caption position-absolute fixed-top review_title mx-auto">	
						<p>
							<%if(articleList.get(i).getReview_order_item_name() !=null) {%> 
							<span class="review_itme_name"> <%=articleList.get(i).getReview_order_item_name()%> </span><%} 
							else { %> 존재하지 않는 제품입니다. <%}%> <br>
							<%=articleList.get(i).getReview_subject()%><br>
							<%
								for (int j = 0; j < articleList.get(i).getReview_starPoint(); j++) {
							%>
							<a><i class="fa fa-star review_score"></i></a>
							<%
								}
							%>
						</p>

					</figcaption>
					<figcaption
						class="figure-caption position-absolute fixed-bottom review_writer mx-auto">
						<p><%=articleList.get(i).getReview_content()%></p>
					</figcaption>
				</figure>
			</div>
			<%--         <div class="row clearfix">
                            <div class="float-left col"><p class="text-left"><%=articleList.get(i).getReview_writer()%></p> </div>
                            <div class="float-right col"><p class="text-right">조회수:<%=articleList.get(i).getReview_readcount()%></p> </div>
                         </div> --%>

			<%
				}
			%>
		</div>



		<div id="pageList" class="text-center review_board board_paging">
			<%
				if (nowPage <= 1) {
			%>
			<i class="ti-angle-left text-black-50"></i> &nbsp;&nbsp;&nbsp;
			<%
				} else {
			%>
			<a href="ReviewBoardList.re?page=<%=nowPage - 1%>"><i
				class="ti-angle-left"></i></a>&nbsp;&nbsp;&nbsp;
			<%
				}
					for (int i = startPage; i <= endPage; i++) {
						if (i == nowPage) {
			%>
			<span class="current"><b><%=i%></b></span>&nbsp;
			<%
				} else {
			%>
			<a href="ReviewBoardList.re?page=<%=i%>"> <%=i%>&nbsp;
			</a>
			<%
				}

					}
			%>

			<%
				if (nowPage >= maxPage) {
			%>
			&nbsp;&nbsp;&nbsp; <i class="ti-angle-right text-black-50"></i>

			<%
				} else {
			%>
			<a href="ReviewBoardList.re?page=<%=nowPage + 1%>">&nbsp;&nbsp;&nbsp;
				<i class="ti-angle-right"></i>
			</a>
			<%
				}
			%>
		</div>
		<%
			} else {
		%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
		<!--         <section id="writeButton">
            <a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
        </section> -->
		<%
			}
		%>


	</div>
	<!--container  -->
</section>
<jsp:include page="../main/foot.jsp"></jsp:include>













