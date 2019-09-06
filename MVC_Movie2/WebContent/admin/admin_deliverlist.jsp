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

			<td colspan='3'><select><option>주문번호</option>
					<option>주문자</option>
			</select><input type="text"></td>

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
					<option>주문자</option>
				</select> <input type="text" size="20">
				<input type="button" value="검색"></td>

		</tr>
		<tr>
		<th>입금 상태</th><td>
		<input type="checkbox">전체
		<input type="checkbox">입금전
		<input type="checkbox">입금완료(수동)
		<input type="checkbox">입금완료(자동)</td>
		<td>입금은행</td>
		<td><select>
		<option>전체</option>
		<option>부산은행</option>
		<option>농협은행</option>
		<option>국민은행</option>
		
		</select>
		<tr>

			<th>회원구분</th>

			<td colspan='3'><input type="checkbox">전체<input
				type="checkbox">회원<input type="checkbox">비회원</td>

		</tr>

		<br>

		<br>


	</table>
	<input type="button" value="검색">

	<input type="reset" value="초기화">
	<br>
	<br>
	<table border="1">

		<tr>

			<th colspan='11'>검색결과 리스트 출력</th>

		</tr>

		<tr>

			<td colspan='11'>[검색결과 0건]&nbsp;
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

			<th>주문일</th>

			<th>주문번호</th>

			<th>상품명</th>

			<th>주문자</th>

			<th>구매금액</th>

			<th>결제금액</th>

			<th>입금자</th>

			<th>입금액</th>

			<th>입금은행</th>
			<th>처리여부</th>

			<th>메모</th>
		</tr>
		<tr>

			<th></th>

			<th></th>
			<th></th>

			<th></th>

			<th></th>

			<th></th>

			<th></th>

			<th></th>

			<th></th>

			<th></th>

			<th>메모</th>
		</tr>




	</table>
</body>
</html>