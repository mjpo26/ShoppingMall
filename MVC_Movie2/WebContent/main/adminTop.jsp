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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자페이지</title>
  <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> 
  <link rel="stylesheet" href="./assets/css/themify-icons.css">
  <link rel="stylesheet" href="./dist/summernote-lite.css">  
  <link rel="stylesheet" href="./main/admin.css">
<!--   <link rel="stylesheet" href="./assets/css/all.css"> -->
  

</head>
<body>

    <div id="wrap">

        <nav id="sideMenu">
        
            <div class="sideMenu">
            	
                <ul class="mainMenu">
                	<li onclick="location.href='./admin.ma'"><i class="ti-home"></i></li>
                	<li>쇼핑몰 페이지
                        <ul class="subMenu">
                            <li><a href="./main.ma">쇼핑몰 메인</a></li>
                            <li><a href="./productList.sh">상품페이지</a></li>
                            <li><a href="./ReviewBoardList.re">리뷰페이지</a></li>
                            <li><a href="./product_list.sh">장바구니</a></li>
                            <li><a href="./productInfo.sh">구매목록</a></li>
                        </ul>
                    </li>
                    <li>상품관리
                        <ul class="subMenu">
                            <li><a href="./Item_insertform.sh">상품등록</a></li>
                            <li><a href="./productList.sh">상품목록</a></li>
                            <li><a href="./admin/product_category.jsp">상품분류관리</a></li>
                            <li><a href="./product_list.sh">test목록</a></li>
                        </ul>
                    </li>
                    <li>주문관리
                        <ul class="subMenu">
                            <li><a href="./orderList.ol">주문관리</a></li>
                            <li><a>주문상태변경</a></li>
                        </ul>
                    </li>
                    <li>고객관리
                        <ul class="subMenu">
                            <li><a href="./Admin_memberList.me">관리자 멤버리스트</a></li>
                        
                        </ul>
                    
                    </li>

                    <li>게시판관리
                        <ul class="subMenu">
                            <li><a href="./AdminBoardList.admin">관리자 게시판리스트</a></li>
                            <li><a href="./Free_BoardList.bo">Free_board</a></li>
                            <li><a href="./ReviewBoardList.re">Review_board</a></li>
                            <li><a href="./QnA_BoardList.qa">QnA_board</a></li>
                            <li><a href="./EventBoard.me">관리자 이벤트게시판</a></li>
                        </ul>

                    </li>

                    <li>기타페이지
                        <ul class="subMenu">
                            <li><a href="./MemberInfo.me">회원정보수정</a></li>
                            <li><a href="./BasketInfo.bl">장바구니</a></li>
                            <li><a href="./productInfo.sh">구매목록</a></li>
                            <li><a href="./orderPro.sh">결제페이지</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

     
     
        <div id="main">
            <header id="header">
                <div class="container">
                    <div class="header">
                        <div class="login">
				        <%if(sId != null) { %>
                            <a class="member_id" href="./MemberInfo.me"><%=sId %>님</a><a href="./MemberLogoutPro.me">로그아웃</a> 
                        <%} else { %>   
                            <a href="./MemberLoginForm.me">로그인</a> 
                        <%} %>
                        </div>