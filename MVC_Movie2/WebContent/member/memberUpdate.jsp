<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../main/top.jsp"></jsp:include>
<%@page import="java.util.Date"%>
<%@page import="vo.MemberBean"%>

<%
	// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
	String sId = (String) session.getAttribute("sId");

// 	String mId = (String) request.getParameter("mId");
// 	if(mId==null){
// 		mId= sId;
// 	}
	if (sId == null) {
		out.println("<script>");
		out.println("alert('잘못된 접근입니다!')");
		out.println("location.href='./admin.ma'");
		out.println("</script>");
	}

	// request 객체의 MemberBean 가져오기
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");

	// 주민번호 분리(앞자리 = 0번 배열, 뒷자리 = 1번 배열)
	// 	String jumin1 = memberBean.getMember_jumin().split("-")[0];
	// 	String jumin2 = memberBean.getMember_jumin().split("-")[1];

	// E-Mail 분리(계정 = 0번 배열, 도메인 = 1번 배열)
	// 	String email1 = memberBean.getMember_email().split("@")[0];
	// 	String email2 = memberBean.getMember_email().split("@")[1];

	//주소 분리
	String address1 = memberBean.getMember_address1();

	String[] address = address1.split("/");
	// String detailaddress = memberBean.getMember_address1().split("/")[1];
	// String extraaddress = memberBean.getMember_address1().split("/")[2];
	for (int i = 0; i < address.length; i++) {
		System.out.println(address[i]);
	}

	String phone1 = memberBean.getMember_phone();

	String[] phone = phone1.split("-");
	// String detailaddress = memberBean.getMember_address1().split("/")[1];
	// String extraaddress = memberBean.getMember_address1().split("/")[2];
	for (int i = 0; i < phone.length; i++) {
		System.out.println(phone[i]);
	}

	String email1 = memberBean.getMember_email();

	String[] email = email1.split("@");
	// String detailaddress = memberBean.getMember_address1().split("/")[1];
	// String extraaddress = memberBean.getMember_address1().split("/")[2];
	for (int i = 0; i < email.length; i++) {
		System.out.println(email[i]);
	}
%>

