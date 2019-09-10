<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 저장된 세션 아이디 가져오기
	String sId = (String)session.getAttribute("sId");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<!-- 세션 아이디가 있을 경우 로그아웃 링크(Logout.me) 표시, 없을 경우 로그인 링크(LoginForm.me) 표시 -->
		<p align="right">
		<%if(sId != null) { %>
			<a href="MemberInfo.me"><%=sId %>님</a> | <a href="MemberLogoutPro.me">로그아웃</a> 
		<%} else { %>	
			<a href="MemberLoginForm.me">로그인</a> 
		<%} %>
		</p>
	</header>
	<h1>메인페이지</h1>
	<h3><a href="MemberInfo.me">회원정보수정</a></h3>
		<h3><a href="./admin/product_update.jsp">상품등록</a></h3>
		<h3><a href="Free_BoardList.bo">Free_board리스트</a></h3>
		<h3><a href="OrderInsert.or">인서트오더</a></h3>
		<h3><a href="./admin/product_main.jsp">상품메인보기</a></h3>
		<h3><a href="./admin/orderList.ol">관리자_주문관리</a></h3>
		<h3><a href="orderList.ol">관리자_오더리스트</a></h3>
		<h3><a href="QnA_BoardList.qa">QnA_board리스트</a></h3>
		<h3><a href="ReviewBoardList.re">리뷰게시판</a></h3>
		<h3><a href="Admin_memberList.am">관리자 멤버리스트</a></h3>
<<<<<<< HEAD
		<h3><a href="AdminBoardList.abl">관리자 게시판리스트</a></h3>

=======

>>>>>>> branch 'master' of https://github.com/mjpo26/ShoppingMall.git
		<a href="Free_BoardWriteForm.bo"><input type="button" value="글쓰기"></a> 
		<a href="QnA_BoardWriteForm.qa"><input type="button" value="QnA_글쓰기"></a> 
		
		<h3><a href="BasketList.bl">카트Test</a></h3>
		<h3><a href="DeliveryList.dl">배송Test</a></h3>
</body>
</html>















