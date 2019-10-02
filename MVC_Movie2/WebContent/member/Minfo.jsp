<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="vo.MemberBean"%>
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
	%>
<jsp:include page="../main/top.jsp"></jsp:include>

<section class="breadcrumb breadcrumb_bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="breadcrumb_iner">
					<div class="breadcrumb_iner_item">
						<h2>회원정보</h2>
						<p>
							회원정보 <span>-</span>회원정보조회
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 내용시작 -->
	<section class="cart_list shopping_cart mt-5">
		<div class="container">
			<div class="row clearfix">
				<table class="table">
<tr>
						<th align="left" width="800" colspan="6"><span
							style="color: red; font-weight: bold;">회원 정보</span></th>
					</tr>
					<tr>
						<th width="200" align="center">아이디</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_id()%></td>
						<th width="200" align="center">이름</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_name()%></td>
					</tr>
					<tr>
						<th width="200" align="center">연락처</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_phone()%></td>
						<th width="200" align="center">이메일</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_email()%></td>
					</tr>
					
					<tr>
						<th width="200" align="center">우편번호</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_postcode1()%></td>
						<th width="200" align="center">주소</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_address1()%></td>
					</tr>
					
					<tr>
						<th width="200" align="center">보유 포인트</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_mypoint()%></td>
						<th width="200" align="center">보유 쿠폰</th>
						<td width="200" align="center" colspan="2">서비스 예정</td>
					</tr>
					
					<tr>
						<th width="200" align="center">sms 수신여부</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_sms_ok()%></td>
						<th width="200" align="center">email 수신여부</th>
						<td width="200" align="center" colspan="2"><%=memberBean.getMember_email_ok()%></td>
					</tr>
					
				</table>
				<br><br>
				<input type="button" class="btn btn-secondary" value="회원수정" onclick="location.href='./MemberUpdate.me'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-secondary" value="장바구니 조회" onclick="location.href='./BasketInfo.bl'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-secondary" value="주문정보 조회" onclick="location.href='./orderInfo.sh'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="button" class="btn btn-secondary" value="회원탈퇴" onclick="location.href='./deleteMember.me'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</section>

<jsp:include page="../main/foot.jsp"></jsp:include>


















