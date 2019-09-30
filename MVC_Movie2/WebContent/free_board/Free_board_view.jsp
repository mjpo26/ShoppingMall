<%@page import="vo.Free_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 전달받은 request 객체에서 데이터 가져오기
	Free_BoardBean article = (Free_BoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	String sId = (String) session.getAttribute("sId");

	if (sId == null) {
		sId = "비회원";
	}
%>

<jsp:include page="../main/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>공지사항</h2>
						<p>
							공지사항 <span>-</span>공지사항
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
					<h3><%=article.getFree_subject()%></h3>
				</div>
				<div class="review_score mt-0">
					<span class="content_gray"> &nbsp;&nbsp; | &nbsp;&nbsp;작성자 :
						관리자 <br> &nbsp;| &nbsp;&nbsp;첨부파일 : <%
 	if (article.getFree_file1() != null) {
 %> <a href="file_down?downFile=<%=article.getFree_file1()%>"><%=article.getFree_file1()%></a>
						<%
							}
						%>
					</span>
				</div>
				<hr>
				<div class="content_content">
					<%=article.getFree_content()%>
				</div>
			</div>
			<hr>
			<section id="commandList">
				<%
					if (sId != null && sId.equals("admin")) {
				%>
				<input type="button" class="btn_3"
					onclick='location.href="Free_BoardModifyForm.bo?free_num=<%=article.getFree_num()%>&page=<%=nowPage%>" '
					value="수정"> <input type="button" class="btn_3"
					onclick='location.href="Free_BoardDeleteForm.bo?free_num=<%=article.getFree_num()%>&page=<%=nowPage%>" '
					value="삭제">
				<%
					}
				%>
				<input type="button" class="btn_3"
					onclick='location.href="Free_BoardList.bo?page=<%=nowPage%>"'
					value="목록">
			</section>
		</div>
	</section>

	<jsp:include page="../main/foot.jsp"></jsp:include>