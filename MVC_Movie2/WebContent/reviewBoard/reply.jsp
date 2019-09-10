<%@page import="vo.ReviewBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전달받은 BoardBean 객체 가져오기
	ReviewBoardBean article = (ReviewBoardBean)request.getAttribute("article");
	String nowPage = request.getParameter("page"); // 현재 페이지 가져오기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#replyForm {
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
		width: 450px;
		border: 1px solid darkgray;
	}
	
	.td_left {
		width: 150px;
		background: orange;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 글 답변 -->
	<section id="writeForm">
		<h2>게시판 답변글 등록</h2>
		<form action="ReviewBoardReplyPro.re" method="post" name="replyForm">
			<input type="hidden" name="page" value="<%=nowPage %>">
			<input type="hidden" name="review_num" value="<%=article.getReview_num() %>">
			<input type="hidden" name="review_re_ref" value="<%=article.getReview_re_ref() %>">
			<input type="hidden" name="review_re_lev" value="<%=article.getReview_re_lev() %>">
			<input type="hidden" name="review_re_seq" value="<%=article.getReview_re_seq() %>">
			<table>
				<tr>
					<td class="td_left"><label for="review_writer">ID</label></td>
					<td class="td_right"><input type="text" name="review_writer"  id="review_writer" value="<%=article.getReview_writer()%>"required="required" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_pass">비밀번호</label></td>
					<td class="td_right"><input type="password" name="review_pass" id="review_pass" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_subject">제목</label></td>
					<td class="td_right"><input type="text" name="review_subject" id="review_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_content">내용</label></td>
					<td class="td_right">
					
						<textarea name="review_content" id="review_content" cols="40" rows="15" required="required" >
						-------------------------------
						<%=article.getReview_content() %></textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="답변글등록" />&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" />
			</section>
		</form>	
	</section>
</body>
</html>