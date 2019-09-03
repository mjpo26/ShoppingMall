<%@page import="vo.QnA_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전달받은 BoardBean 객체 가져오기
	QnA_BoardBean article = (QnA_BoardBean)request.getAttribute("article");
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
		<form action="QnA_BoardReplyPro.bo" method="post" name="replyForm">
			<input type="hidden" name="page" value="<%=nowPage %>">
			<input type="hidden" name="QnA_num" value="<%=article.getQnA_num() %>">
			<input type="text" name="QnA_re_ref" value="<%=article.getQnA_re_ref() %>">
			<input type="hidden" name="QnA_re_lev" value="<%=article.getQnA_re_lev() %>">
			<input type="hidden" name="QnA_re_seq" value="<%=article.getQnA_re_seq() %>">
			<table>
				<tr>
					<td class="td_left"><label for="QnA_writer_id">ID</label></td>
					<td class="td_right"><input type="text" name="QnA_writer_id"  id="QnA_writer_id" value="<%=article.getQnA_writer_id()%>"required="required" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="QnA_pass">비밀번호</label></td>
					<td class="td_right"><input type="password" name="QnA_pass" id="QnA_pass" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="QnA_subject">제목</label></td>
					<td class="td_right"><input type="text" name="QnA_subject" id="QnA_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="QnA_content">내용</label></td>
					<td class="td_right">
						<textarea name="QnA_content" id="QnA_content" cols="40" rows="15" required="required" >
						-------------------------------
						<%=article.getQnA_content() %></textarea>
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