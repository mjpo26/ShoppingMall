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
			<th colspan='4'>주문관리_전체주문목록</th>
		</tr>

		<tr>
			<th>검색어</th>
			<td colspan='3'><select><option>주문번호</select> <input
				type="text" size="12"></td>
		</tr>

		<tr>
			<th>기간검색</th>
			<td colspan="4"><select name="search">
					<option>오늘
					<option>7일
					<option>15일
					<option>1개월
			</select>
		  	날짜선택 <input type="date" value="2019-08-23"></td>
		</tr>

		<tr>
			<th>상품 검색</th>
			<td colspan='3'><select><option>상품명</option>
					<option>주문자</option></select> <input type="text" size="20"><input
				type="button" value="검색"></td>
		</tr>
		
	    <tr>
			<th>배송상태</th>
			<td colspan='3'>
			<input type="checkbox">전체 
			<input type="checkbox">배송준비중
			<input type="checkbox">배송대기
			<input type="checkbox">배송중
			<input type="checkbox">배송완료
		</tr>
		
		<tr>
			<th>주문상태</th>
			<td colspan='3'>
			<input type="checkbox">전체 
			<input type="checkbox">취소
			<input type="checkbox">교환
			<input type="checkbox">취소
			<input type="checkbox">교환
		</tr>

		<tr>
			<th>결제상태</th>
			<td><input type="checkbox" >전체
			<input type="checkbox" >입금전
			<input type="checkbox">입금완료
			<input type="checkbox">결제완료
			</td>
			<th>회원구분</th>
			<td><input type="checkbox">전체 <input type="checkbox">회원
				<input type="checkbox">비회원</td>
		</tr>
	</table>

	<input type="button" value="검색">

	<input type="reset" value="초기화">
	<br>
	<br>

	<br>
	<br>
	<p>
	<div style="height: 200px; width: 900px; float: left;">
		<br> <br>
		<table border="1">

			<tr>

				<th colspan='14'>검색결과 리스트 출력</th>


			</tr>

			<tr>

				<td colspan='14'>[검색결과 0건]&nbsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					&emsp;&emsp;&emsp;&emsp; <select><option>등록일
						<option>오름차순
						<option>내림차순</select><select>
						<option>10개
						<option>20개
						<option>50개
				</select>
				<input type="button" value="검색">
				</td>

			</tr>

			<tr>
				<th><input type="checkbox"></th>
				<th>주문일(결제일)</th>

				<th>주문번호</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>결제수단</th>
				<th>결제상태</th>
				<th>미배송</th>
				<th>배송중</th>
				<th>배송완료</th>
				<th>취소</th>
				<th>교환</th>
				<th>반품</th>
				<th>메모</th>
			</tr>
			<tr>
				<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
				<th><input type="checkbox"></th>
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
				<th></th>
				<th></th>
				<th>메모</th>
			</tr>




		</table>
	</div>
	</div>
</body>
</html>