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
			<th>기간 관리
			</th>
			<td colspan='5'>
			<select>
			<option>오늘</option>
			<option>7일</option>
			<option>15일</option>
			<option>1개월</option>
			</select></td>

			<td colspan='5'>날짜선택 <input type="date" value="2019-08-23"></td>
		</tr>
		<tr>
			<td>게시판 선택</td>
			<td colspan='12'>
			<select>
			<option>게시판목록</option>
			<option>리뷰게시판</option>
			<option>상품게시판</option>
			</select></td>
		</tr>
		<tr>
			<th>게시판 검색</th>
			<td colspan='12'><select>
			<option>제목</option>
			<option>작성자</option>
			</select>  &nbsp;<input type="text" size="6">&nbsp;&nbsp;&nbsp;<input
				type="checkbox">비회원 글 검색</td>
			
		</tr>
		<tr>
			<th>답변여부</th>
			<td><input type="checkbox">전체보기
			<input type="checkbox">답변중
			<input type="checkbox">처리중
			<input type="checkbox">답변완료</td>
			<th>댓글여부</th>

			<td colspan='5'><input type="checkbox">전체보기
			<input type="checkbox">있음
			<input type="checkbox">없음</td>
		</tr>
		<tr>
			<th>이미지여부</th>
			<td colspan='12'><input type="checkbox">전체보기
			<input type="checkbox">있음
			<input type="checkbox">없음
			</td>
			</tr>
			<tr><td colspan='12'><input type="button" value="검색"></td></tr>
				
	</table>
	<br>
	<table border="1">

		<tr>

			<th colspan='12'>게시물 검색목록</th>

		</tr>

		<tr>

			<td colspan='12'>[오늘 등록된 글  0건]검색결과 0건
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;
				<select>
				<option>정렬방식</option>
				<option>오름차순</option>
				<option>내림차순</option>

			</select><select>
			<option>10개</option>
			<option>20개</option>
			<option>50개</option>
			</select></td>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>글번호</th>
			<th>게시판</th>
			<th>글제목</th>
			<th>답변상태</th>
			<th>게시글보기</th>
			<th>답변하기</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>댓글</th>
			<th>이미지</th>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th><input type="button" value="게시글 보기"></th>
			<th><input type="button" value="답변하기"></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		



	</table>

</body>
</html>