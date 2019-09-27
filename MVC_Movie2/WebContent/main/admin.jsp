<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
    // 저장된 세션 아이디 가져오기
    String sId = (String)session.getAttribute("sId");
  %>  
<jsp:include page="adminTop.jsp"></jsp:include>  

                        <h3>관리자 페이지 메인</h3>
                    </div>                    
                </div>
            </header>
            <article id="content">
                <div class="container mainDiv">
                    <section class="content today_income">
                        <div class="content_title">
                            <h1>이번달 매출 현황</h1>
                        </div>
                        <div class="content_div row">
                            <div class="con con1 content_today_order col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>결제</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>144,555,000</span>원</h5>
                                </div>
                            </div>
                            <div class="con con2 today_payed col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>주문</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>544,555,000</span>원</h5>
                                </div>
                            </div>
                            <div class="con con3 today_refund col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>555,000</span>원</h5>
                                </div>
                            </div>
                            <div class="con con4 today_total col-xl-3 col-lg-6 col-md-12">
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
                        <div class="content_div row">
                            <div class="con con1 notPayed_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>입금전</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>33</span></h5>
                                </div>
                            </div>
                            <div class="con con2 prepared_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>배송준비중</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>200</span></h5>
                                </div>
                            </div>
                            <div class="con con3 readied_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>배송대기</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>198</span></h5>
                                </div>
                            </div>
                            <div class="con con4 going_count col-xl-3 col-lg-6 col-md-12">
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
                        <div class="content_div row">
                            <div class="con con1 cancle_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>취소</h3>
                                </div>
                                <div class="con_count ">
                                    <h5><span>300</span></h5>
                                </div>
                            </div>
                            <div class="con con2 change_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>교환</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>187</span></h5>
                                </div>
                            </div>
                            <div class="con con3 return_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>반품</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span>58</span></h5>
                                </div>
                            </div>
                            <div class="con con4 refund_count col-xl-3 col-lg-6 col-md-12">
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
        </div>	<!-- DIV - ID="MAIN"  -->
        
        
<jsp:include page="adminFoot.jsp"></jsp:include>