<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
  function check() {

        if (document.joinForm.id.value == "") {
            alert("아이디를 입력하세요!");
            document.joinForm.id.focus();
            return false;
        }
        if (document.joinForm.pass.value == "") {
            alert("비밀번호를 입력하세요");
            document.joinForm.id.focus();
            return false;
        }
        
        if (document.joinForm.isPassOk.value=="no"||document.joinForm.isIdOk.value=="no") {
          alert("아이디와 비밀번호를 체크하세요")
          document.joinForm.id.focus();
          return false;
     }
        
        
        if (document.joinForm.pass.value.length <= 7) {
            alert("비밀번호가 유효하지 않습니다!")
            document.fr.pass.focus();
            return false;
        }

        if (document.joinForm.passChecked.value != "yes") {
            var fpass = document.fr.pass.value;

            window.open("passCheckPro.jsp?fpass=" + fpass, "",
                    "width=400,height=200");

            return false;

        }
        if (document.joinForm.pass2.value.length == "") {
            alert("비밀번호 확인란을 입력하세요!")
            document.joinForm.pass2.focus();
            return false;
        }
         
	if (document.joinForm.pass.value != document.joinForm.pass2.value) {
		            alert("비밀번호가 일치되지 않습니다.");
		            document.joinForm.pass2.focus();
		            return false;
		        }

		if (document.joinForm.member_name.value.length == "") {
			alert("이름을 입력하세요!")
			document.joinForm.name.focus();
			return false;
		}

		if (document.joinForm.detailaddress.value.length == "") {
			alert("상세 주소를 입력하세요!")
			document.joinForm.name.focus();
			return false;
		}

		if (document.joinForm.email.value.length == "") {
			alert("이메일을 입력하세요!")
			document.joinForm.email.focus();
			return false;
		}
		if (document.joinForm.email2.value.length == "") {
			alert("이메일 확인란을 입력하세요!")
			document.joinForm.email2.focus();
			return false;
		}

		if (document.joinForm.email.value != document.joinForm.email2.value) {
			alert("이메일이  일치되지 않습니다.");
			document.joinForm.pass2.focus();
			return false;
		}
		if ( $('[name=pass]').val() != $('[name=pass2]').val()) {
            alert("비밀번호가 일치하지 않습니다.")
            document.getElementById('isPassOk').value=="no";
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
	//     function  {
	// 		document.joinForm.idDuplication.value = "idUncheck";
	// 	}

	//     function idcheck() {
	//         // id 텍스트 상자가 비어있으면  "아이디입력" 제어

	//         var fid = encodeURIComponent(document.joinForm.id.value);
	//         var fcheck = document.joinForm.idDuplication.value;
	//         //한글 안깨지는 ie 폼 불러오기
	//         //fid = document.wfr.id.value;
	//         //opener.document.fr.id.value = document.wfr.id.value;
	//         if (fid == "") {
	//             alert("아이디입력");
	//             document.joinForm.id.focus();
	//             return;
	//         }
	//         //  아이디 입력되어있으면 새창열기  "idcheck.jsp"
	//         //  window.open("파일이름","창이름","옵션");
	//         window.open("./idcheck.jsp?fid=" + fid, "", "width=400,height=200");
	//     }



	$(function() {
		$("input[name='dup']")
				.on(
						"click",
						function() {
							//$('.dup').click(function(){
							var s_id = $('#id').val();
							//alert("fid : "+s_id);

							$.ajax({
							url : "<%=request.getContextPath()%>/IdcheckServlet.ic",
			//url : '/IdcheckServlet.ic',
	            type: "post", 
	           data : {
					fid : s_id
				},


				success : function(data) {
				//	alert(data);
					if(s_id =="") {
						//alert("s_id 아이디 입력 하세요");
						$("#text").css("color","red");
						$("#text").text(" 아이디를 입력해주세요.");
						$('#id').focus();
					} else if (data == '0') {
						$("#text").css("color","blue");
						$("#text").text(" 사용가능한 아이디 입니다.");						
						document.getElementById('isIdOk').value = "yes";
					} else if (data =="1") {
						$("#text").css("color","red");
						$("#text").text(" "+ $('#id').val()+ "는 이미 사용중인 아이디 입니다.");
						$('#id').val('');		
						$('#id').focus();

					}
				},
			
				error : function(error) {
					alert("에러 : " + error );
				
					
				}
			});
		});
	});
	$(document).ready(function(){
		   $('[name=pass]').keyup(function(){
		    var pattern1 = /[0-9]/;   //숫자
		    var pattern2 = /[a-zA-Z]/; //영문자
		    var pattern3 = /[~!@#$%^&*()<>\+=-_?]/;  //내가 원하는 특수문자
		    p1 = $('[name=pass]').val().length; 
		  if(p1<=8 || !pattern1.test($('[name=pass]').val()) || !pattern2.test($('[name=pass]').val()) 
		    || !pattern3.test($('[name=pass]').val())){
		    // $('#pwd_chk1').html('영문자, 숫자, 특수문자 3가지 조합과8자이상');
		      $("#text3").text('');
			  $("#text2").css("color","red");
			  $("#text2").text(' 사용불가! 영문자,숫자,특수문자 3가지 조합과 8자이상으로 설정하세요');
			  $("#member_pass").focus();

				 }
 			else{
		    // $('#pwd_chk1').html('');
		   		$("#text3").text('');
		    	$("#text2").css("color","blue");
		    	$("#text2").text(' 사용 가능한 비밀번호 입니다.');
		    	document.getElementById('isPassOk').value = "yes";
				$("#pass2").focus();

		    }
		   });
		});

	$(document).ready(function(){
		   $('[name=pass2]').keyup(function(){
			  
			   
			   if(document.getElementById('isPassOk').value=="yes"){				   
				   if ( $('[name=pass]').val() != $('[name=pass2]').val()) {
					   $("#text3").css("color","red");
					   $("#text2").text('');
					   $("#text3").text('비밀번호가 일치하지 않습니다!');				   
			        }else{
						$("#text2").text('');
			        	$("#text3").css("color","blue");
				    	$("#text3").text('비밀번호가 일치합니다!');		        	
			        }
			   }
			   else{
					$("#member_pass").focus();
					$("#text2").text(' 사용불가! 영문자,숫자,특수문자 3가지 조합과 8자이상으로 설정하세요');
			   }
			   
		   });
	   });
	
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
						<h2>회원 수정</h2>
						<p>
							Member <span>-</span> Update
						</p>
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
						<h3 class="mb-30 ">회원 수정페이지</h3>
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

				<form action="MemberUpdatePro.me" id="update" method="post"
					name="updateForm" onsubmit="return check()">

					<div class="mt-10 row clearfix">
						<div class="float-left col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_id">아이디</label>
						</div>
						<div class="col-lg-7 col-sm-8 col-8 float-left">
							<input type="text" id="id" name="id"
								onfocus="this.placeholder = '4~8자 영소대문자,숫자 조합, 특수문자 사용불가'"
								onblur="this.placeholder = '아이디'" required class="single-input"
								onkeydown="inputIdChk()" value="<%=memberBean.getMember_id()%>"
								readonly="readonly"> <span id="text"></span><input
								type="hidden" id="isIdOk" value="no">
						</div>
					</div>



					<div class="mt-10 row">


						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_pass">비밀번호</label>
						</div>
						<div class="col-lg-10 col-md-12 row">
							<div class="col-sm-6 col-12">
								<input type="password" id="member_pass" name="pass"
									placeholder="비밀번호"
									onfocus="this.placeholder = '비밀번호를 입력 해 주세요'"
									onblur="this.placeholder = '비밀번호'" required
									class="single-input">
							</div>
							<div class="col-sm-6 col-12 mt-sm-0 mt-10">
								<input type="password" name="pass2" placeholder="비밀번호 확인"
									onfocus="this.placeholder = '입력하신 비밀번호를 다시 입력해주세요'"
									onblur="this.placeholder = '비밀번호 확인'" required
									class="single-input">
							</div>
							<span id="text2" style="padding-left: 1em;"></span><span
								id="text3" style="padding-left: 0.5em;"></span><input
								type="hidden" id="isPassOk" value="no">
						</div>

					</div>

					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_name">이름</label>
						</div>
						<div class="col-lg-10 col-sm-12">
							<input type="text" id="member_name" name="name"
								onkeyup="passCheck(this.value)"
								onfocus="this.placeholder = '한글 2~10자'"
								onblur="this.placeholder = '이름'" required class="single-input"
								value="<%=memberBean.getMember_name()%>">
						</div>
					</div>

					<!--                         <input type="text" id="result" readonly style="border: 0px; background-color: transparent"><br> -->


					<div class="mt-10 row clearfix">
						<div class="float-left col-lg-2 d-md-block d-sm-none d-none">
							<label for="postcode">우편번호</label>
						</div>
						<div class="col-lg-7 col-sm-8 col-8 float-left">
							<input type="number" id="postcode" name="postcode"
								onfocus="this.placeholder = '우편번호 찾기를 통해 입력해주십시오 '"
								onblur="this.placeholder = '우편번호'" class="single-input"
								value="<%=memberBean.getMember_postcode1()%>">
						</div>
						<div class="col-lg-3 col-sm-4 col-4 float-right clearfix">
							<input type="button"
								class="genric-btn primary radius float-right col-12"
								value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
						</div>
					</div>

					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="address">기본 주소</label>
						</div>
						<div class="col-lg-10 col-sm-12">
							<input type="text" id="address" name="address"
								value="<%=address[0]%>"
								onfocus="this.placeholder = '우편번호 찾기 시자동으로 입력되는 주소입니다.'"
								onblur="this.placeholder = '기본 주소'" class="single-input">
						</div>
					</div>

					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="detailaddress">상세 주소</label>
						</div>
						<div class="col-lg-10 col-sm-12">
							<input type="text" id="detailaddress" name="detailaddress"
								value="<%=address[1]%>" name="address"
								onfocus="this.placeholder = '상세주소를 입력해주세요'"
								onblur="this.placeholder = '상세 주소'" class="single-input">
						</div>
						<!--                             <div class="col-lg-2 col-sm-2"> -->
						<!--                             <input type="text" name="extraaddress" id="extraaddress" placeholder="참고항목"> -->
						<!--                             </div> -->
					</div>

					<script
						src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=872a5db04ceea145a453ef88d096e9a6&libraries=services"></script>




					<div class="mt-10 row mx-auto">

						<div class="col-12 px-3" id="map"
							style="width: 100%; height: 300px; display: none"></div>


					</div>



					<script>
                            //-------------------------------------
            
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                level : 5
                            // 지도의 확대 레벨
                            };
            
                            //지도를 미리 생성
                            var map = new daum.maps.Map(mapContainer, mapOption);
                            //주소-좌표 변환 객체를 생성
                            var geocoder = new daum.maps.services.Geocoder();
                            //마커를 미리 생성
                            var marker = new daum.maps.Marker({
                                position : new daum.maps.LatLng(37.537187, 127.005476),
                                map : map
                            });
            
                            //-------------------------------------
            
                            function sample6_execDaumPostcode() {
                                new daum.Postcode(
                                        {
                                            oncomplete : function(data) {
            
                                                //=-----------해보자
            
                                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            
                                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                var addr = ''; // 주소 변수
                                                var extraAddr = ''; // 참고항목 변수
            
                                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                                    addr = data.roadAddress;                                                
                                                
                                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                                    if (data.bname !== ''
                                                            && /[동|로|가]$/g.test(data.bname)) {
                                                    	extraAddr += data.bname;
                                                    }
                                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                                    if (data.buildingName !== ''
                                                            && data.apartment === 'Y') {
                                                    	extraAddr += (extraAddr !== '' ? ', '
                                                                + data.buildingName
                                                                : data.buildingName);
                                                    }
                                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                                    if (extraAddr !== '') {
                                                        addr = addr+ ' (' + extraAddr + ')';
                                                    }
                                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                                    document.getElementById("address").value = addr;
            
                                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                                    addr = data.jibunAddress;
                                                }
                                           
                                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                document.getElementById('postcode').value = data.zonecode;
                                                document.getElementById("address").value = addr;
                                                // 커서를 상세주소 필드로 이동한다.
                                                document.getElementById("detailaddress").focus();
            
                                                //--------------------------------
            
                                                var addr2 = data.address; // 최종 주소 변수
            
                                                // 주소 정보를 해당 필드에 넣는다.
                                                //  document.getElementById("sample5_address").value = addr;
                                                // 주소로 상세 정보를 검색
                                                geocoder
                                                        .addressSearch(
                                                                data.address,
                                                                function(results, status) {
                                                                    // 정상적으로 검색이 완료됐으면
                                                                    if (status === daum.maps.services.Status.OK) {
            
                                                                        var result = results[0]; //첫번째 결과의 값을 활용
            
                                                                        // 해당 주소에 대한 좌표를 받아서
                                                                        var coords = new daum.maps.LatLng(
                                                                                result.y,
                                                                                result.x);
                                                                        // 주소 정보를 해당 필드에 넣는다.
                                                                        document
                                                                                .getElementById("resulty").value = result.y;
                                                                        document
                                                                                .getElementById("resultx").value = result.x;
            
                                                                        // 지도를 보여준다.
                                                                        mapContainer.style.display = "block";
                                                                        map.relayout();
                                                                        // 지도 중심을 변경한다.
                                                                        map
                                                                                .setCenter(coords);
                                                                        // 마커를 결과값으로 받은 위치로 옮긴다.
                                                                        marker
                                                                                .setPosition(coords)
                                                                    }
                                                                });
            
                                                //---------------------------------
                                            }
                                        }).open();
                            }
                        </script>

					<div class="row mt-10">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_phone">휴대전화</label>
						</div>

						<div class="col-lg-3 col-4">
							<input type="text" id="member_phone1" name="phone1"
								value="<%=phone[0]%>" onfocus="this.placeholder = ''"
								maxlength="4" onblur="this.placeholder = ''"
								class="single-input">
						</div>
						<div class="d-lg-block d-md-none d-none">_</div>
						<div class="col-lg-3 col-4">
							<input type="text" id="member_phone2" name="phone2"
								value="<%=phone[1]%>" onfocus="this.placeholder = ''"
								maxlength="4" onblur="this.placeholder = ''"
								class="single-input">
						</div>
						<div class="d-lg-block d-md-none d-none">_</div>
						<div class="col-lg-3 col-4">
							<input type="text" id="member_phone3" name="phone3"
								value="<%=phone[2]%>" onfocus="this.placeholder = ''"
								maxlength="4" onblur="this.placeholder = ''"
								class="single-input">
						</div>
					</div>


					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_email">이메일</label>
						</div>
						<div class="col-lg-4 col-sm-6 col-6">
							<input type="text" id="member_email" name="email"
								value="<%=email[0]%>" onfocus="this.placeholder = '이메일'"
								onblur="this.placeholder = '이메일'" required class="single-input">
						</div>
						<div class="col-sm-1 col-1">@</div>
						<div class="col-lg-5 col-sm-5 col-5">
							<input type="text" id="member_domain" name="domain"
								value="<%=email[1]%>" onfocus="this.placeholder = '직접입력'"
								onblur="this.placeholder = '직접입력'" required class="single-input">
						</div>
					</div>


					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for=""></label>
						</div>
					</div>

					<div class="row">

						<div
							class="switch-wrap d-flex justify-content-between mt-10 col-6">

							<p class="my-auto">SMS 수신 여부</p>
							<div class="primary-switch my-auto">
								<input type="checkbox" name="isSmsOk" id="default-switch1"
									checked> <label for="default-switch1"></label>
							</div>
						</div>
						<div
							class="switch-wrap d-flex justify-content-between mt-10 col-6">
							<p class="my-auto">E-Mail 수신 여부</p>
							<div class="primary-switch my-auto">
								<input type="checkbox" name="isEmailOk" id="default-switch2"
									checked> <label for="default-switch2"></label>
							</div>
						</div>
					</div>

					<input type="hidden" name="resulty" id="resulty" placeholder="y좌표">
					<input type="hidden" name="resultx" id="resultx" placeholder="x좌표"><br>


					<div class="row mt-30">
						<div class="col-xs-12 col-sm-6 mx-auto row">
							<input type="submit"
								class="genric-btn primary radius col-6 submit" value="회원수정">
							<input type="reset"
								class="genric-btn default radius col-6 cancel" value="초기화">
						</div>


					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!--================login_part end =================-->

<jsp:include page="../main/foot.jsp"></jsp:include>
