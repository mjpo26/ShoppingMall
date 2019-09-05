<%@page import="java.util.ArrayList"%>
<%@page import="vo.Order_PageInfo"%>
<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
        // Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
        	ArrayList<OrderBean> orderList = (ArrayList<OrderBean>)request.getAttribute("orderList");
        	Order_PageInfo pageInfo = (Order_PageInfo)request.getAttribute("pageInfo");
        	
        	// PageInfo 객체로부터 페이징 정보 가져오기
        	int listCount = pageInfo.getListCount();
        	int nowPage = pageInfo.getPage();
        	int startPage = pageInfo.getStartPage();
        	int endPage = pageInfo.getEndPage();
        	int maxPage = pageInfo.getMaxPage();
        	
        	// 세션 아이디 가져오기
        	String sId = (String)session.getAttribute("sId");
        	
        	// 만약, 회원만 게시판 목록 조회가 가능할 경우
        	// 세션 아이디 없으면 Main.bo 로 이동
        	
        	
        	if(sId == null) {
        	    out.println("<script>");
        	    out.println("alert('로그인이 필요한 메뉴입니다!')");
        	    out.println("location.href='Main.bo'");
        	    out.println("</script>");
        	}else if(sId != "admin") {
        	    out.println("<script>");
        	    out.println("alert('관리자 메뉴입니다!')");
        	    out.println("location.href='Main.bo'");
        	    out.println("</script>");
        	}
    %>    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_주문관리</title>
<style type="text/css">
#pageList {
		margin: auto;
		width: 800px;
		text-align: center;
	}
#emptyArea {
		margin: auto;
		width: 800px;
		text-align: center;
	}

</style>


</head>
<body>
<header>
		<!-- 세션 아이디가 있을 경우 로그아웃 링크(Logout.me) 표시, 없을 경우 로그인 링크(LoginForm.me) 표시 -->
		<p align="right">
		<%if(sId != null) { %>
			<a href="MemberInfo.me"><%=sId %>님</a> | <a href="MemberLogoutPro.me">로그아웃</a> 
		<%} else { %>	
			<a href="MemberLoginForm.me">로그인</a> 
		<%} %>
		</p>
	</header>
	<table border="1">
		<tr>
			<th colspan='4'>주문관리_전체주문목록</th>
		</tr>

		<tr>
			<th>검색어</th>
			<td colspan='3'><select><option>주문번호</select> <input
				type="text" size="12"></td>
		</tr>

		<tr>
			<th>기간검색</th>
			<td colspan="4"><select name="search">
					<option>오늘
					<option>7일
					<option>15일
					<option>1개월
			</select>
		  	날짜선택 <input type="date" value="2019-08-23"></td>
		</tr>

		<tr>
			<th>상품 검색</th>
			<td colspan='3'><select><option>상품명</option>
					<option>주문자</option></select> <input type="text" size="20"><input
				type="button" value="검색"></td>
		</tr>
		
	    <tr>
			<th>배송상태</th>
			<td colspan='3'>
			<input type="checkbox">전체 
			<input type="checkbox">배송준비중
			<input type="checkbox">배송대기
			<input type="checkbox">배송중
			<input type="checkbox">배송완료
		</tr>
		
		<tr>
			<th>주문상태</th>
			<td colspan='3'>
			<input type="checkbox">전체 
			<input type="checkbox">정상
			<input type="checkbox">교환
			<input type="checkbox">취소
			<input type="checkbox">교환
			<input type="checkbox">반품
			<input type="checkbox">환불
		</tr>

		<tr>
			<th>결제상태</th>
			<td><input type="checkbox" >전체
			<input type="checkbox" >입금전
			<input type="checkbox">입금완료
			<input type="checkbox">결제완료
			</td>
			<th>회원구분</th>
			<td><input type="checkbox">전체 <input type="checkbox">회원
				<input type="checkbox">비회원</td>
		</tr>
	</table>

	<input type="button" value="검색">

	<input type="reset" value="초기화">
	<br>
	<br>

	<br>
	<br>
	<p>
	<div style="height: 200px; width: 900px; float: left;">
		<br> <br>
		<table border="1">

			<tr>

				<th colspan='14'>검색결과 리스트 출력</th>


			</tr>

			<tr>

				<td colspan='14'>[검색결과 0건]&nbsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp; <select><option>등록일
						<option>오름차순
						<option>내림차순</select><select>
						<option>10개
						<option>20개
						<option>50개
				</select>
				<input type="button" value="검색">
				</td>

			</tr>
<%if(orderList !=null & listCount >0) {%>
			<tr>
				<th><input type="checkbox"></th>
				<th>주문일(결제일)</th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>결제수단</th>
				<th>결제상태</th>
				<th>미배송</th>
				<th>배송중</th>
				<th>배송완료</th>
				<th>취소</th>
				<th>교환</th>
				<th>반품</th>
				<th>메모</th>
			</tr>
			<tr>
			<%for(int i=0; i< orderList.size();i++) { %>
				<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
				<th><input type="checkbox"></th>
				<th></th>
				<th></th>
				<th></th>
				<th><%=sId %></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th>메모</th>
			</tr>
<%} %>
<!-- for문 닫기 -->
<%} %>
<!-- LIst != null 닫기 -->


<!-- 페이징처리 시작 -->


//
<!-- 페이징처리 끝 -->



		</table>
	</div>
</body>
</html>