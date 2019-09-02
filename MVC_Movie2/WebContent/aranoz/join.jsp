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
                        <div class="default-select" id="default-select_2">
                            <select disabled>
                                <option value="일반회원">일반회원</option>
                                <option value="2">VIP</option>
                            </select>
                        </div>

                    </div>


                    <form action="#">

                        <div class="mt-10">
                            <input type="text" name="member_id" placeholder="아이디" onfocus="this.placeholder = '4~8자 영소대문자,숫자 조합, 특수문자 사용물가'" onblur="this.placeholder = 'id'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="member_pass" placeholder="비밀번호" onfocus="this.placeholder = '6~12자 영소문자, 영대문자, 숫자 조합'" onblur="this.placeholder = '비밀번호'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="member_pass2" placeholder="비밀번호 확인" onfocus="this.placeholder = '위 입력하신 비밀번호를 입력해주세요'" onblur="this.placeholder = '비밀번호 확인'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="member_name" placeholder="이름" onfocus="this.placeholder = '한글 2~10자'" onblur="this.placeholder = '이름'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="email" name="member_email" placeholder="Email" onfocus="this.placeholder = 'ex. korea@naver.com'" onblur="this.placeholder = 'Email'" required class="single-input">
                        </div>



                        <div class="mt-10">
                            <input type="number" name="member_postcode1" placeholder="우편번호" onfocus="this.placeholder = '활성시 우편번호 API 팝업이 뜨도록'" onblur="this.placeholder = '우편번호'" class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="member_address1" placeholder="기본 주소" onfocus="this.placeholder = '활성시 우편번호 API 팝업이 뜨도록'" onblur="this.placeholder = '기본 주소'" class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="member_address2" placeholder="상세 주소" onfocus="this.placeholder = '상세 주소를 입력해주세요'" onblur="this.placeholder = '상세 주소'" class="single-input">
                        </div>

                        <div class="row mt-10">
                            <div class="input-group-icon my-auto col-xs-4 col-sm-4 col-4">
                                <div class="icon"><i class="fa fa-phone" aria-hidden="true"></i></div>
                                <div class="form-select" id="default-select">
                                    <select name="member_phone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="017">017</option>
                                        <option value="019">019</option>
                                    </select>
                                </div>
                             </div>

                            <div class="col-sm-1 d-none d-xs-block my-auto">
                                <span>-</span>
                            </div>
                            <div class="col-sm-3 col-xs-3 my-auto col-4">
                                <input type="number" name="member_phone2" placeholder="" onfocus="this.placeholder = ''" maxlength="4" onblur="this.placeholder = ''" class="single-input">
                            </div>
                            <div class="col-sm-1 d-none d-xs-block my-auto">
                                <span>-</span>
                            </div>
                            <div class="col-sm-3 col-xs-3 my-auto col-4">
                                <input type="number" name="member_phone2" placeholder="" onfocus="this.placeholder = ''" maxlength="4" onblur="this.placeholder = ''" class="single-input">
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="switch-wrap d-flex justify-content-between mt-10 col-6">

                                <p class="my-auto">SMS 수신 여부</p>
                                <div class="primary-switch my-auto">
                                    <input type="checkbox" id="default-switch1" checked>
                                    <label for="default-switch1"></label>
                                </div>
                            </div>
                            <div class="switch-wrap d-flex justify-content-between mt-10 col-6">
                                <p class="my-auto">E-Mail 수신 여부</p>
                                <div class="primary-switch my-auto">
                                    <input type="checkbox" id="default-switch2" checked>
                                    <label for="default-switch2"></label>
                                </div>
                            </div>
                        </div>

                       <div class="row mt-30">
                          <div class="col-xs-12 col-sm-6 mx-auto row">
                           <input type="submit" class="genric-btn primary radius col-6" value="회원가입">
                           <input type="button" class="genric-btn default radius col-6" value="취소">
                          </div>
                           
                           
                       </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
<!--================login_part end =================-->

<jsp:include page="foot.jsp"></jsp:include>
