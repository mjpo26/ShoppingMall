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

			<th colspan='4'>관리자_주문관리_취소교환반품환불</th>

			<br>

		</tr>

		<tr>

			<th>취소<br>//db 취소수량 작성

			</th>

			<th>교환<br>//db 교환수량 작성

			</th>

			<th>반품<br>//db 반품수량 작성

			</th>

			<th>환불<br>//db 환불수량 작성

			</th>

		</tr>

	</table>

	<br>

	<table border="1">

		<tr>

			<th>검색어</th>

			<td colspan='2'><select>
			<option>주문번호</option>
			<option>주문자</option>
			
			</select><input type="text"></td>

		</tr>

		<tr>

			<th>기간검색</th>

			<td><select>
			<option>기간검색</option>
			<option>오늘</option>
			<option>7일</option>
			<option>15일</option>
			<option>1개월</option>

			</select></td>

			<td>날짜선택 <input type="date" value="2019-08-23"></td>

		</tr>

		<tr>

			<th>상품검색</th>

			<td colspan='2'><select>
			<option>상품명</option>
			<option>주문자</option>
			</select> 
			<input type="text" size="20"><input
				type="button" value="검색"></td>

		</tr>

		<tr>

			<th>회원구분</th>

			<td colspan='2'><input type="checkbox">전체<input type="checkbox">회원<input
				type="checkbox">비회원</td>

		</tr>

		<br>

		<br>

		
	</table>
<input type="button" value="검색">

		<input type="reset" value="초기화">
<br><br>
	<table border="1">

		<tr>

			<th colspan='10'>검색결과 리스트 출력</th>

		</tr>

		<tr>

			<td colspan='10'>[검색결과 0건]&nbsp;
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

			</select></td>

		</tr>

		<tr>

			<th>취소신청일</th>

			<th>주문번호 / 취소 번호</th>

			<th>주문자</th>

			<th>상품명/옵션</th>

			<th>수량</th>

			<th>취소금액</th>

			<th>결제수단</th>

			<th>주문상태</th>

			<th>취소처리</th>

			<th>메모</th>
		</tr>
		<tr>

			<th> </th>

			<th> </th>

			<th> </th>

			<th> </th>

			<th> </th>

			<th> </th>

			<th> </th>

			<th> </th>

			<th> </th>

			<th>메모 </th>
		</tr>
		



	</table>
</body>
</html>