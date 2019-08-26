<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		//이 부분에 선택한 내용이 다 같은지 비교하는 소스넣기 (아이디 비교?)
		alert("아이디를 입력하세요.");
		return;
	}
</script>
</head>
<body>
	<form action="" method="post" name="fr" onsubmit="return check()">
		<div style="width: 520px">
			<h1 style="margin-bottom: 0;">관리자 메인 페이지</h1>
			<div style="height: 200px; width: 120px; float: left;">
				<nav>
					<ul>
						<li><a href="#">상품 관리</a></li>
						<li><a href="#">주문관리</a></li>
						<li><a href="#">고객관리</a></li>
						<li><a href="#">게시판관리</a></li>
						<li><a href="#">통계분석</a></li>
					</ul>
				</nav>
			</div>
			<div style="height: 200px; width: 400px; float: left;">
				<h3>상품목록</h3>
				<table border="1">
					<tr>
						<td>검색분류</td>
						<td colspan="3"><select name="search">
								<option value="상품명">상품명
								<option value="모델명">모델명
						</select></td>
					</tr>
					<tr>
						<td>상품분류</td>
						<td colspan="3"><select name="Category">
								<option value="카테고리">카테고리
								<option value="침대류">침대류
						</select> <select name="detailCategory">
								<option value="상세카테고리">상세카테고리
								<option value="나무">나무
						</select></td>
					</tr>
					<tr>
						<td>상품등록일</td>
						<td colspan="3"><select name="date">
								<option value="xxxx.xx.xx">오늘
								<option value="3일전">3일전계산해서넣기..
									<!--날짜옵션넣기-->
						</select> <input type="date" value="2019-08-23"> <!--달력픽커넣기-->
					</tr>
					<tr>
						<td>진열상태</td>
						<td><input type="radio" value="all">전체<input
							type="radio" value="yes">진열함 <input type="radio"
							value="no">진열안함</td>
						<td>판매상태</td>
						<td><input type="radio" value="all">전체<input
							type="radio" value="yes">판매함 <input type="radio"
							value="no">판매안함</td>
					</tr>
				</table>
				<input type="submit" value="검색하기"> <input type="reset"
					value="초기화">
				<%-- 	<%if(checked==true) {%> //검색된조건이 만족하면 표 보여주기--%>
				<table border="1">
					<tr>
						<td colspan='8' align="right"><select><option>등록일
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
						<th>No.</th>
						<th>상품명</th>
						<th>판매가</th>
						<th>진열상태</th>
						<th>판매상태</th>
						<th>재고량</th>
						<th>상품분류</th>
						<th>등록일</th>
					</tr>
					<%-- 		<%	for (int i = 0; i < n; i++) {%> //n개수만큼 가져오도록 변수주기--%>
					<tr>
						<td><input type="checkbox"></td>
						<td>상품명</td>
						<td>판매가</td>
						<td>진열상태</td>
						<td>판매상태</td>
						<td>재고량</td>
						<td>상품분류</td>
						<td>등록일</td>
					</tr>
					<%-- 		<%	}%> --%>
				</table>
				선택상품들 <input type="button" value="삭제"> <input type="button"
					value="수정"> <input type="button" value="진열변경"> <input
					type="button" value="판매변경">
				<%-- 	<%} %> --%>
			</div>
		</div>
	</form>
</body>

</html>
