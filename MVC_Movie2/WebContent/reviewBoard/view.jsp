<%@page import="vo.ReviewBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ReviewBoardBean article = (ReviewBoardBean) request.getAttribute("article");

	String nowPage = (String) request.getAttribute("page");
%>

<jsp:include page="../assets/top.jsp"></jsp:include>
  
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
	<section id="review_board_content board_content">	
		<div class="container">
			<div class="review_content">
				<div class="content_title">
				<%=article.getReview_subject()%>
				</div>
				<div class="content_score">
				<%=article.getReview_starPoint()%>
				</div>
				<div class="content_content">
					<div class="content_img">
						<img src="./upload/review/<%=article.getReview_file1()%>">
					</div>
					<%=article.getReview_content()%>
				</div>
			</div>
			
			
			
<%-- 			<div id="commandList">
	<!--  아랫부분 답변은 admin일때만 나오게 조건주기-->
			<a href="ReviewBoardReplyForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[답변]</a>
			<a	href="ReviewBoardModifyForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[수정]</a>
			<a href="ReviewBoardDeleteForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[삭제]</a>
			<a href="ReviewBoardList.re?page=<%=nowPage%>">[목록]</a> &nbsp;&nbsp;
			</div> --%>
		</div>
	</section>
	
	
<jsp:include page="../assets/foot.jsp"></jsp:include>
