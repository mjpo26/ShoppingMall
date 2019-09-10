<%@page import="vo.PageInfo"%>
<%@page import="vo.Admin_DeliveryListBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    //Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
    ArrayList<Admin_DeliveryListBean> deliveryList = (ArrayList<Admin_DeliveryListBean>) request.getAttribute("deliveryList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
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
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="./DeliveryList.dl" name="fr" method="get">
	
	<table border="1">

		<tr>

			<th colspan='5'>관리자_주문관리_배송관리</th>

			<br>

		</tr>

		<tr>

			<th>입금전<br>//db 입금전수량 작성

			</th>

			<th>배송준비중<br>//db 배송준비중인수량 작성

			</th>

			<th>배송대기<br>//db 배송대기수량 작성

			</th>

			<th>배송중<br>//db 배송중인수량 작성
			<th>배송완료<br>//db 배송완료수량 작성
			</th>

		</tr>

	</table>

	<br>

	<table border="1">

		<tr>

			<th>검색어</th>

				<td><label>주문번호 검색</label>
				<input type="text" size="10" name="delivery_code"></td>
				
				<td><label>주문자 검색</label>
				<input type="text" size="10" name="delivery_member"></td>

		</tr>

		<tr>

			<th>기간검색</th>

			<td><select><option>하루</option>
					<option>7일</option>
					<option>15일</option>
					<option>1개월</option>

			</select></td>

			<td colspan='2'>날짜선택 <input type="date" value="2019-08-23"></td>

		</tr>

		<tr>

			<th>상품검색</th>

			<td colspan='3'><select>
					<option>상품명</option>
				</select> <input type="text" size="20" name="delivery_title">

		</tr>
		<tr>
		<th>입금 상태</th><td>
		<input type="radio" name="delivery_ok" value="전체">전체
		<input type="radio" name="delivery_ok" value="입금전">입금전
		<input type="radio" name="delivery_ok" value="입금완료(수동)">입금완료(수동)
		<input type="radio" name="delivery_ok" value="입금완료(자동)">입금완료(자동)</td>
		
		<th>입금은행</th><td>
		<input type="radio" name="delivery_bank" value="전체">전체
		<input type="radio" name="delivery_bank" value="부산은행">부산은행
		<input type="radio" name="delivery_bank" value="농협은행">농협은행
		<input type="radio" name="delivery_bank" value="국민은행">국민은행</td>
<tr>
</tr>



	</table>
	<input type="submit" value="검색">

	<input type="reset" value="초기화">
	</form>
	
	<div style="height: 200px; width: 900px; float: left;">
		<br> <br>
		<table border="1">

			<tr>
				<th colspan='14'>검색결과 리스트 출력</th>
			</tr>

		<tr>

			<td colspan='11'>[검색결과 <%=listCount %>건]&nbsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp; 
				<select>
				<option>주문일 순</option>
				<option>오름차순</option>
				<option>내림차순</option>

			</select><select>
			<option>10개</option>
			<option>20개</option>
			<option>50개</option>

			</select>
			</td>

		</tr>

		<tr>
			<th>체크</th>
			<th>주문일</th>

			<th>주문번호</th>

			<th>상품명</th>

			<th>주문자</th>


			<th>결제금액</th>

			<th>입금은행</th>
			<th>처리여부</th>

			<th>메모</th>
		</tr>
		
			<%
				for (int i = 0; i < deliveryList.size(); i++) {
			%>
		
		<tr>
			<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
			<th><input type="checkbox"></th>
			<th><%=deliveryList.get(i).getDelivery_date()%></th>
			<th><%=deliveryList.get(i).getDelivery_code()%></th>
			<th><%=deliveryList.get(i).getDelivery_title()%></th>
			<th><%=deliveryList.get(i).getDelivery_member_id()%></th>
			<th><%=deliveryList.get(i).getDelivery_sel_price()%></th>
			<th><%=deliveryList.get(i).getDelivery_bank()%></th>
			<th><%=deliveryList.get(i).getDelivery_ok()%></th>
			<th><%=deliveryList.get(i).getDelivery_memo()%></th>
			
		</tr>
		<%
			}
		%>
		
		</table>


		<section id="pageList">
			<%
				if (nowPage <= 1) {
			%>
			[이전]&nbsp;
			<%
				} else {
			%>
			<a href="deliveryList.dl?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
			<%
				}
			%>

			<%
				for (int i = startPage; i <= endPage; i++) {
					if (i == nowPage) {
			%>
			[<%=i%>]
			<%
				} else {
			%>
			<a href="deliveryList.dl?page=<%=i%>">[<%=i%>]
			</a>&nbsp;
			<%
				}
			%>
			<%
				}
			%>

			<%
				if (nowPage >= maxPage) {
			%>
			&nbsp;[다음]
			<%
				} else {
			%>
			<a href="deliveryList.dl?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
			<%
				}
			%>
		</section>
	</div>
	
</body>
</html>