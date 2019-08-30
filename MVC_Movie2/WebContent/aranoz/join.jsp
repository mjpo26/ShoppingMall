<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>
<!-- breadcrumb start -->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Join 회원가입</h2>
                            <p>Member <span>-</span> Join</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!--     breadcrumb start -->

<!--================login_part Area =================-->
<section class="join_part padding_top">
    <div class="container">
        <div class="row align-items-center">
                <div class="col-lg-8 col-md-8 col-sm-12 mx-auto clear-fix">
                    <h3 class="mb-30 float-left">필수 정보</h3>
                    <div class="mb-30 single-element-widget float-right">
<!--                         <h4 class="mb-30">회원</h4> -->
                        <div class="default-select" id="default-select_2" >
                            <select disabled>
                                <option value="일반회원">일반회원</option>
                                <option value="2">VIP</option>
                            </select>
                         </div>
                    
                    </div>
                    
                    
                    <form action="#">
            
                        <div class="mt-10">
                            <input type="text" name="Member_id" placeholder="아이디" 
                                onfocus="this.placeholder = '4~8자 영소대문자,숫자 조합, 특수문자 사용물가'"
                                onblur="this.placeholder = 'id'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="Member_pass" placeholder="비밀번호" 
                                onfocus="this.placeholder = ''"
                                onblur="this.placeholder = '6~12자 영소문자, 영대문자, 숫자 조합'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="Member_name" placeholder="이름"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required
                                class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="email" name="EMAIL" placeholder="Email address" onfocus="this.placeholder = ''"
                                onblur="this.placeholder = 'Email address'" required class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
                            <input type="text" name="address" placeholder="Address" onfocus="this.placeholder = ''"
                                onblur="this.placeholder = 'Address'" required class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select">
                                <select>
                                    <option value=" 1">City</option>
                                    <option value="1">Dhaka</option>
                                    <option value="1">Dilli</option>
                                    <option value="1">Newyork</option>
                                    <option value="1">Islamabad</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select_1">
                                <select>
                                    <option value=" 1">Country</option>
                                    <option value="1">Bangladesh</option>
                                    <option value="1">India</option>
                                    <option value="1">England</option>
                                    <option value="1">Srilanka</option>
                                </select>
                            </div>
                        </div>

                        <div class="mt-10">
                            <textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''"
                                onblur="this.placeholder = 'Message'" required></textarea>
                        </div>
                        <!-- For Gradient Border Use -->
                        <!-- <div class="mt-10">
                                        <div class="primary-input">
                                            <input id="primary-input" type="text" name="first_name" placeholder="Primary color" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Primary color'">
                                            <label for="primary-input"></label>
                                        </div>
                                    </div> -->
                        <div class="mt-10">
                            <input type="text" name="first_name" placeholder="Primary color"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = 'Primary color'" required
                                class="single-input-primary">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="first_name" placeholder="Accent color"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = 'Accent color'" required
                                class="single-input-accent">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="first_name" placeholder="Secondary color"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = 'Secondary color'" required
                                class="single-input-secondary">
                        </div>
                    </form>
                </div>
        </div>
    </div>
</section>
<!--================login_part end =================-->

<jsp:include page="foot.jsp"></jsp:include>
