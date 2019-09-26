<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String sId = (String)session.getAttribute("sId");

    %>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="icon" href="./assets/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> 
    <!-- animate CSS -->
    <link rel="stylesheet" href="./assets/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/css/lightslider.min.css">
    
    
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="./assets/css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="./assets/css/flaticon.css">
    <link rel="stylesheet" href="./assets/css/themify-icons.css">
    <!-- select form -->
    <link rel="stylesheet" href="./assets/css/nice-select.css">
    
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="./assets/css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="./assets/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="./assets/css/style.css">
</head>

<body>



  <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="index.html"> <img src="./assets/img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="./main.ma">메인</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        상품
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="./product_list.sh">상품 목록</a>
                                        <a class="dropdown-item" href="./productDetail.sh?Item_code=1&page=1">상세페이지</a>
                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                     	회원관리
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_3">
                                    <% if(sId==null){ %>
                                        <a class="dropdown-item" href="./MemberJoinForm.me">회원가입</a>
                                        <a class="dropdown-item" href="./MemberLoginForm.me"> 로그인</a>
                                    <%}else{ %>
                                        <a class="dropdown-item" href="./MemberInfo.me">회원정보</a>
                                        <a class="dropdown-item" href="./MemberLogoutPro.me"> 로그아웃</a>
                                    
                                    <%} %>
                                        <a class="dropdown-item" href="./BasketInfo.bl">장바구니</a>
                                        <a class="dropdown-item" href="./orderInfo.sh">주문 목록</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_2"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        게시판
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="./Free_BoardList.bo">공지사항</a>
                                        <a class="dropdown-item" href="./QnA_BoardList.qa">Q&A게시판</a>
                                        <a class="dropdown-item" href="./ReviewBoardList.re">이벤트게시판</a>
                                        <a class="dropdown-item" href="./ReviewBoardList.re">리뷰게시판</a>
                                    </div>
                                </li>
                     
                                <%
                                if(sId!=null && sId.equals("admin")) {%>
                               	   <li class="nav-item">
                                       <a class="nav-link" href="./admin.ma">관리자</a>
                                   </li>
								<%}
                                %>
                                
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <a href=""><i class="ti-heart"></i></a>
                            <div class="dropdown cart">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown3" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-cart-plus"></i>
                                </a>
                                <!-- <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <div class="single_product">
    
                                    </div>
                                </div> -->
                                
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>

    <!-- Header part end-->
