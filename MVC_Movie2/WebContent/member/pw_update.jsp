<%@page import="vo.MemberBean"%>
<jsp:include page="../main/top.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
%>

<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<script type="text/javascript">

function check() {

    if (document.updateForm.id.value == "") {
        alert("아이디를 입력하세요!");
        document.updateForm.id.focus();
        return false;
    }
    if (document.updateForm.pass.value == "") {
        alert("비밀번호를 입력하세요");
        document.updateForm.pass.focus();
        return false;
    }
    
    if (document.updateForm.isPassOk.value=="no"||document.updateForm.isIdOk.value=="no") {
      alert("아이디와 비밀번호를 체크하세요")
      document.updateForm.id.focus();
      return false;
 }
    
    
//     if (document.updateForm.pass.value.length <= 7) {
//         alert("비밀번호가 유효하지 않습니다!")
//         document.fr.pass.focus();
//         return false;
//     }

//     if (document.updateForm.passChecked.value != "yes") {
//         var fpass = document.fr.pass.value;

//         window.open("passCheckPro.jsp?fpass=" + fpass, "",
//                 "width=400,height=200");

//         return false;

//     }
    if (document.updateForm.pass2.value.length == "") {
        alert("비밀번호 확인란을 입력하세요!")
        document.updateForm.pass2.focus();
        return false;
    }
//     if (document.updateForm.pass.value != document.updateForm.pass2.value) {
//         alert("비밀번호가 일치되지 않습니다.");
//         document.updateForm.pass2.focus();
//         return false;
//     }

    if (document.updateForm.member_name.value.length == "") {
        alert("이름을 입력하세요!")
        document.updateForm.member_name.focus();
        return false;
    }

    if (document.updateForm.detailaddress.value.length == "") {
        alert("상세 주소를 입력하세요!")
        document.updateForm.detailaddress.focus();
        return false;
    }

    if (document.updateForm.email.value.length == "") {
        alert("이메일을 입력하세요!")
        document.updateForm.email.focus();
        return false;
    }
    if (document.updateForm.email2.value.length == "") {
        alert("이메일 확인란을 입력하세요!")
        document.updateForm.email2.focus();
        return false;
    }

    if (document.updateForm.email.value != document.updateForm.email2.value) {
        alert("이메일이  일치되지 않습니다.");
        document.updateForm.email2.focus();
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
    document.updateForm.domain.value = domain.value;
    document.updateForm.domain2.value = domain.value;
    
}
// function  {
//   document.updateForm.idDuplication.value = "idUncheck";
//}

// function idcheck() {
//     // id 텍스트 상자가 비어있으면  "아이디입력" 제어
   
//     var fid = encodeURIComponent(document.updateForm.id.value);
//     var fcheck = document.updateForm.idDuplication.value;
//     //한글 안깨지는 ie 폼 불러오기
//     //fid = document.wfr.id.value;
//     //opener.document.fr.id.value = document.wfr.id.value;
//     if (fid == "") {
//         alert("아이디입력");
//         document.updateForm.id.focus();
//         return;
//     }
//     //  아이디 입력되어있으면 새창열기  "idcheck.jsp"
//     //  window.open("파일이름","창이름","옵션");
//     window.open("./idcheck.jsp?fid=" + fid, "", "width=400,height=200");
// }

// 아이디 중복체크
//$('.dup').click(function() {
//   if ($('#id').val() == "") {
//      alert("아이디중복을 확인하세요.");
//      $('#id').focus();
//      return false;
//   }
//   $.ajax('idcheck2.jsp',{
//      data:{id:$('#id').val()},
//      success : function (data) {
        
//      }
//   });
//});


$(function() {
$("input[name='dup']").on("click", function(){
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
//           alert(data);
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
    else if(p1<=8 && !pattern1.test($('[name=pass]').val()) && !pattern2.test($('[name=pass]').val()) 
          && !pattern3.test($('[name=pass]').val())){
      // $('#pwd_chk1').html('');
           $("#text3").text('');
         $("#text2").css("color","blue");
         $("#text2").text(' 사용 가능한 비밀번호 입니다.');
        $("#pass2").focus();

      }else{
         $("#text3").text('');
         $("#text2").css("color","blue");
         $("#text2").text(' 사용 가능한 비밀번호 입니다.');
//          document.getElementById('isPassOk').value = "yes";
        $("#pass2").focus();
      }
      }
     );
  });

$(document).ready(function(){
     $('[name=pass2]').keyup(function(){
       
        
        if(document.getElementById('isPassOk').value=="no"){               
           if ( $('[name=pass]').val() != $('[name=pass2]').val()) {
              $("#text3").css("color","red");
              $("#text2").text('');
              $("#text3").text('비밀번호가 일치하지 않습니다!');  
            
              
             }else{
              $("#text2").text('');
                $("#text3").css("color","blue");
               $("#text3").text('비밀번호가 일치합니다!');                 
         document.getElementById('isPassOk').value = "yes";
             }
        }
        else{
           //$("#member_pass").focus();
           $("#text2").text(' 비밀번호가 일치합니다.');
        }
        
     });
  });

</script>
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>비밀번호 변경</h2>
						<p>
							비밀번호 변경 <span>-</span> 비밀번호 변경
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="join_part padding_top">
	<div class="container">
		<div class="align-items-center">
			<div class="col-lg-8 col-md-8 col-sm-12 mx-auto">
				<div class="clearfix overflow-hidden">
					<div class="float-left">
						<h3 class="mb-30 ">비밀번호 변경</h3>
					</div>
				</div>
				<form action="MemberPwUpdatePro.me" id="join" method="post"
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
								type="hidden" id="isIdOk" value="yes">
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
							<span id="text2" style="padding-left: 1em;"></span> <span
								id="text3" style="padding-left: 0.5em;"></span> <input
								type="hidden" id="isPassOk" value="no">
						</div>

					</div>


					<div class="row mt-30">
						<div class="col-xs-12 col-sm-6 mx-auto row">
							<input type="submit"
								class="genric-btn primary radius col-6 submit" value="비밀번호 변경" >
							<input type="reset"
								class="genric-btn default radius col-6 cancel" value="초기화">
						</div>


					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../main/foot.jsp"></jsp:include>