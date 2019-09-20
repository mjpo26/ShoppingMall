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

<jsp:include page="../assets/top.jsp"></jsp:include>
  
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
  
    <section class="review_board_list board_list">
    
		<div class="container">
			<section id="listForm">			
				<table class="table">
					<%
						if (articleList != null & listCount > 0) {
					%>
					<tr id="tr_top">
						<th width="100">번호</th>
						<td width="200">상품</td>
						<td width="400">제목</td>
						<td width="150">작성자</td>
						<td width="150">날짜</td>
						<td width="100">조회수</td>
					</tr>
					<%
						for (int i = 0; i < articleList.size(); i++) {
					%>
					<tr>
						<td align="center"><%=articleList.get(i).getReview_num()%></td>
						<td align="center"><img
							src="./image/<%=articleList.get(i).getReview_file1()%>"></td>
						<td>
							<%
								if (articleList.get(i).getReview_re_lev() != 0) {
							%> <%
		 	for (int j = 0; j <= articleList.get(i).getReview_re_lev() * 2; j++) {
		 %> &nbsp; <%
		 	}
		 %>▶ <%
		 	} else {
		 %> ▶ <%
		 	}
		 %> <a href="ReviewBoardDetail.re?review_num=<%=articleList.get(i).getReview_num()%>&page=<%=nowPage%>">
								<%=articleList.get(i).getReview_subject()%>
						</a>
						</td>
						<td align="center"><%=articleList.get(i).getReview_writer()%></td>
						<td align="center"><%=articleList.get(i).getReview_date()%></td>
						<td align="center"><%=articleList.get(i).getReview_readcount()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</section>
	
		<section id="writeButton">
			<a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
		</section>
	
		<section id="pageList">
			<%
				if (nowPage <= 1) {
			%>
			[이전]&nbsp;
			<%
				} else {
			%>
			<a href="ReviewBoardList.re?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
			<%
				}
			%>
	
			<%
				for (int i = startPage; i <= endPage; i++) {
						if (i == nowPage) {
			%>
			[<%=i%>]
			<%
				} else {
			%>
			<a href="ReviewBoardList.re?page=<%=i%>">[<%=i%>]
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
			&nbsp;[다음]
			<%
				} else {
			%>
			<a href="ReviewBoardList.re?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
			<%
				}
			%>
		</section>
		<%
			} else {
		%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
		<section id="writeButton">
			<a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
		</section>
		<%
			}
		%>
	  
  
	   </div>
   </section>
<jsp:include page="../assets/foot.jsp"></jsp:include>
    












