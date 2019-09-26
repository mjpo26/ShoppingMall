<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("input[name='findCategory1']").on("click", function(){
		//$('.dup').click(function(){
			var cate1 = $('#item_category1').val();
		
			$.ajax({
		url : "<%=request.getContextPath()%>/CategoryListServlet.ca",
	//		url : 'CategoryListServlet.ca',
	           type: "post", 
	           data : {
	        	   item_category1 : cate1
				},

				
				

				success : function(data) {
// 					console.log("111111");
// 					console.log(data);
// 					alert(data);
					var cate1and2 = data.split("and");
					var result1 = cate1and2[0].split("/");
					var result2 = cate1and2[1].split("/");
					for ( var i = 0; i < result1.length-1; i++) {
					
					$("#cate1sel").append("<option value='"+result1[i]+"'>"+result1[i]+"</option>");
					
					}
					for ( var i = 0; i < result2.length-1; i++) {
						$("#cate2sel").append("<option value='"+result2[i]+"'>"+result2[i]+"</option>");
						}
				},
				
				error : function(error) {
					console.log("111111");
					console.log(data);
					alert("실패");
				}
			});
		});
	});

function chkCate1Sel(cate1sel) {
 document.myForm.category1_text.value = cate1sel.value;
}
function chkCate2Sel(cate2sel) {
	 document.myForm2.category2_text.value = cate2sel.value;
}
	
	
</script>
<title>Insert title here</title>

</head>
<body>
<table></table>
	<h1>상품관리_상품분류관리</h1>
	<div>
		<b>1차 카테고리</b>
		<form name ="myForm" method="post">
		<input type="text" id="category1_text" name="category1_text" size="12">
		<input type="button" id ="findCategory1" name ="findCategory1" value="검색">
		<br>
		<select id="cate1sel" onchange="chkCate1Sel(this)" name = "cate1sel">
  		<option value ="">1차 카테고리</option>
		</select>

	</form>
	</div>
	<br><br>
		<div>
		<b>2차 카테고리</b>
		<form name ="myForm2" method="post">
		<input type="text" id="category2_text" name="category2_text" size="12">
		<br>
	<select id="cate2sel" onchange="chkCate2Sel(this)" name = "cate2sel">
  		<option value ="">2차 카테고리</option>
		</select>
	</form>
	</div>
</body>
</html>