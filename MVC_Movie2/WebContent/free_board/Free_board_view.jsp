<%@page import="vo.Free_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전달받은 request 객체에서 데이터 가져오기
	Free_BoardBean article = (Free_BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#articleForm {
		width: 500px;
		height: 500px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	#basicInfoArea {
		height: 40px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto; /* 지정 영역 크기 이상일 경우 자동으로 스크롤바 생성*/
	}
		
	#commandList {
		matgin: auto;
		width: 500;
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 글 조회 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : <%=article.getFree_subject() %><br>
			첨부파일 : 
			<%if(article.getFree_file1() != null) { %>
					<a href="file_down?downFile=<%=article.getFree_file1()%>"><%=article.getFree_file1() %></a>
			<%}%>
		</section>
		<section id="articleContentArea">
			<%=article.getFree_content() %>	
		</section>
	</section>
	<section id="commandList">
		<a href="Free_BoardReplyForm.bo?free_num=<%=article.getFree_num()%>&page=<%=nowPage %>"><input type="button" value="답변" ></a>
		<a href="Free_BoardModifyForm.bo?free_num=<%=article.getFree_num()%>&page=<%=nowPage %>"><input type="button" value="수정" ></a>
		<a href="Free_BoardDeleteForm.bo?free_num=<%=article.getFree_num()%>&page=<%=nowPage %>"><input type="button" value="삭제" ></a>
		<a href="Free_BoardList.bo?page=<%=nowPage %>"><input type="button" value="목록" ></a>
	</section>
</body>
</html>






























