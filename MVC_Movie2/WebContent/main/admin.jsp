<%@page import="vo.AdminListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
    // 저장된 세션 아이디 가져오기
    String sId = (String)session.getAttribute("sId");
  AdminListBean adminListBean = (AdminListBean)request.getAttribute("adminListBean");
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
                                    <h3>주문상태</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getSumOrder() %></span>원</h5>
                                </div>
                            </div>
                            <div class="con con2 today_payed col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>결제완료</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getSumsel() %></span>원</h5>
                                    
                                </div>
                            </div>
                            <div class="con con3 today_refund col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getSumrefund() %></span>원</h5>
                                </div>
                            </div>
                            <div class="con con4 today_total col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>총계</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getResult() %></span>원</h5>
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
                                    <h5><span><%=adminListBean.getInputOrder() %></span></h5>
                                </div>
                            </div>
                            <div class="con con2 prepared_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>배송전</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getDelivery_be() %></span></h5>
                                </div>
                            </div>
                            <div class="con con3 readied_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>배송중</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getDelivery_ing()%></span></h5>
                                </div>
                            </div>
                            <div class="con con4 going_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>배송완료</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getDelivery_af() %></span></h5>
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
                                    <h5><span><%=adminListBean.getCancel() %></span></h5>
                                </div>
                            </div>
                            <div class="con con2 change_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>교환</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getChange() %></span></h5>
                                </div>
                            </div>
                            <div class="con con3 return_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>반품</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getRetrun() %></span></h5>
                                </div>
                            </div>
                            <div class="con con4 refund_count col-xl-3 col-lg-6 col-md-12">
                                <div class="con_title">
                                    <h3>환불</h3>
                                </div>
                                <div class="con_count">
                                    <h5><span><%=adminListBean.getRefund() %></span></h5>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </article>
        </div>	<!-- DIV - ID="MAIN"  -->
        
<jsp:include page="adminFoot.jsp"></jsp:include>