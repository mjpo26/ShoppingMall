<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<MemberBean> memberList = (ArrayList<MemberBean>) request.getAttribute("memberList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();

	// 세션 아이디 가져오기
	String sId = (String) session.getAttribute("sId");
%>

<jsp:include page="../main/adminTop.jsp"></jsp:include>
<h3>관리자 멤버 리스트</h3>
</div>
</div>
</header>

<!-- 날짜선택임포트 시작 -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 날짜선택임포트 끝 -->

<!-- dataTables 시작-->
<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var table = $('#example').DataTable({
							columnDefs : [ {
								orderable : true

							} ]
						});

						$('button')
								.click(
										function() {
											var data = table.$('input, select')
													.serialize();
											alert("The following data would have been submitted to the server: \n\n"
													+ data.substr(0, 120)
													+ '...');
											return false;
										});
					});
</script>
<!-- dataTables 끝-->

<!-- 날짜선택 스크립트 -->
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>
<!-- 날짜선택 스크립트 -->
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>

<script type="text/javascript">
	function pickNullCheck() {
		if (document.fr1.pickStart.value == "") {
			//      document.fr1.pickStart.value=="2015-01-01";
			var pickStart = $('#pickStart').val('01/01/2010');

			return false;
		}
		if (document.fr1.pickEnd.value == "") {
			//   document.fr1.pickEnd.value=="2020-01-01";
			var pickEnd = $('#pickEnd').val('01/01/2020');

			return false;
		}

		//

	}
</script>
<!-- 날짜선택 스크립트 끝 -->


<article id="content">
	<div class="container mainDiv">
		<form action="./Admin_memberList.me" name="fr1" method="post"
			onsubmit="return pickNullCheck()">
			<div class="content_title">
				<h1>회원 검색</h1>
			</div>
			<table class="table">
				<tr>
					<th>Id검색</th>
					<td><input type="text" size="10" name="searchId"></td>
				</tr>
				<tr>
					<th>이름 검색</th>
					<td><input type="text" size="10" name="searchName"></td>

				</tr>
				<tr>
					<th>전화번호 검색</th>
					<td><input type="text" size="10" name="searchPhone"></td>
				</tr>
				<tr>
					<th>sms수신</th>
					<td><input type="radio" name="smsOk" value="ok">수신허용<input
						type="radio" name="smsOk" value="no">수신안함</td>

				</tr>
				<tr>
					<th>email수신</th>
					<td><input type="radio" name="emailOk" value="ok">수신허용<input
						type="radio" name="emailOk" value="no">수신안함</td>
				</tr>
				<tr>
					<th>날짜 설정</th>
					<td>시작날짜:&nbsp;<input type="text" name="pickStart"
						id="pickStart"> &nbsp;&nbsp;&nbsp;&nbsp; 끝 날짜:&nbsp;<input
						type="text" name="pickEnd" id="pickEnd"></td>
				</tr>
			</table>
			<input class="btn btn-primary" type="submit" value="검색"><br>
		</form>

		<div style="width: 100%; float: left;">
			<div class="content_title">
				<h1>멤버 리스트</h1>
			</div>
			<table id="example" class="display compact table">
				<thead>
					<tr>
						<td><input type="checkbox"></td>
						<th>Id</th>
						<th>이름</th>
						<th>주소</th>
						<th>휴대전화</th>
						<th>sns수신</th>
						<th>메일수신</th>
						<th>포인트내역</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < memberList.size(); i++) {
					%>
					<tr>
						<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
						<td><input type="checkbox"></td>
						<td><%=memberList.get(i).getMember_id()%></td>
						<td><%=memberList.get(i).getMember_name()%></td>
						<td><%=memberList.get(i).getMember_address1()%></td>
						<td><%=memberList.get(i).getMember_phone()%></td>
						<td><%=memberList.get(i).getMember_sms_ok()%></td>
						<td><%=memberList.get(i).getMember_email_ok()%></td>
						<td><%=memberList.get(i).getMember_mypoint()%></td>
						<td><a
							href="./deleteMemberAdmin.me?id=<%=memberList.get(i).getMember_id()%>">
								<input class="btn btn-default" type="button" value="회원삭제">
						</a>
						<input class="btn btn-default" type="button" value="회원수정">
							<input class="btn btn-default" type="button" value="이메일전송">
							<input class="btn btn-default" type="button" value="sms전송"></td>
					</tr>
					<%
						}
					%>
				</tbody>
				<tfoot>
				</tfoot>
			</table>
		</div>


	</div>
</article>
</div>
<!-- id=main div  -->
</div>

<script src="./assets/js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="./assets/js/bootstrap.min.js"></script>
<!-- easing js -->
<script src="./assets/js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/jquery.counterup.min.js"></script>
<script src="./assets/js/jquery.ajaxchimp.min.js"></script>
<script src="./assets/js/jquery.form.js"></script>
<!-- custom js -->
<script src="./assets/js/theme.js"></script>
<script src="./assets/js/custom.js"></script>
</body>
</html>
