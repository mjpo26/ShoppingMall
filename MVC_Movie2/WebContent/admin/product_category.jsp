<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("input[name='insertCategory1']").on("click", function(){
		//$('.dup').click(function(){
			var cate1 = $('#item_category1').val();
			alert("cate1 : "+cate1);
		
			$.ajax({
		url : "<%=request.getContextPath()%>/CategoryListServlet.ca",
	//		url : 'CategoryListServlet.ca',
	           type: "post", 
	           data : {
	        	   item_category1 : cate1
				},


				success : function(data) {
					console.log("111111");
					console.log(data);
					alert("성공");
					alert(data);
				},
				
				error : function(error) {
					console.log("111111");
					console.log(data);
					alert("실패");
				}
			});
		});
	});


</script>
<title>Insert title here</title>

</head>
<body>
<table></table>
	<h1>상품관리_상품분류관리</h1>
	<div>
		<b>1차 카테고리</b>
		<form method="post">
		<input type="text" id="item_category1" name="item_category1" size="12">
		<input type="button" value="검색">
		<input type="button" value="수정" >
		<input type="button" id ="insertCategory1" name ="insertCategory1" value="신규등록" ><br><br>
	<textarea rows="10" cols="50">
	리스트
	</textarea>
	</form>
	</div>
	<br><br>
		<div>
		<b>2차 카테고리</b>
		<form method="post">
		<input type="text" size="12">
		<input type="button" value="검색">
		<input type="button" value="수정">
		<input type="button" value="신규등록"><br><br>
	<textarea rows="10" cols="50">
	리스트
	</textarea>
	</form>
	</div>
</body>
</html>