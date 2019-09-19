<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int num=  Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>
<meta charset="UTF-8">
<title>Inserttitle here</title>
</head>
<body>
	<!-- 게시판 -->
	<article>
		<h1>Notice Write</h1>
		<!-- enctype="multipart/form-data" -->
		<form action="ReviewBoardWritePro.re" method="post" 
			enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=num%>">
			<table>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="review_writer"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="review_id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="review_pass"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="review_subject"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3"><input type="file" name="review_file1"></td>
				</tr>
				<tr>
					<td>별 점</td>
					<td>
					    <input type="radio" name="review_starPoint" value="1">1
						<input type="radio" name="review_starPoint" value="2">2 
						<input type="radio" name="review_starPoint" value="3">3 
						<input type="radio" name="review_starPoint" value="4">4
					    <input type="radio" name="review_starPoint" value="5">5</td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea name="review_content" rows="10" cols="20"></textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="글쓰기" class="btn">
			</div>
		</form>
	</article>
</body>
</html>