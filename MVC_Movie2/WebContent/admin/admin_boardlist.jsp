<%@page import="vo.QnA_BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="vo.AdminBoardSearchBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ReviewBoardBean> boardList = (ArrayList<ReviewBoardBean>) request.getAttribute("boardList");
	// 	ArrayList<QnA_BoardBean> QboardList = (ArrayList<QnA_BoardBean>) request.getAttribute("QboardList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
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
<title>Insert title here</title>
</head>
<body>
	<form action="./AdminBoardList.abl" name="fr" method="post">
		<table border="1">
			<tr>
				<th colspan='10'>관리자 게시물 관리</th>
			</tr>
			<tr>
				<th>기간 관리</th>
				<td colspan='5'><select>
						<option>오늘</option>
						<option>7일</option>
						<option>15일</option>
						<option>1개월</option>
				</select></td>
				<td colspan='5'>날짜선택 <input type="date" value="2019-08-23"></td>
			</tr>
			<tr>
				<td>게시판 선택</td>
				<td colspan='12'><select name="list">
						<option>게시판목록</option>
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
					value="답변전">답변전 <input type="radio" name="replyCheck"
					value="답변완료">답변완료</td>
			</tr>
			<tr>
				<td colspan='12'><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>

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
// 				if (i!= boardList.size()) {
// 					for (int j = 0; j < i; j++) {
// 						if (boardList.get(j).getReview_re_ref() == boardList.get(i).getReview_re_ref()) {
// 							reviewStatus[i] = "답변전";
// 							reviewStatus[j] =reviewStatus[i];
// 						}
// 					}
// 				} else {

// 					reviewStatus[i] = "답변완료";
// 				}
		%>
		<tr>
			<td><input type="checkbox"></td>
			<td><%=boardList.get(i).getReview_num()%></td>
			<td><%=boardList.get(i).getReview_subject()%></td>
			<td><%=boardList.get(i).getReview_writer()%></td>
			<td><%=boardList.get(i).getReview_date()%></td>
			<td>답변상태</td>
			<td><a
				href="ReviewBoardDetail.re?review_num=<%=boardList.get(i).getReview_num()%>&page=<%=nowPage%>"><input
					type="button" value="게시글 보기"></a></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>