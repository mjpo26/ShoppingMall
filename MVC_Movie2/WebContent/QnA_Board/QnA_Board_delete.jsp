<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 전달받은 request 객체로부터 게시물 번호(QnA_num)와 페이지번호(page) 가져오기
	int QnA_num = Integer.parseInt(request.getParameter("QnA_num"));
	String nowPage = request.getParameter("page");
%>
<jsp:include page="../main/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>QnA게시판</h2>
						<p>
							QnA게시판 <span>-</span>QnA삭제
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<article id="content">
	<div class="container mainDiv">
		<section class="content product_insert">
			<form name="deleteForm"
				action="QnA_BoardDeletePro.qa?QnA_num=<%=QnA_num%>" method="post">
				<input type="hidden" name="page" value="<%=nowPage%>" />

				<table>
					<tr>
						<td><label>글 비밀번호 : </label></td>
						<td><input type="password" name="QnA_pass"></td>
					</tr>
					<tr>
						<td><input type="submit" value="삭제" /></td>
						<td><input type="reset" value="돌아가기" onclick="history.back()" /></td>
					</tr>
				</table>
			</form>
	</section>
	</div>
</article>

<jsp:include page="../main/foot.jsp"></jsp:include>