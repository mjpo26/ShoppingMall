<%@page import="vo.MemberBean"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="vo.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ReviewBoardBean article = (ReviewBoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String) session.getAttribute("sId");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	String writer = article.getReview_id();
	ArrayList<CommentBean> commentBean = (ArrayList<CommentBean>) request.getAttribute("commentBean");
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
							리뷰 보기 <span>-</span> 상품 리뷰 보기
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</head>
<body>
	<section class="review_board_content board_content">
		<div class="container">
			<div class="review_content mt-5 p-5 col-lg-8 mx-auto">
				<span class="content_gray content_item">상품명 : <%=article.getReview_order_item_name()%></span>
				<div class="content_title mt-1">
					<h3><%=article.getReview_subject()%></h3>
				</div>
				<div class="review_score mt-0">
					<span class="content_gray">평점 : </span>
					<%
						for (int i = 0; i < article.getReview_starPoint(); i++) {
					%><i class="fa fa-star"></i>
					<%
						}
					%>
					<span class="content_gray"> &nbsp;&nbsp; | &nbsp;&nbsp;작성자 :
						<%=article.getReview_writer()%></span>
				</div>
				<hr>
				<div class="content_content">
					<div class="content_img mb-3">
						<img src="./upload/review/<%=article.getReview_file1()%>">
					</div>
					<%=article.getReview_content()%>
				</div>
				<hr>
				<input type="button" class="btn_3"
					onclick='location.href="./ReviewBoardList.re?page=<%=nowPage%>"'
					value="목록">
				<%
					// 세션값이 존재하면  
					// 세션값이 "admin" 같으면 
					if (sId != null) {
						// 세션값이 "admin" 같으면 
						if (sId.equals(writer)) {
				%>
<!-- 				<input type="button" class="btn_3" -->
<%-- 					onclick='location.href="ReviewBoardModifyForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>" ' --%>
<!-- 					value="수정"> -->
					
					 <input type="button" class="btn_3"
					onclick='location.href="ReviewBoardCommentDelete.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>" '
					value="삭제">
				<%
					}
					}
				%>
				<div
					class="comment review-comment bg-light comment_bg mt-5 px-3 py-1">
					<%
						if (null != commentBean && commentBean.size() > 0) {
							for (CommentBean cb : commentBean) {
					%>
					<div class="comment_area mt-2 row">
						<div class="comment_writer col-2">
							<b><i class="ti-crown"></i> &nbsp; <%=cb.getComment_writer()%></b>

						</div>

						<div class="comment_content col-8">
							<%=cb.getComment_content()%>
						</div>
						<div class="comment_date col-2 text-right text-secondary">
							<%=cb.getComment_date()%>
							<%
								if (sId != null && sId.equals("admin")) {
							%>
							<a
								href="ReviewBoardCommentDelete.re?num=<%=article.getReview_num()%>">
								<img src="./assets/img/board/xicon.png" alt="xicon">
							</a>

							<%
								}
							%>
						</div>
					</div>
					<%
						}
						} else {
					%>
					<div class="comment_none mt-3">
						<i class="ti-face-sad"></i> 아직 작성된 댓글이 없습니다.
					</div>
					<%
						}

						if (sId != null && sId.equals("admin")) {
					%>
					<form action="ReviewBoardCommentPro.re?comment_id=<%=sId%>"
						method="post" name="fr">
						<input type="hidden" name="comment_review_num"
							value="<%=article.getReview_num()%>">
						<div class="row mt-2 comment_write">
							<div class="col-2 comment_form">
								<b><i class="ti-crown"></i></b> <input type="text"
									name="comment_name" value="<%=memberBean.getMember_name()%>">
							</div>
							<div class="col-8 comment_form">
								<textarea name="comment_content" rows="5"
									placeholder="댓글을 입력해주세요."></textarea>
							</div>
							<div class="col-2 clearfix">
								<div class="float-right">
									<input type="submit" value="입력"
										class="genric-btn primary circle">
								</div>
								<div class="float-right">
									<input type="reset" value="취소"
										class="genric-btn default circle">
								</div>
							</div>
						</div>
					</form>
					<%
						}
					%>

				</div>
			</div>




		</div>
	</section>


	<jsp:include page="../main/foot.jsp"></jsp:include>