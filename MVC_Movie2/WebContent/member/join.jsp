<%@page import="svc.MemberIdCheckService"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
<%
//MemberIdCheckService k= new MemberIdCheckService();
//JSONObject json= k.Member_idcheck("admin");

%>

	$(function() {
		$("input[name='id']").on("click", function(){
			var s_id = $('#id').val();
			alert("fid : "+s_id);
		
			$.ajax({
			url : "<%=request.getContextPath()%>/IdcheckServlet.ic",
			//url : '/IdcheckServlet.ic',
	            type: "post", 
	           data : {
					fid : s_id
				},


				success : function(data) {
					alert(data);
					if(s_id =="") {
						alert("s_id 아이디 입력 하세요");
						$("#text").css("color","gray");
						$("#text").text("아이디를 입력해주세요.");
					} else if (data == '0') {
						$("#text").css("color","blue");
						$("#text").text("사용가능한 아이디 입니다.");
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




</head>
<body>

<form>

		<input type="text" id="id" name="id" style="float: left;">
		<h3 id="text">[]</h3><br>
		
	</form>




</body>
</html>