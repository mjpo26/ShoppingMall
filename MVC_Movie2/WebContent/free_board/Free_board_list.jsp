<%@page import="vo.Free_PageInfo"%>
<%@page import="vo.Free_BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<Free_BoardBean> articleList = (ArrayList<Free_BoardBean>) request.getAttribute("articleList");
	Free_PageInfo pageInfo = (Free_PageInfo) request.getAttribute("pageInfo");

	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();

	// 세션 아이디 가져오기
	String sId = (String) session.getAttribute("sId");

	// 만약, 회원만 게시판 목록 조회가 가능할 경우
	// 세션 아이디 없으면 Main.bo 로 이동
	if (sId == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 메뉴입니다!')");
		out.println("location.href='Main.bo'");
		out.println("</script>");
	}
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
	<header>
		<!-- 세션 아이디가 있을 경우 로그아웃 링크(Logout.me) 표시, 없을 경우 로그인 링크(LoginForm.me) 표시 -->
		<p align="right">
			<%
				if (sId != null) {
			%>
			<a href="MemberInfo.me"><%=sId%>님</a> | <a href="MemberLogoutPro.me">로그아웃</a>
			<%
				} else {
			%>
			<a href="MemberLoginForm.me">로그인</a>
			<%
				}
			%>
		</p>
	</header>
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>글 목록</h2>
		<table>
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
				<td align="center"><%=articleList.get(i).getFree_num()%></td>
				<td>
					<%
						if (articleList.get(i).getFree_lev() != 0) {
					%> <%
 	for (int j = 0; j <= articleList.get(i).getFree_lev() * 2; j++) {
 %>
					&nbsp; <%
 	}
 %>▶ <%
 	} else {
 %> ▶ <%
 	}
 %> <a
					href="Free_BoardDetail.bo?free_num=<%=articleList.get(i).getFree_num()%>&page=<%=nowPage%>">
						<%=articleList.get(i).getFree_subject()%>
				</a>
				</td>
				<td align="center"><%=articleList.get(i).getFree_writer_id()%></td>
				<td align="center"><%=articleList.get(i).getFree_date()%></td>
				<td align="center"><%=articleList.get(i).getFree_readcount()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>

	<section id="writeButton">
		<a href="Free_BoardWriteForm.bo"><input type="button" value="글쓰기"></a>
	</section>

	<section id="pageList">
		<%
			if (nowPage <= 1) {
		%>
		[이전]&nbsp;
		<%
			} else {
		%>
		<a href="Free_BoardList.bo?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
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
		<a href="Free_BoardList.bo?page=<%=i%>">[<%=i%>]
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
		<a href="Free_BoardList.bo?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
		<%
			}
		%>
	</section>
	<%
		} else {
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
		}
	%>
</body>
</html>


















