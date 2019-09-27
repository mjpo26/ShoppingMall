<%@page import="vo.QnA_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 전달받은 request 객체에서 데이터 가져오기
	QnA_BoardBean article = (QnA_BoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String) session.getAttribute("sId");
	String writer = article.getQnA_writer_id();
	if (sId == null) {
		sId = "비회원";
	}
%>

<jsp:include page="../assets/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>QnA 게시판</h2>
						<p>
							QnA 게시판 <span>-</span><%=article.getQnA_subject()%>
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
				<div class="content_title mt-1">
					<h3><%=article.getQnA_subject()%></h3>
				</div>
				<div class="review_score mt-0">
					<span class="content_gray"> &nbsp;&nbsp; | &nbsp;&nbsp;아이디 :
						<%=article.getQnA_writer_id()%> <br> &nbsp;| &nbsp;&nbsp;첨부파일
						: <%
 	if (article.getQnA_file1() != null) {
 %> <a href="QnA_File.jsp?downFile=<%=article.getQnA_file1()%>"><%=article.getQnA_file1()%></a>
						<%
							}
						%>
					</span>
				</div>
				<hr>
				<div class="content_content">
					<%=article.getQnA_content()%>
				</div>
			</div>
			<section id="commandList">

				<%
					// 세션값이 존재하면  
					// 세션값이 "admin" 같으면 
					if (sId != null) {
						if (sId.equals("admin")) {
				%>
				<input type="button" class="btn_3"
					onclick='location.href="QnA_BoardReplyForm.qa?QnA_num=<%=article.getQnA_num()%>&page=<%=nowPage%>" '
					value="답변">
				<%
					}
						// 세션값이 존재하면  
						// 세션값이 "admin" 같으면 
						else if (sId.equals(writer)) {
				%>
					<input type="button" class="btn_3"
					onclick='location.href="QnA_BoardModifyForm.qa?QnA_num=<%=article.getQnA_num()%>&page=<%=nowPage%>" '
					value="수정">
					<input type="button" class="btn_3"
					onclick='location.href="QnA_BoardDeleteForm.qa?QnA_num=<%=article.getQnA_num()%>&page=<%=nowPage%>" '
					value="삭제">
				<%
					}
					}
				%>
						<input type="button" class="btn_3"
					onclick='location.href="QnA_BoardList.qa?page=<%=nowPage%>" '
					value="목록">
			</section>
		</div>
	</section>
	<jsp:include page="../assets/foot.jsp"></jsp:include>