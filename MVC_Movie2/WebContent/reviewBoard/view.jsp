<%@page import="vo.ReviewBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ReviewBoardBean article = (ReviewBoardBean) request.getAttribute("article");

	String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: pink;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>
<body>
	<section id="articleForm">
		<section id="basicInfoArea">
			제목:
			<%=article.getReview_subject()%> <br>
			별점:
			<%=article.getReview_starPoint()%>점
		</section>
		<section id="articleContentArea">
			<%=article.getReview_content()%>
			<img src="../image/<%=article.getReview_file1()%>" width="300"
				height="300">
		</section>
		<section id="commandList">
			<a
				href="ReviewBoardModifyForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[수정]</a>
			<a
				href="ReviewBoardDeleteForm.re?review_num=<%=article.getReview_num()%>&page=<%=nowPage%>">[삭제]</a>
			<a href="ReviewBoardList.re?page=<%=nowPage%>">[목록]</a> &nbsp;&nbsp;
		</section>
			</section>
		<section>
			<form action="ReviewBoardCommentWritePro.re" method="post"
				enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="review_writer"></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td><textarea name="review_content" rows="10" cols="20"></textarea></td>
					</tr>
				</table>
				<div>
					<input type="submit" value="댓글달기" class="btn">
				</div>
			</form>
		</section>
</body>
</html>