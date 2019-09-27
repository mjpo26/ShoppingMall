<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="vo.MemberBean"%>

<%
	// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
	String sId = (String)session.getAttribute("sId");
	if(sId == null) {
	    out.println("<script>");
	    out.println("alert('잘못된 접근입니다!')");
	    out.println("location.href='index.jsp'");
	    out.println("</script>");
	}
	
	// request 객체의 MemberBean 가져오기
	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	%>
	
<jsp:include page="../assets/top.jsp"></jsp:include>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%
    request.setCharacterEncoding("utf-8");
%>
    <!-- breadcrumb start -->
	    <section class="breadcrumb breadcrumb_bg">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-lg-8">
	                    <div class="breadcrumb_iner">
	                        <div class="breadcrumb_iner_item">
	                            <h2>회원 정보</h2>
	                            <p>Member <span>-</span> Info</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
    
<br>

	<section class="join_part padding_top">
        <div class="container">
            <div class="align-items-center">
                <div class="col-lg-8 col-md-8 col-sm-12 mx-auto">
                       <div class="mt-10 row clearfix">
                            <div class="float-left col-lg-2 d-md-block d-sm-none d-none">
                                <label for="member_id">아이디</label> 
                            </div>
                            <div class="col-lg-7 col-sm-8 col-8 float-left">
                                <input type="text" id="id" name="id" placeholder="<%=memberBean.getMember_id() %>" readonly required class="single-input">
                            </div>
                        </div>
                        

                        <div class="mt-10 row">
                            <div class="col-lg-2 d-md-block d-sm-none d-none">
                                <label for="member_name">이름</label> 
                            </div>
                            <div class="col-lg-10 col-sm-12">
                              <input type="text" id="member_name" name="name" placeholder="<%=memberBean.getMember_name() %>" readonly required class="single-input">
                        	</div>
                        </div>

                         <div class="mt-10 row clearfix">
                            <div class="float-left col-lg-2 d-md-block d-sm-none d-none">
                                <label for="postcode">우편번호</label> 
                            </div>
                            <div class="col-lg-7 col-sm-8 col-8 float-left">
                                <input type="text" id="member_name" name="name" placeholder="<%=memberBean.getMember_postcode1() %>" readonly required class="single-input">
                            </div>
                            <div class="col-lg-3 col-sm-4 col-4 float-right clearfix">
                                <input type="button" class="genric-btn primary radius float-right col-12" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">            
                            </div>
                        </div>

                        <div class="mt-10 row">
                            <div class="col-lg-2 d-md-block d-sm-none d-none">
                                <label for="address">기본 주소</label> 
                            </div>
                            <div class="col-lg-10 col-sm-12">
                            <input type="text" id="address" name="address" value=<%=memberBean.getMember_address1() %> placeholder="기본 주소" onfocus="this.placeholder = '우편번호 찾기 시자동으로 입력되는 주소입니다.'" onblur="this.placeholder = '기본 주소'" class="single-input">
                            </div>
                        </div>
						
						<!--  상세주소 X -->
						
                        <div class="row mt-10">
                             <div class="col-lg-2 d-md-block d-sm-none d-none">
                                <label for="member_phone">휴대전화</label> 
                            </div>
                        
                            <div class="input-group-icon col-lg-3 col-4 mt-0">
                                <div class="icon"><i class="fa fa-mobile" aria-hidden="true"></i></div>
                                <div class="form-select" id="default-select">
                                    <select name="phone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="017">017</option>
                                        <option value="019">019</option>
                                    </select>
                                </div>
                             </div>
                             <div class="d-lg-block d-md-none d-none">_</div>
                            <div class="col-lg-3 col-4">
                                <input type="number" id="member_phone" name="phone2" placeholder="" onfocus="this.placeholder = ''" maxlength="4" onblur="this.placeholder = ''" class="single-input">
                            </div>
                             <div class="d-lg-block d-md-none d-none">_</div>
                            <div class="col-lg-3 col-4">
                                <input type="number" name="member_phone2" placeholder="" onfocus="this.placeholder = ''" maxlength="4" onblur="this.placeholder = ''" class="single-input">
                            </div>
                        </div>


                        <div class="mt-10 row">
                            <div class="col-lg-2 d-md-block d-sm-none d-none">
                                <label for="member_email">이메일</label> 
                            </div>
                            <div class="col-lg-4 col-sm-6 col-6">
                                <input type="text" id="member_email"name="email" placeholder="이메일" onfocus="this.placeholder = '이메일'" onblur="this.placeholder = '이메일'" required class="single-input">
                            </div>
                            <div class="col-sm-1 col-1">@</div>                            
                            <div class="col-lg-5 col-sm-5 col-5">
                                <input type="text" name="domain" placeholder="직접입력" onfocus="this.placeholder = '직접입력'" onblur="this.placeholder = '직접입력'" required class="single-input">
                            </div>                           
                        </div>
          
                        
                        <div class="mt-10 row">
                            <div class="col-lg-2 d-md-block d-sm-none d-none">
                                <label for=""></label> 
                            </div>

                            <div class="input-group-icon col-lg-10">
                                <div class="icon"><i class="fa fa-at" aria-hidden="true"></i></div>
                                <div class="form-select" id="default-select2">
                                    <select onchange="chkEmailDomainSelect(this)">
                                       <option value="">직접입력</option>
                                       <option value="naver.com">naver.com</option>
                                       <option value="nate.com">nate.com</option>
                                       <option value="itwillbs.co.kr">itwillbs.co.kr</option>      
                                    </select>
                                </div>
                             </div>
                        </div>

                </div>
            </div>
        </div>
    </section>
    	<a href="./MemberUpdate.me">회원수정</a><br>
		<a href="./BasketInfo.bl">장바구니 조회</a><br>
		<a href="./orderInfo.sh">주문정보 조회</a>
<jsp:include page="../assets/foot.jsp"></jsp:include>




