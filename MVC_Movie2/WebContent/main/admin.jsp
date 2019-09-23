<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
  <link rel="stylesheet" href="./main/admin.css">
  <%
    // 저장된 세션 아이디 가져오기
    String sId = (String)session.getAttribute("sId");
  %>  

</head>
<body>

    <div id="wrap">


        <nav id="sideMenu">
            <nav class="sideMenu">
                <ul class="mainMenu">
                    <li>상품관리
                        <ul class="subMenu">
                            <li><a href="./Item_insertform.sh">상품등록</a></li>
                            <li><a href="productList.sh">상품목록</a></li>
                            <li><a href="./admin/product_category.jsp">상품분류관리</a></li>
                            <li><a href="./product_list.sh">test목록</a></li>
                        </ul>
                    </li>
                    <li>주문관리
                        <ul class="subMenu">
                            <li><a href="orderList.ol">주문관리</a></li>
                            <li><a>주문상태변경</a></li>
                        </ul>
                    </li>
                    <li>고객관리
                        <ul class="subMenu">
                            <li><a href="Admin_memberList.am">관리자 멤버리스트</a></li>
                        
                        </ul>
                    
                    </li>

                    <li>게시판관리
                        <ul class="subMenu">
                            <li><a href="AdminBoardList.abl">관리자 게시판리스트</a></li>
                            <li><a href="Free_BoardList.bo">Free_board</a></li>
                            <li><a href="ReviewBoardList.re">Review_board</a></li>
                            <li><a href="QnA_BoardList.qa">QnA_board</a></li>
                        </ul>

                    </li>

                    <li>기타페이지
                        <ul class="subMenu">
                            <li><a href="MemberInfo.me">회원정보수정</a></li>
                            <li><a href="BasketInfo.bl">장바구니</a></li>
                            <li><a href="productInfo.sh">구매목록</a></li>
                            <li><a href="orderPro.sh">결제페이지</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </nav>

        <div id="main">

            <header id="header">
                <div class="container">

                    <div class="header">
                        <h3>관리자 페이지 메인</h3>
                        <div class="login">
				        <%if(sId != null) { %>
                            <a class="member_id" href="./MemberInfo.me"><%=sId %>님</a><a href="./MemberLogoutPro.me">로그아웃</a> 
                        <%} else { %>   
                            <a href="./MemberLoginForm.me">로그인</a> 
                        <%} %>
                        </div>
                    </div>
                    
                </div>
            </header>

            <article id="content">

                <div class="container mainDiv">

                    <section class="content today_income">
                        <div class="content_title">
                            <h1>이번달 매출 현황</h1>
                        </div>
                        <div class="content_div">
                            <div class="con con1  content_today_order">
                                <div class="con_title">
                                    <h3>결제</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>144,555,000</span>원</h5>
                                </div>
                            </div>
                            <div class="con con2 today_payed">
                                <div class="con_title">
                                    <h3>주문</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>544,555,000</span>원</h5>
                                </div>
                            </div>
                            <div class="con con3 today_refund">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>555,000</span>원</h5>
                                </div>
                            </div>
                            <div class="con con4 today_total">
                                <div class="con_title">
                                    <h3>총계</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000</span>원</h5>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="content order_count">
                        <div class="content_title">
                            <h1>주문 현황</h1>
                        </div>
                        <div class="content_div">
                            <div class="con con1 notPayed_count">
                                <div class="con_title">
                                    <h3>입금전</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>33</span></h5>
                                </div>
                            </div>
                            <div class="con con2 prepared_count">
                                <div class="con_title">
                                    <h3>배송준비중</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>200</span></h5>
                                </div>
                            </div>
                            <div class="con con3 readied_count">
                                <div class="con_title">
                                    <h3>배송대기</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>198</span></h5>
                                </div>
                            </div>
                            <div class="con con4 going_count">
                                <div class="con_title">
                                    <h3>배송중</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>325</span></h5>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="content etc_count">
                        <div class="content_title">
                            <h1>취소/교환/반품/환불 현황</h1>
                        </div>
                        <div class="content_div">
                            <div class="con con1 cancle_count">
                                <div class="con_title">
                                    <h3>취소</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>300</span></h5>
                                </div>
                            </div>
                            <div class="con con2 change_count">
                                <div class="con_title">
                                    <h3>교환</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>187</span></h5>
                                </div>
                            </div>
                            <div class="con con3 return_count">
                                <div class="con_title">
                                    <h3>반품</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>58</span></h5>
                                </div>
                            </div>
                            <div class="con con4 refund_count">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>47</span></h5>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </article>


        </div>

    </div>





</body>
</html>