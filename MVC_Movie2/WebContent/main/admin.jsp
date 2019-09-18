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
                            <li>상품분류관리</li>
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
                <div class="container">header</div>
            </header>

            <article id="content">

                <div class="container"> content

                    <section id="today_income">
                        <div id="today_order"></div>
                        <div id="today_payed"></div>
                        <div id="today_refund"></div>

                    </section>
                    <section id="order_count">
                        <div id="notPayed_count"></div>
                        <div id="prepared_count"></div>
                        <div id="readied_count"></div>
                        <div id="going_count"></div>
                    </section>
                    <section id="etc_count">
                        <div id="cancle_count"></div>
                        <div id="change_count"></div>
                        <div id="return_count"></div>
                        <div id="refund_count"></div>
                    </section>

                </div>
            </article>


        </div>

    </div>




</body>
</html>