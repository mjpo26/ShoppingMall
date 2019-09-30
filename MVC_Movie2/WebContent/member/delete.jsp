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

<article id="content">
	<div class="container mainDiv">
		<section class="content product_insert">
			<form action="deletePro.me" id="join" method="post">
				<fieldset>
					<legend>회원 탈퇴</legend>
					<label>User ID</label> <input type="text" name="id" value="<%=id%>"
						readonly><br> <label>Password</label> <input
						type="password" name="pass"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="회원탈퇴" class="submit"> 
					<input type="reset" value="취소" class="cancel">

				</div>
			</form>
		</section>
	</div>
</article>

<jsp:include page="../assets/foot.jsp"></jsp:include>








