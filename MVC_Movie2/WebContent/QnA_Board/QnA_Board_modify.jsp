<%@page import="vo.QnA_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// BoardBean 객체(article) 가져오기
	QnA_BoardBean article = (QnA_BoardBean) request.getAttribute("article");
	//page 파라미터 값 가져오기(page 식별자 지정 불가) => page 디렉티브 때문에 JSP의 예약어로 취급됨
	String nowPage = request.getParameter("page");
%>

<%
	// 세션 아이디 가져오기
	String sId = (String) session.getAttribute("sId");

	// 세션 아이디 없으면 Main.qa 로 이동
	if (sId == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 메뉴입니다!')");
		out.println("location.href='Main.qa'");
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
							QnA게시판 <span>-</span> 글수정
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</head>
<body>

	<section class="review_board_content board_content">
		<div class="container">
			<div class="review_content col-lg-8 mx-auto mt-5 p-5">
				<form action="QnA_BoardModifyPro.qa" enctype="multipart/form-data" method="post" name="boardForm"
					onsubmit="return modifyBoard(<%=article.getQnA_pass()%>)">
					<input type="hidden" name="QnA_num" value="<%=article.getQnA_num()%>" /> 
					<input type="hidden" name="page" value="<%=nowPage%>" />
					<table class="table">
						<tr>
							<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
							<td class="td_left"><label for="QnA_writer_id">ID</label></td>
							<td class="td_right"><input type="text" name="QnA_writer_id"
								id="QnA_writer_id" value="<%=article.getQnA_writer_id()%>"
								readonly="readonly" required="required" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
						<td><input type="password" name="QnA_pass" class="form-control" placeholder="글을 수정,삭제할때 입력할 비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="QnA_subject">문의내용</label></td>
							<td class="td_right">
							<select name="QnA_subject">
							<option value="" selected>--선택--</option>
							<option value="상품 문의">상품 문의</option>
							<option value="입금/결제 문의">입금/결제 문의</option>
							<option value="배송문의">배송문의</option>
							<option value="배송전 변경/취소문의">배송전 변경/취소문의</option>
							<option value="배송후 교환/환불문의">배송후 교환/환불문의</option>
							</select></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td colspan="3"><input type="file" name="review_file1" class="form-control-file"></td>
						</tr>
						
						<tr>
							<td class="td_left"><label for="QnA_content">내용</label></td>
							<td class="td_right"><textarea name="QnA_content"
									id="QnA_content" cols="40" rows="15" required="required"><%=article.getQnA_content()%></textarea></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="submit" value="글쓰기"
								class="genric-btn primary radius submit"> <input
								type="reset" value="취소" class="genric-btn default radius"
								onclick="history.back()"></td>

						</tr>
					</table>

				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../main/foot.jsp"></jsp:include>
	
	
	
	
	
	
	
	
	
	
	
	
	