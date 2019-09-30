<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
	String authNum = (String) request.getAttribute("authNum");
// 	String id = memberBean.getMember_id();
%>
<script type="text/javascript">
	function mailCheck() {

		if (document.getElementById('mailCk').value != document
				.getElementById('mailHidden').value) {

			alert("인증번호가 일치하지않습니다");

		} else {
// 			var id = memberBean.getMember_id();
			alert("인증번호가 일치합니다.");
// 			window.open("pw_modify.jsp?id="+id);
		}
	}
</script>


<jsp:include page="../assets/top.jsp"></jsp:include>


<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>비밀번호 찾기</h2>
						<p>
							회원 <span>-</span> 비밀번호 찾기
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
						<h3 class="mb-30 ">이메일로 발송된 인증번호를 입력하여주세요.</h3>
					</div>
				</div>
				<form method="post" name="joinForm">
					<input type="hidden" id="mailHidden" value="<%=authNum%>"> <input
						type="text" id="mailCk" name="no"> <input type="button"
						onclick="mailCheck()"
						class="genric-btn primary radius col-2 submit" value="확인"><br>
				</form>
				<div class="row mt-30">
					<div class="col-xs-12 col-sm-6 mx-auto row">
						<input type="button" value="로그인 이동"
							class="genric-btn primary radius col-6 submit"
							onclick="location.href='./MemberLoginForm.me'">
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../main/foot.jsp"></jsp:include>