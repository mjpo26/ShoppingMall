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

			<th colspan='2'>관리자_고객관리</th>

		</tr>

		<tr>

			<th>검색어</th>

			<td><label>아이디적는곳</label><input type="text" size="10"></td>

		</tr>

		<tr>

			<th>sms수신</th>

			<td><input type="checkbox">전체<input type="checkbox">수신허용<input
				type="checkbox">수신안함</td>

		</tr>

		<tr>

			<th>email수신</th>

			<td><input type="checkbox">전체<input type="checkbox">수신허용<input
				type="checkbox">수신안함</td>

		</tr>


		

	</table>
<input type="button" value="검색">
<br><br>
	<table border="1">

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

			</select></td>

		</tr>

		<tr>

			<td><input type="checkbox"></td>

			<td>이름</td>

			<td>아이디</td>

			<td>가입일</td>

			<td>휴대전화</td>

			<td>나이</td>

			<td>지역</td>

			<td>메일수신</td>

			<td>sns수신</td>

			<td>메모</td>

			<td>추가항목?</td>

		</tr>

		<tr>
			<td colspan='11'>//여기부터는 db를 이용해서 for문을 이용 어레이list</td>
		</tr>

		<tr>
			<td colspan='11'><input type="button" value="회원삭제"><input
				type="button" value="회원수정"><input type="button"
				value="이메일전송"><input type="button" value="sns전송">
	</table>
</body>
</html>