<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.Admin_memberPageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
<<<<<<< HEAD
	//Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<MemberBean> memberList = (ArrayList<MemberBean>) request.getAttribute("memberList");
	Admin_memberPageInfo pageInfo = (Admin_memberPageInfo) request.getAttribute("pageInfo");

	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();

	// 세션 아이디 가져오기
	String sId = (String) session.getAttribute("sId");

	// 만약, 회원만 게시판 목록 조회가 가능할 경우
	// 세션 아이디 없으면 Main.bo 로 이동
=======
    //Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
    ArrayList<MemberBean> memberList = (ArrayList<MemberBean>) request.getAttribute("memberList");
    Admin_memberPageInfo pageInfo = (Admin_memberPageInfo) request.getAttribute("pageInfo");
    // PageInfo 객체로부터 페이징 정보 가져오기
    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    int maxPage = pageInfo.getMaxPage();
    // 세션 아이디 가져오기
    String sId = (String) session.getAttribute("sId");
    // 만약, 회원만 게시판 목록 조회가 가능할 경우
    // 세션 아이디 없으면 Main.bo 로 이동
>>>>>>> branch 'master' of https://github.com/mjpo26/ShoppingMall.git
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 날짜선택 임포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 날짜선택임포트 끝 -->

<!-- 날짜선택 스크립트 -->
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>

<!-- 날짜선택 스크립트 끝 -->



<title>관리자 고객관리</title>
</head>
<body>

	<form action="./Admin_memberList.am" name="fr" method="post">

		<table border="1">
			<tr>

				<th colspan='2'>관리자_고객관리</th>

			</tr>
			<tr>

				<th>검색어(드롭다운으로 합치기)</th>

				<td><label>Id검색</label><input type="text" size="10"
					name="searchId"></td>

			</tr>

			<tr>

				<th>검색어(드롭다운으로 합치기)</th>

				<td><label>이름 검색</label><input type="text" size="10"
					name="searchName"></td>

			</tr>

			<tr>

				<th>검색어(드롭다운으로 합치기)</th>

				<td><label>전화번호 검색</label><input type="text" size="10"
					name="searchPhone"></td>

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
				<td>시작날짜:<input type="text" name="pickStart" id="pickStart">끝 날짜:<input
					type="text" name="pickEnd" id="pickEnd"></td>


			</tr>



		</table>
		<input type="submit" value="검색">
	</form>
	<br>
	<br>
	<table border="1">
		<tr>

			<td colspan='11'>[검색결과 <%=listCount%>건]&nbsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp; <select>
					<option>주문일 순</option>
					<option>오름차순</option>
					<option>내림차순</option>

			</select><select>
					<option>10개</option>
					<option>20개</option>
					<option>50개</option>

			</select></td>

		</tr>

		<tr>

			<td><input type="checkbox"></td>

			<td>아이디</td>
			<td>이름</td>
			<td>주소</td>
			<td>휴대전화</td>
			<td>메일수신</td>
			<td>sns수신</td>
			<td>메모</td>
		</tr>
		<tr>
			<%
				for (int i = 0; i < memberList.size(); i++) {
			%>
		
		<tr>
			<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
			<th><input type="checkbox"></th>
			<th><%=memberList.get(i).getMember_id()%></th>
			<th><%=memberList.get(i).getMember_name()%></th>
			<th><%=memberList.get(i).getMember_address1()%></th>
			<th><%=memberList.get(i).getMember_phone()%></th>
			<th><%=memberList.get(i).getMember_email_ok()%></th>
			<th><%=memberList.get(i).getMember_sms_ok()%></th>
			<th><input type="button" value="회원삭제"><input
				type="button" value="회원수정"><input type="button"
				value="이메일전송"><input type="button" value="sns전송"></th>
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>

