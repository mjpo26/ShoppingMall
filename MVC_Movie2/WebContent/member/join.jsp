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
MemberIdCheckService k= new MemberIdCheckService();
JSONObject json= k.Member_idcheck("admin");

%>

	$(function() {
		$("input[name='id']").on("change", function(){
			var s_id = $('#id').val();
			alert("fid : "+s_id);
			
			// ajax 호출
			$.ajax({
				
				// 요청 url
				
				url : "<%=request.getContextPath()%>/MemberIdCheck.me",
	            type: "post", //get 방식 , post 방식 구분
	           // data: "t1=ZZZ&t2=XXX", //data입력 (넘길 데이터)
				// Default datatype : JSON
				// 좌항-변수, 우항-입력된 데이터
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
				// 에러 시 실행되는 메소드
				//ajax값받아오는거 기억안나서 에러시 실행으로 대체 나중에 바꿔야지
				error : function(error) {
				//	alert("에러 : " + error );
					
				 if(<%=json.get("ch")%> ==1){
					 $("#text").css("color","red");
					$("#text").text("이미 사용중인 아이디 입니다.");
			}else if (<%=json.get("ch")%> =="0") {
				$("#text").css("color","blue");
				$("#text").text("사용가능한 아이디 입니다.");
			}
					
				}
			});
		});
	});
	
	
	
</script>




</head>
<body>

<form>
<%

//out.println("이거 나오나"+json.toJSONString());
out.println("ch 나오나"+json.get("ch"));
//out.println(request.getAttribute("json"));



%>
		<input type="text" id="id" name="id" style="float: left;">
		<h3 id="text">[]</h3><br>
		
	</form>




</body>
</html>