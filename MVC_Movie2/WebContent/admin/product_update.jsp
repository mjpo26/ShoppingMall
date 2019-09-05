<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ItemBean itemBean = (ItemBean)request.getAttribute("article");
String nowPage = (String)request.getAttribute("page");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
코드값 불러와지는지 확인 : <%=itemBean.getItem_code() %><br>
<style type="text/css">
table {
	border: #000000 solid;
	border-width: 0px 0px 0px 0px
}

form {
	display: inline
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js">
	
</script>



</head>
<body>
	<div style="width: 800px">
		<h1 style="margin-bottom: 0;">관리자 메인 페이지</h1>
		<div style="height: 500px; width: 120px; float: left;">
			<nav>
				<ul>	
					<li><a href="product_main.jsp">상품관리</a></li>
					<li><a href="#">주문관리</a></li>
					<li><a href="#">고객관리</a></li>
					<li><a href="#">게시판관리</a></li>
					<li><a href="#">통계분석</a></li>
				</ul>
			</nav>
		</div>
		<form action="./updatePro.sh" method="get">
		<input type="hidden" name="item_code" value=<%=itemBean.getItem_code() %>>
			<div style="height: 500px; width: 400px; float: left;">
				<h3>오늘매출현황</h3>
				<table border="1" id="itemtable">
					<tr>
						<th colspan="3">상품명(필수)</th>
						<td colspan="5"><input type="text" name="title" value=<%=itemBean.getItem_title() %>></td>
					</tr>
					<tr>
						<th colspan="3">판매가(필수)</th>
						<td colspan="5"><input type="text" name="old_price" value=<%=itemBean.getItem_old_price() %>></td>
					</tr>
					<tr>
						<th colspan="3">상품요약설명</th>
						<td colspan="12"><textarea rows="5" cols="30" name="content1"><%=itemBean.getItem_content1() %></textarea></td>
					</tr>
					<tr>
						<th colspan="12">상품상세설명</th></tr><tr>
						<td colspan="12"><textarea id="summernote" name="content2"><%=itemBean.getItem_content2() %></textarea></td>
						<script>
							$('#summernote').summernote({
								placeholder : '상세내용 작성하는곳',
								tabsize : 2,
								width : 1000,
								height : 300
							});
						</script>



<select>

<opstion>   </opstion>
<opstion>best50</opstion>
<opstion>옐로우 </opstion>
</select>
					</tr>
					<tr>
						<th colspan="2">첨부파일</th>
						<td colspan="2"><input type="file" name="Item_bgpic" value=<%=itemBean.getItem_bgpic() %>></td>
						<th colspan="2">추가이미지</th>
						<td colspan="2" id="tbody"><input type="file"
							name="Item_pic1" class="addItemBtn" value=<%=itemBean.getItem_pic1() %>></td>

						<script src="//code.jquery.com/jquery.min.js"></script>
						<script>
							$('.addItemBtn')
									.click(
											function() {
												// 		$('#itemtable > #tbody:last').append('<td><input type="file"> </td>');
												$('#tbody:last')
														.append(
																'<tr><td><input type="file" class="addItemBtn"> </td></tr>');
											});
						</script>

					</tr>

				</table>

	
				<h3>진열상태</h3>
				<input type="radio" name="display" value="yes"
				<%if(itemBean.getItem_display()!=null){if(itemBean.getItem_display().equals("yes")){%>checked="checked" <%}} %>>진열함 
				<input type="radio" name="display" value="no"
				<%if(itemBean.getItem_display()!=null){if(itemBean.getItem_display().equals("no")){%>checked="checked" <%}} %>>진열안함
				<h3>판매상태</h3>
				<input type="radio" name="sales" value="yes" 
				<%if(itemBean.getItem_sales()!=null){if(itemBean.getItem_sales().equals("yes")){%>checked="checked"<%}} %>>판매함 
				<input type="radio" name="sales" value="no" 
				<%if(itemBean.getItem_sales()!=null){if(itemBean.getItem_sales().equals("no")){%>checked="checked"<%}}%>>판매안함
				<h3>매인진열</h3>
				<input type="radio" name="category" value="recommend" 
				<%if(itemBean.getItem_category1()!=null){if(itemBean.getItem_category1().equals("recommend")){%>checked="checked"<%}} %>> 추천상품
				<input type="radio" name="category" value="new" 
				<%if(itemBean.getItem_category1()!=null){if(itemBean.getItem_category1().equals("new")){%>checked="checked"<%}} %>> 신상품 
				<input type="radio" name="category" value="ca1" 
				<%if(itemBean.getItem_category1()!=null){if(itemBean.getItem_category1().equals("ca1")){%>checked="checked"<%} }%>>카테고리1 
				<input type="radio" name="category" value="ca2" 
				<%if(itemBean.getItem_category1()!=null){if(itemBean.getItem_category1().equals("ca2")){%>checked="checked"<%}} %>>카테고리2

				<div style="display: inline-block">
					<h3>상품분류</h3>
					<input type="text"> <input type="button" value="검색">
					<!-- 위에꺼(상품분류) 이부분은 잠깐보류 -->
				</div>
				<h3>판매정보</h3>
				공급가 <input type="text" name="stock_price" value=<%=itemBean.getItem_stock_price() %>> <br>
				<br> 소비자가 <input type="text" value=<%=itemBean.getItem_old_price() %>> <br>
				<br> 배송비 입력 <input type="text" name="delivery_pee"
					value="50000"><br>
				<br> 상품전체중량 <input type="text" name="weight" value=<%=itemBean.getItem_weight() %>> <br>
				<br> 재고수량 <input type="text" name="stock_count" value=<%=itemBean.getItem_stock_count() %>> <br>
				<br> <input type="submit" value="수정하기"> <input
					type="reset" value="취소하기">
			</div>
		</form>
	</div>

</body>
</html>
