<%@page import="java.io.PrintWriter"%>
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
            
           alert("성공");


        
        },
        error: function(xhr, status, error) {
        	alert("실패");
        
        
        }  
        
        
	});  
        
});









	
</script>
<title>Insert title here</title>

</head>
<body>

 
	
</body>
</html>