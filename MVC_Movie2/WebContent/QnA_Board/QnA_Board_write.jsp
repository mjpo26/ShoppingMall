<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.MemberBean"%>
<!DOCTYPE html>
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
	
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
%>

<jsp:include page="../assets/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2></h2>
						<p>
							리뷰 보기 <span>-</span> 상품 리뷰 보기
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
				<form action="./QnA_BoardWritePro.qa" method="post" enctype="multipart/form-data" name="boardform">
					<table class="table">
					<td class="td_left"><label for="QnA_writer_id">ID</label></td>
					<td class="td_right"><input type="text" name="QnA_writer_id"
						id="QnA_writer_id" value="<%=sId%>" readonly="readonly"
						required="required" /></td>
						<tr>
							<td>비밀번호
						
							</td>
							<td>
							
							<input type="password" name="review_pass" class="form-control" placeholder="글을 수정,삭제할때 입력할 비밀번호를 입력하세요"></td>
						
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
									id="QnA_content" cols="40" rows="15" required="required">
주문번호:
입금은행:
입금자 성함:
문의내용:
							
주문번호를 꼭 입력해주세요~~~! ^^
						</textarea></td>
						</tr>
						
						<tr>
						<th></th>
						<td> 
						<input type="submit" value="글쓰기" class="genric-btn primary radius submit">
						<input type="reset" value="취소" class="genric-btn default radius" onclick="history.back()">
						</td>
						
						</tr>
					</table>
				
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../assets/foot.jsp"></jsp:include>















