<%@page import="vo.QnA_BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="vo.AdminBoardSearchBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AdminBoardSearchBean abb = new AdminBoardSearchBean();
	abb = (AdminBoardSearchBean) request.getAttribute("abb");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 날짜선택 임포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 날짜선택임포트 끝 -->

<!-- 날짜선택 스크립트 -->
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>

<script type = "text/javascript">
function pickNullCheck(){
	if(document.fr1.pickStart.value==""){
//		document.fr1.pickStart.value=="2015-01-01";
		var pickStart = $('#pickStart').val('01/01/2010');

		return false;
	}
	if(document.fr1.pickEnd.value==""){
 	//	document.fr1.pickEnd.value=="2020-01-01";
		var pickEnd =  $('#pickEnd').val('01/01/2020');
	
		return false;
	}
	if(document.fr1.list.value==""){
	 	alert("검색 할 게시판 선택은 필수입니다.")
		
			return false;
		}
	//
	
	
}

</script>
<!-- 날짜선택 스크립트 끝 -->
<title>Insert title here</title>
</head>
<body>
	<!-- 폼 선택!!!!!!!!!!!!!!-->
	<form action="./AdminBoardList.abl" name="fr1" method="post" onsubmit="return pickNullCheck()">
		<table border="1">
			<tr>
				<th colspan='10'>관리자 게시물 관리</th>
			</tr>
		<tr>
			<th>기간검색</th>
			<td>시작날짜:<input type="text" name="pickStart" id="pickStart">
				끝 날짜:<input type="text" name="pickEnd" id="pickEnd"></td>
		</tr>
			<tr>
				<th>게시판 선택 *필수*</th>
				<td colspan='12'><select name="list">
						<option value="">게시판목록</option>
						<option value="리뷰게시판">리뷰게시판</option>
						<option value="QnA게시판">QnA게시판</option>
				</select></td>
			</tr>
			<tr>
				<th>내용 검색</th>
				<td colspan='12'><label>제 목</label> <input type="text"
					size="20" name="title"><br> <label>작성자</label> <input
					type="text" size="20" name="writer">
			</tr>

			<tr>
				<th>답변여부</th>
				<td colspan='12'><input type="radio" name="replyCheck"
					value="*">전체 <input type="radio" name="replyCheck"
					value="0">답변전 <input type="radio" name="replyCheck"
					value="1">답변완료</td>
			</tr>
			<tr>
				<td colspan='12'><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>

	<%
		if (abb.getBoard_list() == null) {
	%>
	<br>
	<table border="1">
		<tr>
			<th colspan='12'>게시판 검색목록</th>
		</tr>
		<tr>
			<td colspan='12'>[검색결과0건]
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp; <select>
					<option>정렬방식</option>
					<option>오름차순</option>
					<option>내림차순</option>

			</select><select>
					<option>10개</option>
					<option>20개</option>
					<option>50개</option>
			</select>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변상태</th>
			<th>게시글보기</th>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>

	</table>
	<!-- 리뷰게시판 게시판!!!!!!!!!!!!!! -->
	<%
		} else if (abb.getBoard_list().equals("리뷰게시판")) {
			ArrayList<ReviewBoardBean> boardList = (ArrayList<ReviewBoardBean>) request.getAttribute("boardList");
			PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
			int listCount = pageInfo.getListCount();
			int nowPage = pageInfo.getPage();
			int startPage = pageInfo.getStartPage();
			int endPage = pageInfo.getEndPage();
			int maxPage = pageInfo.getMaxPage();
	%>
	<br>
	<table border="1">
		<tr>
			<th colspan='12'>리뷰게시판 검색목록</th>
		</tr>
		<tr>
			<td colspan='12'>[검색결과 <%=listCount%>건]
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp; <select>
					<option>정렬방식</option>
					<option>오름차순</option>
					<option>내림차순</option>

			</select><select>
					<option>10개</option>
					<option>20개</option>
					<option>50개</option>
			</select>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변상태</th>
			<th>게시글보기</th>
		</tr>
		<%
			for (int i = 0; i < boardList.size(); i++) {
					// 				String[] reviewStatus = new String[100];
					if (boardList.get(i).getReview_re_lev() != 0)
						continue; //답변은 표시안함
		%>
		<tr>
			<td><input type="checkbox"></td>
			<td><%=boardList.get(i).getReview_num()%></td>
			<td><%=boardList.get(i).getReview_subject()%></td>
			<td><%=boardList.get(i).getReview_writer()%></td>
			<td><%=boardList.get(i).getReview_date()%></td>
			<td>
				<%
					if (boardList.get(i).getReview_replycount().equals("1")) {
				%> 답변완료 <%
					} else {
				%> 답변전 <%
					}
				%>
			</td>
			<td><a
				href="ReviewBoardDetail.re?review_num=<%=boardList.get(i).getReview_num()%>&page=<%=nowPage%>"><input
					type="button" value="게시글 보기"></a></td>
		</tr>
		<%
			}
		%>
	</table>
	<!-- QnA 게시판!!!!!!!!!!!!!! -->

	<%
		} else if (abb.getBoard_list().equals("QnA게시판")) {
			ArrayList<QnA_BoardBean> boardList = (ArrayList<QnA_BoardBean>) request.getAttribute("boardList");
			PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
			int listCount = pageInfo.getListCount();
			int nowPage = pageInfo.getPage();
			int startPage = pageInfo.getStartPage();
			int endPage = pageInfo.getEndPage();
			int maxPage = pageInfo.getMaxPage();
	%>
	<table border="1">

		<tr>
			<th colspan='12'>QnA게시판 검색목록</th>
		</tr>
		<tr>
			<td colspan='12'>[검색결과 <%=listCount%>건]
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp; <select>
					<option>정렬방식</option>
					<option>오름차순</option>
					<option>내림차순</option>

			</select><select>
					<option>10개</option>
					<option>20개</option>
					<option>50개</option>
			</select>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변상태</th>
			<th>게시글보기</th>
		</tr>
		<%
			for (int i = 0; i < boardList.size(); i++) {
					// 				String[] reviewStatus = new String[100];
					if (boardList.get(i).getQnA_re_lev() != 0)
						continue;
		%>
		<tr>
			<td><input type="checkbox"></td>
			<td><%=boardList.get(i).getQnA_num()%></td>
			<td><%=boardList.get(i).getQnA_subject()%></td>
			<td><%=boardList.get(i).getQnA_writer_id()%></td>
			<td><%=boardList.get(i).getQnA_date()%></td>
			<td>
				<%
					if (boardList.get(i).getQnA_replycount().equals("1")) {
				%> 답변완료 <%
					} else {
				%> 답변전 <%
					}
				%> 
			</td> 
			<td><a
				href="ReviewBoardDetail.re?review_num=<%=boardList.get(i).getQnA_num()%>&page=<%=nowPage%>"><input
					type="button" value="게시글 보기"></a></td>
		</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>