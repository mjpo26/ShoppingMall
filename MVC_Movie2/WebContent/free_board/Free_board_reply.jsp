<%@page import="vo.Free_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전달받은 BoardBean 객체 가져오기
	Free_BoardBean article = (Free_BoardBean)request.getAttribute("article");
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
		<form action="Free_BoardReplyPro.bo" method="post" name="replyForm">
			<input type="hidden" name="page" value="<%=nowPage %>">
			<input type="hidden" name="free_num" value="<%=article.getFree_num() %>">
			<input type="text" name="free_ref" value="<%=article.getFree_ref() %>">
			<input type="hidden" name="free_lev" value="<%=article.getFree_lev() %>">
			<input type="hidden" name="free_seq" value="<%=article.getFree_seq() %>">
			<table>
				<tr>
					<td class="td_left"><label for="free_writer_id">ID</label></td>
					<td class="td_right"><input type="text" name="free_writer_id"  id="free_writer_id" value="<%=article.getFree_writer_id()%>"required="required" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="free_pass">비밀번호</label></td>
					<td class="td_right"><input type="password" name="free_pass" id="free_pass" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="free_subject">제목</label></td>
					<td class="td_right"><input type="text" name="free_subject" id="free_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="free_content">내용</label></td>
					<td class="td_right">
						<textarea name="free_content" id="free_content" cols="40" rows="15" required="required" >
						-------------------------------
						<%=article.getFree_content() %></textarea>
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