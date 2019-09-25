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
// 					console.log("111111");
// 					console.log(data);
// 					alert(data);
					var result1 = data.split("/");
					for ( var i = 0; i < result1.length-1; i++) {
					//$("#cate1sel").append('<option value='+i+'>'+result1['+i+'].innerHTML+'</option>');
					$("#cate1sel").append("<option value='"+result1[i]+"'>"+result1[i]+"</option>");

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

// 	$( document ).ready( function() {
//         var jb = $( 'li' ).get();
//         for ( var i = 0; i < jb.length; i++) {
//           $( 'div' ).append( '<p>' + jb[i].innerHTML + '</p>' );
//         }
//       } );

	
	
	
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
<select id="cate1sel" name = "cate1sel">
  		<option value ="">1차 카테고리</option>

</select>

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