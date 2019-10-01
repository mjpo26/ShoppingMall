<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("sId");
	//세션값 가져와서 변수에 저장
%>
<jsp:include page="../assets/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>회원정보</h2>
						<p>
							회원탈퇴 <span>-</span>회원탈퇴
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="review_board_content board_content">
	<div class="container mainDiv">
	<div class="review_content col-lg-8 mx-auto mt-5 p-5">
			<form action="deletePro.me" id="join" method="post">
				<fieldset>
					<legend>회원 탈퇴</legend>
					<label>User ID</label> <input type="text" class="form-control" name="id" value="<%=id%>"
						readonly><br> <label>Password</label> <input
						type="password"  class="form-control" name="member_pass"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="회원탈퇴" class="submit"  class="genric-btn primary radius submit"> 
					<input type="reset" value="취소" class="cancel" class="genric-btn default radius" onclick="history.back()"  >

				</div>
			</form>
		</div>
	</div>
</section>

<jsp:include page="../main/foot.jsp"></jsp:include>








