<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: #000000 solid;
	border-width: 0px 0px 0px 0px
}
form {
	display: inline
}
</style>
</head>
<body>
	<div style="width: 520px">
		<h1 style="margin-bottom: 0;">관리자 메인 페이지</h1>
		<div style="height: 200px; width: 120px; float: left;">
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
		<div style="height: 200px; width: 400px; float: left;">
			<h3>오늘매출현황</h3>
			<table border="1">
				<tr>
					<th colspan="3">상품명(필수)</th>
					<td colspan="5"><input type="text"></td>
				</tr>
				<tr>
					<th colspan="3">판매가(필수)</th>
					<td colspan="5"><input type="text"></td>
				</tr>
				<tr>
					<th colspan="3">상품요약설명</th>
					<td colspan="5"><textarea rows="5" cols="30"></textarea></td>
				</tr>
				<tr>
					<th colspan="3">상품상세설명</th>
					<td colspan="5"><textarea rows="5" cols="30">에디트박스는 따오는건가욤?</textarea></td>
				</tr>
				<tr>
					<th colspan="2">첨부파일</th>
					<td colspan="2"><input type="file" name="file"></td>
					<th colspan="2">추가이미지</th>
					<td colspan="2"><input type="file" name="file"></td>
				</tr>
			</table>
			<h3>진열상태</h3>
			<input type="radio" value="yes">진열함 <input type="radio"
				value="no">진열안함
			<h3>판매상태</h3>
			<input type="radio" value="yes">판매함 <input type="radio"
				value="no">판매안함
			<h3>매인진열</h3>
			<input type="radio" value="recommend">추천상품 <input type="radio"
				value="new">신상품 <input type="radio" value="ca1">카테고리1
			<input type="radio" value="ca2">카테고리2

			<div style="display: inline-block">
				<h3>상품분류</h3>
				<input type="text"> <input type="button" value="검색">
			</div>
			<h3>판매정보</h3>
			공급가 <input type="text"> <br><br>
			소비자가 <input type="text"> <br><br>
			배송비 입력 <input type="text" value="50000"><br><br>
			상품전체중량  <input type="text"> <br><br>
			재고수량  <input type="text"> <br><br>
			<input type="submit" value="등록하기">
			<input type="reset" value="취소하기"> 
		</div>
	</div>
</body>
</html>
