<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
  <link rel="stylesheet" href="./main/admin.css">

</head>
<body>

    <div id="wrap">


        <nav id="sideMenu">
            <nav class="sideMenu">
                <ul class="mainMenu">
                    <li>상품관리
                        <ul class="subMenu">
                            <li>상품등록</li>
                            <li>상품목록</li>
                        </ul>
                    </li>
                    <li>주문관리
                        <ul class="subMenu">
                            <li>전체주문목록</li>
                            <li>배송관리</li>
                            <li>취소교환반품환불</li>
                        </ul>
                    </li>
                    <li>고객관리</li>



                    <li>게시판관리
                        <ul class="subMenu">
                            <li>게시물통합관리</li>
                            <li>게시물관리</li>
                        </ul>

                    </li>

                    <li>기타페이지</li>
                </ul>
            </nav>
        </nav>

        <div id="main">

            <header id="header">
                <div class="container">

                    <div class="header">
                        <h3>관리자 페이지 메인</h3>
                    </div>

                </div>
            </header>

            <article id="content">

                <div class="container mainDiv">

                    <section class="content today_income">
                        <div class="content_title">
                            <h1>오늘 매출 현황</h1>
                        </div>
                        <div class="content_div">
                            <div class="con con1  content_today_order">
                                <div class="con_title">
                                    <h3>결제</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>144,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con2 today_payed">
                                <div class="con_title">
                                    <h3>주문</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>144,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con3 today_refund">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>144,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con4 today_total">
                                <div class="con_title">
                                    <h3>총계</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
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
                                    <h5><span>44,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con2 prepared_count">
                                <div class="con_title">
                                    <h3>배송준비중</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con3 readied_count">
                                <div class="con_title">
                                    <h3>배송대기</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con4 going_count">
                                <div class="con_title">
                                    <h3>배송중</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
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
                                    <h5><span>44,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con2 change_count">
                                <div class="con_title">
                                    <h3>교환</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con3 return_count">
                                <div class="con_title">
                                    <h3>반품</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
                                </div>
                            </div>
                            <div class="con con4 refund_count">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>44,555,000 </span>원</h5>
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