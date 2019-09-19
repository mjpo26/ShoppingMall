<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>bootstrap4</title>
<!-- 달력피커 -->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link	href="./dist/summernote-bs4.css"	rel="stylesheet">
<script	src="./dist/summernote-bs4.js"></script>
<script src="./dist/lang/summernote-ko-KR.js"></script>

</head>
<body>
<!-- 	<div id="summernote"></div> -->
	<textarea id="summernote" rows="" cols=""></textarea>
	<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력하세요1',
        tabsize: 2,
        height: 100
      });
      
      
    $(document).ready(function() {
  $('#summernote').summernote({
    lang: 'ko-KR' // default: 'en-US'
  });
});
      
      
      
   
</script>


	<form action="NewFilePro.jsp" method="get" onsubmit ="return check_submit()">
 		 
 		
		


<input type="submit" value="Submit" />
	
	
	
	</form>
	<script>

    $('#summernote').summernote({
  	  height: 300,                 // set editor height
  	  minHeight: null,             // set minimum height of editor
  	  maxHeight: null,             // set maximum height of editor
  	  focus: true                  // set focus to editable area after initializing summernote
  	});
 </script>
    
  </body>
</html>