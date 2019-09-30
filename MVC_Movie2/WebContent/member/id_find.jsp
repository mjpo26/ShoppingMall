<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../main/top.jsp"></jsp:include>
<script type="text/javascript">
	function chkEmailDomainSelect(domain) {
		document.joinForm.domain.value = domain.value;
		document.joinForm.domain2.value = domain.value;

	}
</script>
<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>아이디 찾기</h2>
						<p>
							회원 <span>-</span> ID찾기
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
						<h3 class="mb-30 ">회원 정보</h3>
					</div>
				</div>
				<form method="get" action="./MemberfindID.me" name="joinForm">
					<div class="mt-10 row clearfix">
						<div class="float-left col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_id">이 름</label>
						</div>
						<div class="col-lg-7 col-sm-8 col-8 float-left">
							<input type="text" id="id" name="member_name"
								placeholder="이름을 입력해주세요"
								onfocus="this.placeholder = '이름을 입력해 주세요'"
								onblur="this.placeholder = '이름'" required class="single-input">
							<span id="text"></span><input type="hidden" id="isIdOk"
								value="no">
						</div>
					</div>
					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_email">이메일</label>
						</div>
						<div class="col-lg-4 col-sm-6 col-6">
							<input type="text" id="member_email" name="email"
								placeholder="이메일" onfocus="this.placeholder = '이메일'"
								onblur="this.placeholder = '이메일'" required class="single-input">
						</div>
						<div class="col-sm-1 col-1">@</div>
						<div class="col-lg-5 col-sm-5 col-5">
							<input type="text" name="domain" placeholder="직접입력"
								onfocus="this.placeholder = '직접입력'"
								onblur="this.placeholder = '직접입력'" required class="single-input">
						</div>
					</div>

					<div class="mt-10 row">
						<div class="col-lg-2 d-md-block d-sm-none d-none">
							<label for=""></label>
						</div>

						<div class="input-group-icon col-lg-10">
							<div class="icon">
								<i class="fa fa-at" aria-hidden="true"></i>
							</div>
							<div class="form-select" id="default-select2">
								<select onchange="chkEmailDomainSelect(this)">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="itwillbs.co.kr">itwillbs.co.kr</option>
								</select>
							</div>
						</div>


					</div>

					<div class="row mt-30">
						<div class="col-xs-12 col-sm-6 mx-auto row">
							<input type="submit"
								class="genric-btn primary radius col-6 submit" value="아이디찾기">
							<input type="reset"
								class="genric-btn default radius col-6 cancel" value="취 소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../main/foot.jsp"></jsp:include>