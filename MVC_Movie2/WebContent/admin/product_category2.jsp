<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

//String page ="1";
//String limit ="10";

%>
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$( document ).ready(function() { 
	$.ajax({
        type:"POST",
        url : "<%=request.getContextPath()%>/ReviewAjax.ra",
        //Servlet과 mapping할 URL
        dataType : "json",
        data: {"page" : "1", "limit":"5"},
       
        
        success: function(data){
            console.log(data);   //통신에 성공하면 콘솔에 출력한다. 
//          $('#category1_text').val(data[0].review_writer);
//          $('#category2_text').val(data[0].review_subject);
//          $('#category2_text').val(data[0].review_content);
            
            $("#cate1sel").append("<option value='"+result1[i]+"'>"+result1[i]+"</option>");
			
				}
		for ( var i = 0; i < result2.length-1; i++) {
			$("#cate2sel").append("<option value='"+result2[i]+"'>"+result2[i]+"</option>");
			}
			


        
        },
        error: function(xhr, status, error) {
            alert(error);
      		  }  
        
        
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
		<form name ="myForm" method="post">
		
		<input type="text" id="category1_text" name="category1_text" value=" "size="12">
		<input type="text" id="category2_text" name="category2_text" size="12">
		<input type="text" id="category3_text" name="category3_text" size="12">
		

		<table name ="ajaxTable">
		<tr>1번</tr>
		<tr>2번</tr>
		<tr>3번</tr>
		<tr>4번</tr>
		
		
		</table>
		
		
		
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