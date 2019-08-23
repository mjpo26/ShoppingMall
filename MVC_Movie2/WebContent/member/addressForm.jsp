<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
 <script type="text/javascript"></script>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script>
     function sample6_execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
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
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("sample6_extraAddress").value = extraAddr;
                 
                 } else {
                     document.getElementById("sample6_extraAddress").value = '';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('sample6_postcode').value = data.zonecode;
                 document.getElementById("sample6_address").value = addr;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("sample6_detailAddress").focus();
             }
         }).open();
     }
 </script> 
 
</head>

<body>
<table border="1">
	<tr>
		<td><a href="#">주문내역</a></td>
		<td><a href="#">회원정보</a></td>
		<td><a href="#">관심상품</a></td>
		<td><a href="#">적립금/예치금</a></td>
		<td><a href="#">게시물관리</a></td>
	</tr></table> <br><br><br>

<a href="#">배송지1</a>
<a href="#">배송지2</a>
<a href="#">배송지3</a>
<a href="#">배송지4</a>
<a href="#">배송지5</a><br>

		<fieldset>
			<label>배송지명</label>
			<input type="text" name="id" class="id" placeholder="아이디를 입력하세요"><br>
							
 			<label>성명</label>
			<input type="text" name="pass" class="pass" placeholder="비밀번호를 입력하세요"><br> <label>주소</label> <input type="text" id="sample6_postcode" placeholder="우편번호">
		<button type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
		<br> <input type="text" name="address" id="sample6_address"
			placeholder="주소"> <input type="text" id="sample6_detailAddress"
			placeholder="상세주소"> <input type="text" id="sample6_extraAddress"
			placeholder="참고항목"> <br>
			<label>휴대전화</label> 
			<input type="text" name="mobile" placeholder="휴대폰 번호를 입력하세요">
	</fieldset>
				<br>
				<button type="submit">등록</button>&emsp;&emsp;&emsp;&emsp;&emsp;
				<button type="submit" value="Cancel">취소</button><br>
  
</body>
</html>