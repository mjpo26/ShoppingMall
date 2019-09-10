<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<table border="1">
			<tr>
				<th colspan='10'>관리자 게시물 관리</th>
			</tr>
			<tr>
				<th>기간 관리</th>
				<td colspan='5'><select>
						<option>오늘</option>
						<option>7일</option>
						<option>15일</option>
						<option>1개월</option>
				</select></td>
				<td colspan='5'>날짜선택 <input type="date" value="2019-08-23"></td>
			</tr>
			<tr>
				<td>게시판 선택</td>
				<td colspan='12'><select name="board">
						<option>게시판목록</option>
						<option>리뷰게시판</option>
						<option>QnA게시판</option>
				</select></td>
			</tr>
			<tr>
				<th>내용 검색</th>
				<td colspan='12'>
				<label>제 목</label> <input type="text" size="20" name="title"><br>
			    <label>작성자</label> <input type="text" size="20" name="writer">
			</tr>
			
			<tr>
			   <th >답변여부</th>
				<td colspan='12'>
				<input type="radio" name="replyCheck" value="*">전체
				<input type="radio" name="replyCheck" value="답변전">답변전 
			    <input type="radio" name="replyCheck" value="처리중">처리중 
				<input type="radio" name="replyCheck" value="답변완료">답변완료</td>
			</tr>

			<tr>
				<th>이미지여부</th>
				<td colspan='12'>
				<input type="radio" name="imageCheck" value="*">전체
			    <input type="radio" name="imageCheck" value="있음">있음 
			     <input type="radio" name="imageCheck" value="없음">없음
			</tr>
			<tr>
				<td colspan='12'><input type="button" value="검색"></td>
			</tr>

		</table>
</body>
</html>