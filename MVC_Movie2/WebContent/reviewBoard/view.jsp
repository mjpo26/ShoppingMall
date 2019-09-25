<%@page import="java.util.ArrayList"%>
<%@page import="vo.CommentBean"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.ReviewBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ReviewBoardBean article = (ReviewBoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String) session.getAttribute("sId");
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	 ArrayList<CommentBean> cb = (ArrayList<CommentBean>)request.getAttribute("cb");;

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
	<section class="review_board_content board_content">	
		<div class="container">
			<div class="review_content mt-5 p-5">
				<span class="content_gray content_item"> 아이템 이름을 넣어주세욥</span>
				<div class="content_title mt-1">
				<h3><%=article.getReview_subject()%></h3>
				</div>
				<div class="review_score mt-0">
				<span class="content_gray">평점: </span>
				<%for(int i=0; i<article.getReview_starPoint(); i++ ){
				%>
					<a><i class="fa fa-star"></i></a>
				<%} %>
				<span class="content_gray"> &nbsp;&nbsp;  | &nbsp;&nbsp;작성자 : <%=article.getReview_writer()%></span>			
				</div>
				<hr>
				<div class="content_content">
					<div class="content_img mb-3">
						<img src="./upload/review/<%=article.getReview_file1()%>">
					</div>
					<%=article.getReview_content()%>
				</div>
				<hr>
				<input type="button" class="btn_3" onclick='location.href="./ReviewBoardList.re?page=<%=nowPage%>"' value="목록">
			</div>
			
			
			
			<div id="commandList" class="text-center">
				<form action="ReviewBoardCommentPro.re" method="post" name="fr">
					<input type="hidden" name="id" value="<%=sId%>"> 
					<input type="text" name="comment_review_num" value="<%=article.getReview_orderNo()%>">
					<table id="notice table">
						<tr>
							<td class="twrite">작성자</td>
							<td><input type="text" name="name" value="<%=memberBean.getMember_name()%>"></td>
							<td class="twrite">비밀번호</td>
							<td><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td class="twrite">내용</td>
							<td class="ttitle" colspan="3">
							 <textarea name="content" rows="10" cols="30">
							 </textarea></td>
						</tr>
					</table>
					<input type="submit" value="댓글달기" class="btn"> 
					<input type="reset" value="취소" class="btn">
				</form>
			<!--  아랫부분 답변은 admin일때만 나오게 조건주기-->
<%-- 			<a href="ReviewBoardReplyForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[답변]</a> --%>
<%-- 			<a	href="ReviewBoardModifyForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[수정]</a> --%>
<%-- 			<a href="ReviewBoardDeleteForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[삭제]</a> --%>
<%-- 			<a href="ReviewBoardList.re?page=<%=nowPage%>">[목록]</a> &nbsp;&nbsp; --%>
			</div>
		</div>
	</section>
	
	
<jsp:include page="../assets/foot.jsp"></jsp:include>
