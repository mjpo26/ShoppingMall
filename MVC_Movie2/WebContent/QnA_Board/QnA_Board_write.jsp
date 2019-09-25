<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
#registForm {
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
	<!-- 게시판 글 등록 -->
	<section id="writeForm">
		<h2>게시판 글 등록</h2>
		<form action="QnA_BoardWritePro.qa" method="post"
			enctype="multipart/form-data" name="boardform">
			<table>
				<tr>
					<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
					<td class="td_left"><label for="QnA_writer_id">ID</label></td>
					<td class="td_right"><input type="text" name="QnA_writer_id"
						id="QnA_writer_id" value="<%=sId%>" readonly="readonly"
						required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="QnA_pass">비밀번호</label></td>
					<td class="td_right"><input type="password" name="QnA_pass"
						id="QnA_pass" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="QnA_subject">문의내용</label></td>
					<td class="td_right"><select name="QnA_subject">
							<option value="" selected>--선택--</option>
							<option value="상품 문의">상품 문의</option>
							<option value="입금/결제 문의">입금/결제 문의</option>
							<option value="배송문의">배송문의</option>
							<option value="배송전 변경/취소문의">배송전 변경/취소문의</option>
							<option value="배송후 교환/환불문의">배송후 교환/환불문의</option>
					</select></td>
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
					<td class="td_left"><label for="QnA_file1">파일첨부</label></td>
					<td class="td_right"><input type="file" name="QnA_file1"
						id="QnA_file1" /></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록" />&nbsp;&nbsp; <input type="reset"
					value="다시쓰기" />
			</section>
		</form>
	</section>
</body>
</html>















