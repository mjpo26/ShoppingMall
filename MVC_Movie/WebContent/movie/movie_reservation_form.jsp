<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String movie_idx = request.getParameter("movie_idx");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 400px;
		border: 1px solid darkgray;
	}
	
</style>
<script type="text/javascript">
	// 인원 증가/감소 버튼 클릭 시 인원 수 변경
	function changeNumOfPeople(type) {
		var count = Number(reservationForm.numOfPeople.value); // 입력값 수치데이터로 변환
		
		if(type == "UP") {
			reservationForm.numOfPeople.value = count + 1;
			calculationPee(); // 요금 계산 함수 호출
		} else if(type == "DOWN") {
			if(count > 0) {
				reservationForm.numOfPeople.value = count - 1;
				calculationPee(); // 요금 계산 함수 호출
			}
		}
	}
	
	// 예매하기 버튼 클릭 시 입력된 인원 수 체크
	function check() {
		if(reservationForm.numOfPeople.value <= 0) {
			alert('예매 인원은 최소 1명 이상이어야 합니다.');
			return false;
		}
	}
	
	// 예매 인원에 따른 요금 계산
	function calculationPee() {
		var count = Number(reservationForm.numOfPeople.value);
		
		if(reservationForm.numOfPeople.value >= 0) {
			reservationForm.pee.value = count * 8000;
		} else {
			alert('인원이 잘못 입력되었습니다.');
		}
	}
</script>
</head>
<body>
	<h1>영화 예매</h1>
	<form action="MovieReservationPro.mo?movie_idx=<%=movie_idx %>" method="post" id="reservationForm" onsubmit="return check()">
		<table>
			<tr>
				<td>영화번호 : <%=movie_idx %></td>
				<td></td>
			</tr>
			<tr>
				<td>상영시간 : </td>
				<td>
					<select name="reservationTime">
						<option value="12:00">12:00</option>
						<option value="14:00">14:00</option>
						<option value="16:00">16:00</option>
						<option value="18:00">18:00</option>
						<option value="20:00">20:00</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>인원 : </td>
				<td>
					<input type="text" name="numOfPeople" size="3" value="0" onchange="calculationPee()">
					<input type="button" value="▲" onclick="changeNumOfPeople('UP')">
					<input type="button" value="▼" onclick="changeNumOfPeople('DOWN')">
				</td>
			</tr>
			<tr>
				<td>최종 금액 : </td>
				<td>
					<input type="text" name="pee" value="0" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="예매하기">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>



















