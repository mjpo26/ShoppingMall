<%@page import="vo.QnA_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전달받은 BoardBean 객체 가져오기
	QnA_BoardBean article = (QnA_BoardBean)request.getAttribute("article");
	String nowPage = request.getParameter("page"); // 현재 페이지 가져오기
	// 세션 아이디 가져오기
	String sId = (String)session.getAttribute("sId");
	
	
	// 세션 아이디 없으면 Main.bo 로 이동
	if(sId == null) {
	    out.println("<script>");
	    out.println("alert('로그인이 필요한 메뉴입니다!')");
	    out.println("location.href='Main.bo'");
	    out.println("</script>");
	}else if(!sId.equals("admin")){
		out.println("<script>");
	    out.println("alert('관리자가 아닙니다!')");
	    out.println("location.href='Main.bo'");
	    out.println("</script>");
	}
%>    
<jsp:include page="../main/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2></h2>
						<p>
							QnA게시판 <span>-</span> 답글 쓰기
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</head>
<body>
	<!-- 게시판 글 답변 -->
	<section class="review_board_content board_content">
		<div class="container">
			<div class="review_content col-lg-8 mx-auto mt-5 p-5">
				<form action="QnA_BoardReplyPro.qa" method="post" name="replyForm">
				<input type="hidden" name="page" value="<%=nowPage %>">
				<input type="hidden" name="QnA_num" value="<%=article.getQnA_num() %>">
				<input type="hidden" name="QnA_re_ref" value="<%=article.getQnA_re_ref() %>">
				<input type="hidden" name="QnA_re_lev" value="<%=article.getQnA_re_lev() %>">
				<input type="hidden" name="QnA_re_seq" value="<%=article.getQnA_re_seq() %>">
				<table class ="table">
				<tr>
					<td class="td_left"><label for="QnA_writer_id">ID</label></td>
					<td class="td_right"><input type="text" name="QnA_writer_id"  id="QnA_writer_id" value="<%=sId%>"required="required" readonly="readonly"/></td>
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
			</div>
		</div>
	</section>
	<jsp:include page="../main/foot.jsp"></jsp:include>






