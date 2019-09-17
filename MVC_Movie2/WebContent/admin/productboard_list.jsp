<%@page import="vo.TestInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
    	ArrayList<ItemBean> articleList = (ArrayList<ItemBean>)request.getAttribute("articleList");
    	TestInfo pageInfo = (TestInfo)request.getAttribute("pageInfo");
    	
    	// PageInfo 객체로부터 페이징 정보 가져오기
    	int listCount = pageInfo.getListCount();
    	int nowPage = pageInfo.getPage();
    	int startPage = pageInfo.getStartPage();
    	int endPage = pageInfo.getEndPage();
    	int maxPage = pageInfo.getMaxPage();
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 800px;
		border: 1px solid darkgray;
	}
	
	a {
		text-decoration: none;
	}

	#tr_top {
		background: orange;
		width: 800px; 
		text-align: center;
	}
	
	#writeButton {
		margin: auto;
		width: 800px;
		text-align: right;
	}
	
	#pageList {
		margin: auto;
		width: 800px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 800px;
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>글 목록</h2>
		<table>
		<%if(articleList != null & listCount > 0) {%>
				<tr id="tr_top">
					<td width="100">번호</td>
					<td width="400">제목</td>
					<td width="150">작성자</td>
					<td width="150">날짜</td>
				</tr>
			<%for(int i = 0; i < articleList.size(); i++) {%>
					<tr>
						<td align="center"><%=articleList.get(i).getItem_code() %></td>
						<td>
						<a href="productDetail.sh?Item_code=<%=articleList.get(i).getItem_code()%>&page=<%=nowPage%>">
								<%=articleList.get(i).getItem_title() %>
							</a>
						</td>
						<td align="center">관리자</td>
						<td align="center"><%=articleList.get(i).getItem_Date() %></td>
					</tr>
			<%} %>
		</table>		
	</section>
	
	<section id="writeButton">
		<a href="BoardWriteForm.bo"><input type="button" value="글쓰기"></a>
	</section>
	
	<section id="pageList">
	<%if(nowPage <= 1) { %>
			[이전]&nbsp;
	<%} else {%>
			<a href="BoardList.bo?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) {
		    if(i == nowPage) {%>
				[<%=i %>]
		<%} else {%>
				<a href="BoardList.bo?page=<%=i %>">[<%=i %>]</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			&nbsp;[다음]
	<%} else { %>
			<a href="BoardList.bo?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
	<%} %>
	</section>
<%} else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
<%} %>
</body>
</html>


















