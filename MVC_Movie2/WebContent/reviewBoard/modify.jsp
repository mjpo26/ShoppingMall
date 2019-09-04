<%@page import="vo.ReviewBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// BoardBean 객체(article) 가져오기
	ReviewBoardBean article = (ReviewBoardBean) request.getAttribute("article");
	//page 파라미터 값 가져오기(page 식별자 지정 불가) => page 디렉티브 때문에 JSP의 예약어로 취급됨
	String nowPage = request.getParameter("page");
%>

<%
	//         	// 세션 아이디 가져오기
	//         	String sId = (String)session.getAttribute("sId");

	//         	// 세션 아이디 없으면 Main.re 로 이동
	//         	if(sId == null) {
	//         	    out.println("<script>");
	//         	    out.println("alert('로그인이 필요한 메뉴입니다!')");
	//         	    out.println("location.href='Main.re'");
	//         	    out.println("</script>");
	//         	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
	function modifyBoard(password) {
		// DB 에 저장된 패스워드(password)와 폼태그에 입력된 패스워드(Review_pass) 비교
		// 		if(password != boardForm.Review_pass.value) { // 패스워드 불일치 시
		// 			alert('패스워드 불일치')
		// 			return false
		// 		}

		return true

		// 만약, 비즈니스 로직에서 별도로 패스워드를 확인할 경우 현재 자바스크립트 생략 가능
	}
</script>
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
	<!-- 게시판 글 수정 -->
	<section id="writeForm">
		<h2>게시판 글 수정</h2>
		<%-- 		onsubmit="return modifyBoard(<%=article.getReview_pass()%>)" --%>
		<form action="ReviewBoardModifyPro.re" method="post" name="boardForm">
			<input type="hidden" name="review_num"
				value="<%=article.getReview_num()%>" /> <input type="hidden"
				name="page" value="<%=nowPage%>" />
			<table>
				<tr>
					<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
					<td class="td_left"><label for="review_writer">작성자</label></td>
					<td class="td_right"><input type="text" name="review_writer"
						id="review_writer" value="<%=article.getReview_writer()%>"
						readonly="readonly" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_pass">비밀번호</label></td>
					<td class="td_right"><input type="password" name="review_pass"
						id="review_pass" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_subject">제목</label></td>
					<td class="td_right"><input type="text" name="review_subject"
						id="review_subject" value="<%=article.getReview_subject()%>"
						required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_subject">별점</label></td>
					<td class="td_right">
					    <input type="radio" name="review_starPoint" value="1">1
						<input type="radio" name="review_starPoint" value="2">2 
						<input type="radio" name="review_starPoint" value="3">3 
						<input type="radio" name="review_starPoint" value="4">4
					    <input type="radio" name="review_starPoint" value="5">5</td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_file1">이미지</label></td>
					<td class="td_right"><input type="file" name="review_file1"><%=article.getReview_file1()%></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_content">내용</label></td>
					<td class="td_right"><textarea name="review_content"
							id="review_content" cols="40" rows="15" required="required"><%=article.getReview_content()%></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록" />&nbsp;&nbsp; <input type="button"
					value="뒤로" onclick="history.back()" />
			</section>
		</form>
	</section>
</body>
</html>















