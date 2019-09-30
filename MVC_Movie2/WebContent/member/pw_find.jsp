<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../main/top.jsp"></jsp:include>


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
						<h3 class="mb-30 ">회원 정보</h3>
					</div>
				</div>
			<form method="get" action="./MemberFwfind.me">
					<div class="mt-10 row clearfix">
						<div class="float-left col-lg-2 d-md-block d-sm-none d-none">
							<label for="member_id">아 이 디</label>
						</div>
						<div class="col-lg-7 col-sm-8 col-8 float-left">
							<input type="text" id="id" name="member_id"
								placeholder="아이디를 입력해주세요"
								onfocus="this.placeholder = '아이디를 입력해 주세요'"
								onblur="this.placeholder = '아이디'" required class="single-input">
							<span id="text"></span><input type="hidden" id="isIdOk"
								value="no">
						</div>
					</div>
                        <div class="row mt-10">
                             <div class="col-lg-2 d-md-block d-sm-none d-none">
                                <label for="member_phone">휴대전화</label> 
                            </div>
                        
                            <div class="input-group-icon col-lg-3 col-4 mt-0">
                                <div class="icon"><i class="fa fa-mobile" aria-hidden="true"></i></div>
                                <div class="form-select" id="default-select">
                                    <select name="phone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="017">017</option>
                                        <option value="019">019</option>
                                    </select>
                                </div>
                             </div>
                             <div class="d-lg-block d-md-none d-none">_</div>
                            <div class="col-lg-3 col-4">
                                <input type="number" id="member_phone" name="phone2" placeholder="" onfocus="this.placeholder = ''" maxlength="4" onblur="this.placeholder = ''" class="single-input">
                            </div>
                             <div class="d-lg-block d-md-none d-none">_</div>
                            <div class="col-lg-3 col-4">
                                <input type="number" name="phone3" placeholder="" onfocus="this.placeholder = ''" maxlength="4" onblur="this.placeholder = ''" class="single-input">
                            </div>
                        </div>


					<div class="row mt-30">
						<div class="col-xs-12 col-sm-6 mx-auto row">
							<input type="submit"
								class="genric-btn primary radius col-6 submit" value="비밀번호찾기">
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