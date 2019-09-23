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
			url : "<%=request.getContextPath()%>/CategoryServlet.ca",
			//url : '/IdcheckServlet.ic',
	            type: "post", 
	           data : {
	        	   item_category1 : cate1
				},


				success : function(data) {
					alert(data);
					if(cate1 =="") {
						alert("cate1 입력 하세요");
						$("#text").css("color","gray");
						$("#text").text("아이디를 입력해주세요.");
					} else if (data == '0') {
						$("#text").css("color","blue");
						$("#text").text("사용가능한 아이디 입니다.");
						document.getElementById('isIdOk').value = "yes";
					} else if (data =="1") {
						$("#text").css("color","red");
						$("#text").text("이미 사용중인 아이디 입니다.");
					}
				},
			
				error : function(error) {
					alert("에러 : " + error );
				
					
				}
			});
		});
	});


</script>
<title>Insert title here</title>

</head>
<body>
	<h1>상품관리_상품분류관리</h1>
	<div>
		<b>1차 카테고리</b>
		<form method="post">
		<input type="text" id="item_category1" name="item_category1" size="12">
		<input type="button" value="검색">
		<input type="submit" value="수정" >
		<input type="submit" id ="insertCategory1" name ="insertCategory1" value="신규등록" ><br><br>
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
		<input type="submit" value="신규등록"><br><br>
	<textarea rows="10" cols="50">
	리스트
	</textarea>
	</form>
	</div>
</body>
</html>