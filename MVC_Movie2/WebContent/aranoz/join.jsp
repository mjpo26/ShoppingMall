<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>

<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
<script type="text/javascript">
    function passCheck(val) {

        if (val.length < 3) {

            document.getElementById('result').value = "A-test";

            document.getElementById('result').style.color = "red";

        } else if (val.length < 8) {

            document.getElementById('result').value = "B-test";

            document.getElementById('result').style.color = "orange";

        } else {

            document.getElementById('result').value = "C-test";

            document.getElementById('result').style.color = "green";

        }

    }

    function check() {

        if (document.fr.id.value == "") {
            alert("아이디를 입력하세요!");
            document.fr.id.focus();
            return false;
        }
        if (document.fr.pass.value == "") {
            alert("비밀번호를 입력하세요");
            document.fr.id.focus();
            return false;
        }
        if (document.fr.pass.value.length < 4) {
            alert("비밀번호는 4자 이상으로 설정하세요!")
            document.fr.pass.focus();
            return false;
        }

        if (document.fr.passChecked.value != "yes") {
            var fpass = document.fr.pass.value;

            window.open("passCheckPro.jsp?fpass=" + fpass, "",
                    "width=400,height=200");

            return false;

        }
        if (document.fr.pass2.value.length == "") {
            alert("비밀번호 확인란을 입력하세요!")
            document.fr.pass2.focus();
            return false;
        }
        if (document.fr.pass.value != document.fr.pass2.value) {
            alert("비밀번호가 일치되지 않습니다.");
            document.fr.pass2.focus();
            return false;
        }

        if (document.fr.name.value.length == "") {
            alert("이름을 입력하세요!")
            document.fr.name.focus();
            return false;
        }

        if (document.fr.detailaddress.value.length == "") {
            alert("주소를 입력하세요!")
            document.fr.name.focus();
            return false;
        }

        if (document.fr.email.value.length == "") {
            alert("이메일을 입력하세요!")
            document.fr.email.focus();
            return false;
        }
        if (document.fr.email2.value.length == "") {
            alert("이메일 확인란을 입력하세요!")
            document.fr.email2.focus();
            return false;
        }

        if (document.fr.pass.value != document.fr.pass2.value) {
            alert("이메일이  일치되지 않습니다.");
            document.fr.pass2.focus();
            return false;
        }
        //   비밀번호유효성체크

        //비밀번호 유효성체크 끝
    }

    // E-Mail 도메인 선택
    function chkEmailDomainSelect(domain) {
        document.joinForm.domain.value = domain.value;
        document.joinForm.domain2.value = domain.value;
        
    }
    
    
    function idcheck() {
        // id 텍스트 상자가 비어있으면  "아이디입력" 제어

        var fid = encodeURIComponent(document.fr.id.value);
        //한글 안깨지는 ie 폼 불러오기
        //fid = document.wfr.id.value;
        //opener.document.fr.id.value = document.wfr.id.value;
        if (fid == "") {
            alert("아이디입력");
            document.fr.id.focus();
            return;
        }
        //  아이디 입력되어있으면 새창열기  "idcheck.jsp"
        //  window.open("파일이름","창이름","옵션");
        window.open("idcheck.jsp?fid=" + fid, "", "width=400,height=200");
    }
</script>
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
            <div class="align-items-center">
                <div class="col-lg-8 col-md-8 col-sm-12 mx-auto">
                
                    <div class="clearfix overflow-hidden">                    
	                    <div class="float-left">
	                        <h3 class="mb-30 ">필수 정보</h3>
	                    </div>
	                    <div class="mb-30 single-element-widget float-right">
	                        <!--                         <h4 class="mb-30">회원</h4> -->
	                        <div class="default-select" id="default-select_2">
	                            <select disabled>
	                                <option value="일반회원">일반회원</option>
	                                <option value="2">VIP</option>
	                            </select>
	                        </div>
		
	                    </div>
                    </div>
            
                    <form action="MemberJoinPro.me" id="join" method="post" name="joinForm" onsubmit="return check()">

                        <div class="mt-10 row clearfix">
                            <div class="float-left col-lg-2 d-md-block d-sm-none d-none">
                                <label for="member_id">아이디</label> 
                            </div>
                            <div class="col-lg-7 col-sm-8 col-8 float-left">
                                <input type="text" id="member_id" name="id" placeholder="아이디" onfocus="this.placeholder = '4~8자 영소대문자,숫자 조합, 특수문자 사용물가'" onblur="this.placeholder = 'id'" required class="single-input">
                            </div>
                            <div class="col-lg-3 col-sm-4 col-4 float-right clearfix">
                                <input type="button" class="genric-btn primary radius float-right col-12" value="중복체크" onclick="idcheck()">            
                            </div>
                        </div>
                        <div class="mt-10">
                            <input type="password" name="pass" placeholder="비밀번호" onfocus="this.placeholder = '6~12자 영소문자, 영대문자, 숫자 조합'" onblur="this.placeholder = '비밀번호'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="pass2" placeholder="비밀번호 확인" onfocus="this.placeholder = '위 입력하신 비밀번호를 입력해주세요'" onblur="this.placeholder = '비밀번호 확인'" required class="single-input">
                        </div>
                        <input type="hidden" name="passChecked" value="no">
                        <div class="mt-10">
                            <input type="text" name="name" placeholder="이름" onkeyup="passCheck(this.value)" 
                            onfocus="this.placeholder = '한글 2~10자'" onblur="this.placeholder = '이름'" required class="single-input">
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
