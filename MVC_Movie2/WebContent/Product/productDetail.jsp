<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
</head>
<body>

<h1>제품 상세페이지</h1>


	<div style="width:500; float:left;">
		<div>
			<nav>
				<img alt="" src="../image/doodle.png" width="350px" height="450px">
			</nav>
		</div> 
	</div>
	<br><br><div style="width:800; float:left;">
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이콘 / 아이콘 / 아이콘 / 아이콘 <br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>상품 제목줄</b><br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>가격</b><br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>할인가격(이벤트)</b><br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>상세내용 요약</b><br><br>
	<br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Color</b>
		   <select>
			 <option>Size</option>
			 <option>S</option>
			 <option>L</option>
			</select>
						
			<select>
			 <option>Color</option>
			 <option>White</option>
			 <option>Black</option>
			</select>
					
			<br><br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="장바구니 담기"><br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="즉시구매"><input type="submit" value="찜하기">
</div><br>

<div style="clear:both;">
<h3>*일괄구매 또는 코디세트</h3>
<table>
	<tr>
		<td><img alt="" src="../image/doodle.png" width="150px" height="150px"></td>
		<td><img alt="" src="../image/doodle.png" width="150px" height="150px"></td>
		<td><img alt="" src="../image/doodle.png" width="150px" height="150px"></td>
		<td><img alt="" src="../image/doodle.png" width="150px" height="150px"></td>
	</tr>
</table>
</div>


<h3>상품 이름</h3>	<!-- 정렬 기준 -->
<select>
 <option>설명</option>
 <option>가격</option>
 <option>옵션</option>
</select>

<input type="submit" value="장바구니">
<input type="submit" value="찜하기"><br>

</body>
</html>