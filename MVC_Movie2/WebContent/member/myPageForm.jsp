<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<table border="1">
	<tr>
		<td><a href="#">주문내역</a></td>
		<td><a href="#">회원정보</a></td>
		<td><a href="#">관심상품</a></td>
		<td><a href="#">적립금/예치금</a></td>
		<td><a href="#">게시물관리</a></td>
		<td><a href="#">배송주소록</a></td>
	</tr></table> <br><br><br>
</div>

<div>
<table border="1">
	<tr>
		<td><b>번호</b></td>
		<td><b>분류</b></td>
		<td><b>제목</b></td>
		<td><b>작성자</b></td>
		<td><b>작성일</b></td>
		<td><b>조회</b></td>
	</tr>

	<tr>
		<td>1</td>
		<td>질문답변</td>
		<td>배송문의</td>
		<td>mjpo</td>
		<td>2019-03-03</td>
		<td>55</td>
	</tr>
</table>
</div>
<br><br>
<div>
<b>검색</b><br>
<select>
 <option>제목</option>
 <option>글쓴이</option>
 <option>내용</option>
</select>
<input type="text" size="12">
<input type="button" value="찾기">

</div>
</body>
</html>