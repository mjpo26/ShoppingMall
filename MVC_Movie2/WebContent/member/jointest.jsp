<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	$(function() {
		$("input[name='id']").on("change", function(){
			var s_id = $('#id').val();
			alert("s_id : "+s_id);
			
			// ajax 호출
			$.ajax({
				// Default datatype : JSON
				// 좌항-변수, 우항-입력된 데이터
				data : {
					s_id : s_id
				},
				// 요청 url
				url : "controller",
				// controller에서 성공적으로
				// return 받을 시 실행되는 메소드
				success : function(data) {
					if(s_id =="") {
						alert("s_id 아이디 입력 요망");
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
				error : function(error) {
					alert("error : " + error );
				}
			});
		});
	});
</script>








<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>