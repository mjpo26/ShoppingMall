<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!-- 네아로 임포트 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%
    String clientId = "t264Qh6r0U2esDUlEFWD";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/MVC_Movie/MemberLoginPro.me", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<!-- 네이버 jsp로 설정 -->

   
    
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
<jsp:include page="../main/top.jsp"></jsp:include>
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

  
<!--   네이버 버튼 시작임 -->
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
<a href="http://nid.naver.com/nidlogin.logout">네이버로그아웃</a>

<!--네이버 버튼 끝          -->
<!-- 카카오버튼 -->



<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="https://developers.kakao.com/assets/img/about/logos/kakaologin/kr/kakao_login_btn_medium.png" width="300"/>
</a>
<a href="http://developers.kakao.com/logout">카카오로그아웃</a>

<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('e49d2d504fb15bb8ce46ff78327f611d');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>











<!-- <a id="kakao-login-btn"></a> -->
<!-- <a href="http://developers.kakao.com/logout">카카오로그아웃</a> -->


<!-- <script type='text/javascript'> -->
 //<![CDATA[
//     // 사용할 앱의 JavaScript 키를 설정해 주세요.
//     Kakao.init('e49d2d504fb15bb8ce46ff78327f611d');
//     // 카카오 로그인 버튼을 생성합니다.
//     Kakao.Auth.createLoginButton({
//       container: '#kakao-login-btn',
//       success: function(authObj) {
//         alert(JSON.stringify(authObj));
//         var token = authObj.access_token;
       
        
//         Kakao.API.request({
// 			url:'/v2/user/me',
//           success: function(res){
//              console.log(res);
//              var id = res.id;
//              var kakao_token =res.access_tocken;
//              var name = res.properties.nickname;
//              var image = res.properties.profile_image;
//              var email = res.kakao_account.email;
//              var emailSplit = email.split("@");
//              var email1 = emailSplit[0];
//     	  	var domain = emailSplit[1];
    	  
    	  	
// //     	  	alert(token);
// //     	  	alert(id);
    	  	
    	  	
//     	  	  $.ajax({
//     	  		 type:"POST",
<%--           		  url:"<%=request.getContextPath()%>/MemberLoginPro.me", --%>
//          		   data:{'kakao_token':token,"kakao_id":id},
//           		  success: function(res){
<%--                location='<%=request.getContextPath()%>/index.jsp' --%>
//             }
            
//          }) 
    	  	
    	  	
    	  	
    	  	
//           }
//        })
//          console.log(authObj);
        
       
        
        
        
       
        
//       },//api2.0석세스끝단
//       fail: function(err) {
//          alert(JSON.stringify(err));
//       }
//     });
//   //]]>
  
  
  

  
  
  
<!-- </script> -->



<!-- 카카오버튼 끝  -->
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

<jsp:include page="../main/foot.jsp"></jsp:include>

















