<%@page import="vo.EventBean"%>
<%@page import="vo.EventBean"%>
<%@page import="vo.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	EventBean article = (EventBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	EventBean eventBean = (EventBean) request.getAttribute("EventBean");
%>
<jsp:include page="../assets/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>이벤트 게시판</h2>
						<p>
							이벤트 보기 <span>-</span> 이밴트상세
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</head>
<body>
	<section class="Event_board_content board_content">
		<div class="container">
			<div class="Event_content mt-5 p-5">
				<span class="content_gray content_item"> 이벤트 상세페이지</span>
				<div class="content_title mt-1">
					<h3><%=article.getEvent_subject()%></h3>
				</div>
				<div class="Event_score mt-0">
					<span class="content_gray"> &nbsp;&nbsp; | &nbsp;&nbsp;작성자 :
						관리자</span>
				</div>
				<hr>
				<div class="content_content">
					<div class="content_img mb-3">
						<img src="./upload/event/<%=article.getEvent_imageMain()%>">
					</div>
					<%=article.getEvent_content()%>
				</div>
				<hr>
				<input type="button" class="btn_3"
					onclick='location.href="./ReviewBoardList.re?page=<%=nowPage%>"'
					value="목록"> <input type="button" class="btn_3"
					onclick='location.href="./EventBoardUpdateForm.event?event_num=<%=article.getEvent_num()%>"'
					value="수정">
	</section>


	<jsp:include page="../assets/foot.jsp"></jsp:include>