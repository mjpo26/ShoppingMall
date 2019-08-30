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
					<li><a href="product_main.jsp">상품관리</a></li>
					<li><a href="#">주문관리</a></li>
					<li><a href="#">고객관리</a></li>
					<li><a href="#">게시판관리</a></li>
					<li><a href="#">통계분석</a></li>
				</ul>
			</nav>
		</div>
		<form action="../ItemInsert.sh" method="get">
		<div style="height: 200px; width: 400px; float: left;">
			<h3>오늘매출현황</h3>
			<table border="1">
				<tr>
					<th colspan="3" >상품명(필수)</th>
					<td colspan="5" ><input type="text" name="title"></td>
				</tr>
				<tr>
					<th colspan="3">판매가(필수)</th>
					<td colspan="5"><input type="text" name="old_price"></td>
				</tr>
				<tr>
					<th colspan="3">상품요약설명</th>
					<td colspan="5"><textarea rows="5" cols="30" name="content1"></textarea></td>
				</tr>
				<tr>
					<th colspan="3">상품상세설명</th>
					<td colspan="5"><textarea rows="5" cols="30" name="content2">에디트박스는 따오는건가욤?</textarea></td>
				</tr>
				<tr>
					<th colspan="2">첨부파일</th>
					<td colspan="2"><input type="file" name="Item_BGpic"></td>
					<th colspan="2">추가이미지</th>
					<td colspan="2"><input type="file" name="Item_pic1"></td>
				</tr>
			</table>
			<h3>컬러</h3>
			<input type="checkbox" name="Item_option_color1" value="블랙">블랙
			<input type="checkbox" name="Item_option_color2" value="화이트">화이트
			<input type="checkbox" name="Item_option_color3" value="레드">레드
			<input type="checkbox" name="Item_option_color4" value="옐로우">옐로우<br>
			
			<h3>진열상태</h3>
			<input type="radio" name="display" value="yes">진열함 
			<input type="radio"	name="display" value="no">진열안함
			<h3>판매상태</h3>
			<input type="radio" name="Item_sales" value="yes">판매함 
			<input type="radio"	name="Item_sales" value="no">판매안함
			<h3>매인진열</h3>
			<input type="radio" name="category" value="recommend"> 추천상품 
			<input type="radio"	name="category" value="new"> 신상품 
			<input type="radio" name="category" value="ca1">카테고리1
			<input type="radio" name="category" value="ca2">카테고리2

			<div style="display: inline-block">
				<h3>상품분류</h3>
				<input type="text"> <input type="button" value="검색">
				<!-- 위에꺼(상품분류) 이부분은 잠깐보류 -->
			</div>
			<h3>판매정보</h3>
			공급가 <input type="text" name="stock_price"> <br><br>
			소비자가 <input type="text" > <br><br>
			배송비 입력 <input type="text" name="delivery_pee" value="50000"><br><br>
			상품전체중량  <input type="text" name="weight"> <br><br>
			재고수량  <input type="text" name="stock_count"> <br><br>
			<input type="submit" value="등록하기">
			<input type="reset" value="취소하기"> 
		</div>
			</form>
	</div>

</body>
</html>
