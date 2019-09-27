<%@page import="vo.PageInfo"%>
<%@page import="vo.QnA_BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<QnA_BoardBean> articleList = (ArrayList<QnA_BoardBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();

	// 세션 아이디 가져오기
	String sId = (String) session.getAttribute("sId");

	// 만약, 회원만 게시판 목록 조회가 가능할 경우
	// 세션 아이디 없으면 Main.qa 로 이동
	/* 	if (sId == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 메뉴입니다!')");
			out.println("location.href='Main.qa'");
			out.println("</script>");
		} */
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
							QnA 목록 <span>-</span> QnA 모음
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="cart_list shopping_cart mt-5">
	<div class="container">
		<div class="row clearfix">


			<table class="table">
				<%
					if (articleList != null & listCount > 0) {
				%>
				<tr id="tr_top">
					<td width="100">번호</td>
					<td width="400">제목</td>
					<td width="150">ID</td>
					<td width="150">날짜</td>
					<td width="100">조회수</td>
				</tr>
				<%
					for (int i = 0; i < articleList.size(); i++) {
				%>
				<tr>
					<td align="center"><%=articleList.get(i).getQnA_num()%></td>
					<td>
						<%
							if (articleList.get(i).getQnA_re_lev() != 0) {
						%> <%
 	for (int j = 0; j <= articleList.get(i).getQnA_re_lev() * 2; j++) {
 %> &nbsp; <%
 	}
 %>▶ <%
 	} else {
 %> <%
 	}
 %> <a
						href="QnA_BoardDetail.qa?QnA_num=<%=articleList.get(i).getQnA_num()%>&page=<%=nowPage%>">
							<%=articleList.get(i).getQnA_subject()%>
					</a>
					</td>
					<td align="center"><%=articleList.get(i).getQnA_writer_id()%></td>
					<td align="center"><%=articleList.get(i).getQnA_date()%></td>
					<td align="center"><%=articleList.get(i).getQnA_readcount()%></td>
				</tr>
				<%
					}
				%>

			</table>
		</div>
	</div>
</section>


<div id="pageList" class="text-center review_board board_paging">
	<%
		if (nowPage <= 1) {
	%>
	<i class="ti-angle-left text-black-50"></i> &nbsp;&nbsp;&nbsp;
	<%
		} else {
	%>
	<a href="QnA_BoardList.qa?page=<%=nowPage - 1%>"><i
		class="ti-angle-left"></i></a>&nbsp;&nbsp;&nbsp;
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
	<a href="QnA_BoardList.qa?page=<%=i%>"><%=i%>&nbsp; </a>
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
	<a href="QnA_BoardList.qa?page=<%=nowPage + 1%>">&nbsp;&nbsp;&nbsp;
		<i class="ti-angle-right"></i>
	</a>
	<%
		}
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
		href="QnA_BoardWriteForm.qa"> <input type="button" class="btn_3"
		value="글쓰기"></a>
</div>
<%
	} else {
%>
<section id="emptyArea">등록된 글이 없습니다.</section>
<%
	}
%>

<jsp:include page="../assets/foot.jsp"></jsp:include>





















