<%@page import="vo.PageInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
 	ArrayList<ItemBean> articleList = (ArrayList<ItemBean>) request.getAttribute("articleList");

%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>
<script type="text/javascript">
function pickNullCheck(){
	if(document.fr1.pickStart.value==""){
//		document.fr1.pickStart.value=="2015-01-01";
		var pickStart = $('#pickStart').val('01/01/2010');

		return false;
	}
	if(document.fr1.pickEnd.value==""){
 	//	document.fr1.pickEnd.value=="2020-01-01";
		var pickEnd =  $('#pickEnd').val('01/01/2020');
	
		return false;
	}
	
	//
	
	
}
</script>

</head>
<body>
	
		<div style="width: 520px">
			<h1 style="margin-bottom: 0;">관리자 메인 페이지</h1>

			<div style="height: 200px; width: 1050px; float: left;">
	<form action ="./productList.sh"  name ="fr1" method="get" onsubmit="return pickNullCheck()">
				<h3>상품목록</h3>
				<table border="1">
					<tr>
						<td>검색분류</td>
						<td colspan="3">
						<select >
								<option value="상품명">상품명
								<option value="모델명">모델명
						</select><input type="text" name="title"></td>
					</tr>
					<tr>
						<td>상품분류</td>
						<td colspan="3"><select name="category">
								<option value="">카테고리</option>
								<option value="best">best</option>
								<option value="new">new</option>
								<option value="recommend">recommend</option>
						
						</select></td>
					</tr>
							<tr>
			<th>기간검색</th>
			<td colspan="4">시작날짜:<input type="text" name="pickStart" id="pickStart">
				끝 날짜:<input type="text" name="pickEnd" id="pickEnd"></td>
			</tr>
					<tr>
						<td>진열상태</td>
					
						<td colspan="2">
						<select name="display">
						<option value="">전체</option>
						<option value="yes">진열함</option>
						<option value="no">진열안함</option>
						</select></td>
						<td colspan="1">판매상태</td>
						<td colspan="2">
						<select name="sales">
						<option value="">전체</option>
						<option value="yes">진열함</option>
						<option value="no">진열안함</option>
						</select>
						</td>
					</tr>
				</table>
				<input type="submit" value="검색하기"> 
				<input type="reset"  value="초기화">
				</form>
				<br>
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
						<th>할인가</th>
						<th>진열상태</th>
						<th>판매상태</th>
						<th>재고량</th>
						<th>상품분류</th>
						<th>등록일</th>
						<th colspan="2">수정</th>
					</tr>
				<%
				for (int i = 0; i < articleList.size(); i++) {
			%>
			
				
				<form method="get">
			<tr>
<%-- 				<input type="hidden" name="Item_code" value=<%=articleList.get(i).getItem_code() %>> --%>
				<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
				<th><input type="checkbox" name="cb"></th> <!-- 체크박스 -->
				<td><%=articleList.get(i).getItem_title()%></td> <!-- 상품명-->
				<td><%=articleList.get(i).getItem_old_price()%></td> <!-- 판매가-->
				<td><%=articleList.get(i).getItem_old_price()-articleList.get(i).getItem_sel_price()%></td><!-- 할인가-->
				<td><select name="display"><!-- 진열상태 -->
				<option <%if(articleList.get(i).getItem_display().equals("no")){%>selected<%}%>>no</option>
				<option <%if(articleList.get(i).getItem_display().equals("yes")){%>selected<%}%>>yes</option>
				</td>
				<td><select name="sales"> <!-- 판매상태 -->
				<option <%if(articleList.get(i).getItem_sales().equals("no")){%>selected<%}%>>no</option>
				<option <%if(articleList.get(i).getItem_sales().equals("yes")){%>selected<%}%>>yes</option>
				</td>
				<td><%=articleList.get(i).getItem_stock_count()%></td><!-- 재고 -->
				<td><%=articleList.get(i).getItem_category1()%></td><!-- 카테고리 -->
				<td><%=articleList.get(i).getItem_Date()%></td><!-- 등록날짜 -->
						<input type="hidden" name="Item_code" value=<%=articleList.get(i).getItem_code()%>>
				<td><input type="submit" value="수정" formaction="./productUptdate.sh"></td>
				<td><input type="button" value="상세수정" class="genric-btn primary-border small"
						onclick="location.href='./update.sh?Item_code=<%=articleList.get(i).getItem_code()%>'"></td>
	</form>
						
			</tr>
			<%
				}
			%>
		</table>
				선택상품들 <input type="button" value="삭제"> <input type="button" value="수정"> 
				<%-- 	<%} %> --%>
			</div>
		</div>
</body>

</html>
