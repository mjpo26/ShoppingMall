<%@page import="java.util.Date"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	// 주민번호 분리(앞자리 = 0번 배열, 뒷자리 = 1번 배열)
// 	String jumin1 = memberBean.getMember_jumin().split("-")[0];
// 	String jumin2 = memberBean.getMember_jumin().split("-")[1];
	
	// E-Mail 분리(계정 = 0번 배열, 도메인 = 1번 배열)
// 	String email1 = memberBean.getMember_email().split("@")[0];
// 	String email2 = memberBean.getMember_email().split("@")[1];


//주소 분리
String address = memberBean.getMember_address1().split("/")[0];
String detailaddress = memberBean.getMember_address1().split("/")[1];
String extraaddress = memberBean.getMember_address1().split("/")[2];


//전화번호 분리
String phone1 = memberBean.getMember_phone().split("-")[0];
String phone2 = memberBean.getMember_phone().split("-")[1];
String phone3 = memberBean.getMember_phone().split("-")[2];


//이메일 분리
String email= memberBean.getMember_email().split("@")[0];
String domain = memberBean.getMember_email().split("@")[1];
%>  
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

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
		//	 비밀번호유효성체크

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
		// 	window.open("파일이름","창이름","옵션");
		window.open("idcheck.jsp?fid=" + fid, "", "width=400,height=200");
	}
</script>
<%
    request.setCharacterEncoding("utf-8");
%>
</head>
<body>

	<h1>Join Us</h1>


	<form action="MemberUpdatePro.me" id="update" method="post" name="updateForm"
		onsubmit="return check()">
		<fieldset>

			<legend>회원 정보</legend>
			<label>아이디</label> <input type="text" name="id" class="id" value="<%=memberBean.getMember_id() %>">
			<input type="button" value="중복체크" class="dup"
				onclick="idcheck()"><br> 
				<label>비밀번호</label> <input
				type="text" name="pass"><br>
				 <label>비밀번호 확인</label> <input
				type="password" name="pass2"><br> 
				
				<input type="hidden"
				name="passChecked" value="no"><br> 
				<label>이름</label> <input
				type="text" name="name" onkeyup="passCheck(this.value)" value="<%=memberBean.getMember_name() %>"> <input
				type="text" id="result" readonly
				style="border: 0px; background-color: transparent"><br>
			

		
			<label>우편번호</label> <input type="text" name="postcode" id="postcode"
				placeholder="우편번호" value="<%=memberBean.getMember_postcode1()%>"> <input type="button"
				onclick="sample6_execDaumPostcode();" value="우편번호 찾기"><br>
			<label>주소</label> <input type="text" name="address" id="address"
				placeholder="주소" size="46" value="<%=address %>"><br> <label>상세주소</label> <input
				type="text" name="detailaddress" id="detailaddress"
				placeholder="상세주소" value="<%=detailaddress %>"> <input type="text" name="extraaddress"
				id="extraaddress" placeholder="참고항목" value="<%=extraaddress %>"><br>

			<script
				src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=872a5db04ceea145a453ef88d096e9a6&libraries=services"></script>


			<div id="map"
				style="width: 450px; height: 300px; margin-top: 10px; display: none"></div>
			<br> 



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
									} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
									}
									// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									if (data.userSelectedType === 'R') {
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
											extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document.getElementById("extraaddress").value = extraAddr;

									} else {
										document.getElementById("extraaddress").value = '';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('postcode').value = data.zonecode;
									document.getElementById("address").value = addr;
									// 커서를 상세주소 필드로 이동한다.
									document.getElementById("detailaddress")
											.focus();

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








			<label>휴대전화</label> <input type="text" name="phone1"size="3"value="<%=phone1%>">- <input type="text" name="phone2" size="4"value="<%=phone2%>">- <input type="text" name="phone3" size="4"value="<%=phone3 %>"><br>
		<label>이메일&nbsp;</label> <input type="text" name="email" size="6" value="<%=email%>">&nbsp;@&nbsp;<input type="text" name="domain" size="6" value="<%=domain %>">&nbsp;<select onchange="chkEmailDomainSelect(this)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="itwillbs.co.kr">daum.net</option>				
					</select><br>
			<label>이메일확인</label> <input type="text" name="email2" size="6" value="<%=email %>">&nbsp;@&nbsp;<input type="text" name="domain2" size="6" value="<%=domain%>"><br>
 			<label>sms수신여부</label> 
			<input type="radio" name="isSmsOk" <%if(memberBean.getMember_sms_ok().equals("ok")){ %>checked="checked" <%}%>value="ok">동의 
			<input type="radio" name="isSmsOk" <%if(memberBean.getMember_sms_ok().equals("no")){ %>checked="checked" <%}%>value="no">동의안함 <br>
 	<label>email수신여부</label> 
  			<input type="radio" name="isEmailOk" <%if(memberBean.getMember_email_ok().equals("ok")){ %>checked="checked" <%}%>value="ok">동의
  			<input type="radio" name="isEmailOk" <%if(memberBean.getMember_email_ok().equals("no")){ %>checked="checked" <%}%>value="no">동의안함 <br> 
	
	<label>좌표정보</label> <input type="text" name="resulty"
				id="resulty" placeholder="y좌표" value="<%=memberBean.getMember_address_y1()%>"> <input type="text"
				name="resultx" id="resultx" placeholder="x좌표" value="<%=memberBean.getMember_address_x1()%>"><br>
	
	
		
		
		
		</fieldset>
		<div class="clear"></div>
		<div id="buttons">
			<input type="submit" value="회원수정" class="submit">
			 <input type="button" value="취소"  onclick="history.back();">
			 <input type="button" value="삭제"  onclick="location.href='MemberDeletePro.me'">
		</div>
	</form>

</body>
</html>









