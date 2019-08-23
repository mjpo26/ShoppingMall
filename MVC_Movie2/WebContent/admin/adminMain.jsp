<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width: 520px">
	<h1 style="margin-bottom:0;">관리자 메인 페이지</h1>
	<div style="height:200px; width:120px;float:left;">
	<nav>
		<ul>
			<li><a href="#">상품관리</a></li>
			<li><a href="#">주문관리</a></li>
			<li><a href="#">고객관리</a></li>
			<li><a href="#">게시판관리</a></li>
			<li><a href="#">통계분석</a></li>
		</ul>
	</nav>
	</div>
	<div style="height:200px; width:400px;float:left;">
		<h3>오늘매출현황</h3>
		<table border="1">
			<tr>
				<td>주문</td>
				<td>결제</td>
				<td>환불</td>
			</tr>
			<tr>
				<td>0원</td>
				<td>0원</td>
				<td>0원</td>
			</tr>
		</table>

		<h3>주문현황</h3>
		<table border="1">
			<tr>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr>
				<td>입금전</td>
				<td>배송준비중</td>
				<td>배송대기</td>
				<td>배송중</td>
			</tr>
		</table>
		<h3>취소/교환/반품/환불 현황</h3>
		<table border="1">
			<tr>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr>
				<td>취소</td>
				<td>교환</td>
				<td>반품</td>
				<td>환불</td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>
