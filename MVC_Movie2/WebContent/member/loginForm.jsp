<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 현재 세션에 저장된 id 값이 있을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
    String sId = (String)session.getAttribute("sId");
    if(sId != null) {
        out.println("<script>");
        out.println("alert('잘못된 접근입니다!')");
        out.println("location.href='index.jsp'");
        out.println("</script>");
    }
%>    
<jsp:include page="../assets/top.jsp"></jsp:include>
<!-- breadcrumb start -->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Login</h2>
                            <p>Member <span>-</span> Login</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!--     breadcrumb start -->

<!--================login_part Area =================-->
<section class="login_part padding_top">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6">
                <div class="login_part_text text-center">
                    <div class="login_part_text_iner">
                        <h2>아이디가 없으십니까?</h2>
                        <p>간편 1초 회원가입!</p>
                        <a href="MemberJoinForm.me" class="btn_3">회원가입하기</a><br><br>
                        <h2>아이디/비밀번호를 잊어버리셨나요?</h2>
                        <!-- <p>아이디 찾기</p>-->
                        <a href="./MemberIDfind.me" class="btn_3">아이디 찾기</a>
                        <a href="./MemberfindPw.me" class="btn_3">비밀번호 찾기</a>
                    </div>

                </div>

            </div>

            <div class="col-lg-6 col-md-6">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3>로그인</h3>
                        <form class="row contact_form" action="MemberLoginPro.me" method="post" novalidate="novalidate" name="loginForm">
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="id" name="id" value="" placeholder="아이디">
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" id="password" name="password" value="" placeholder="비밀번호">
                            </div>
                            <div class="col-md-12 form-group">
                                <!--                                     <div class="creat_account d-flex align-items-center"> -->
                                <!--                                         <input type="checkbox" id="f-option" name="selector"> -->
                                <!--                                         <label for="f-option">Remember me</label> -->
                                <!--                                     </div> -->
                                
                                
                                <button type="submit" value="submit" class="btn_3">로그인</button>

                            </div>

                            <div class="col-md-12 clearfix">
                                <figure class="col-6 float-left">
                                    <img src="./assets/img/btn/login/naver_login_small_grren.PNG">
                                </figure>
                                <figure class="col-6 float-left">
                                    <img src="./assets/img/btn/login/kakao_login_btn_large.png">
                                </figure>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================login_part end =================-->

<jsp:include page="../assets/foot.jsp"></jsp:include>


















