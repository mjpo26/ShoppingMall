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
			
			// ajax ȣ��
			$.ajax({
				
				// ��û url
				
				url : "<%=request.getContextPath()%>/MemberIdCheck.me",
	            type: "post", //get ��� , post ��� ����
	           // data: "t1=ZZZ&t2=XXX", //data�Է� (�ѱ� ������)
				// Default datatype : JSON
				// ����-����, ����-�Էµ� ������
	           data : {
					fid : s_id
				},


				success : function(data) {
					alert(data);
					if(s_id =="") {
						alert("s_id ���̵� �Է� �ϼ���");
						$("#text").css("color","gray");
						$("#text").text("���̵� �Է����ּ���.");
					} else if (data == '0') {
						$("#text").css("color","blue");
						$("#text").text("��밡���� ���̵� �Դϴ�.");
					} else if (data =="1") {
						$("#text").css("color","red");
						$("#text").text("�̹� ������� ���̵� �Դϴ�.");
					}
				},
				// ���� �� ����Ǵ� �޼ҵ�
				//ajax���޾ƿ��°� ���ȳ��� ������ �������� ��ü ���߿� �ٲ����
				error : function(error) {
				//	alert("���� : " + error );
					
				 if(<%=json.get("ch")%> ==1){
					 $("#text").css("color","red");
					$("#text").text("�̹� ������� ���̵� �Դϴ�.");
			}else if (<%=json.get("ch")%> =="0") {
				$("#text").css("color","blue");
				$("#text").text("��밡���� ���̵� �Դϴ�.");
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

//out.println("�̰� ������"+json.toJSONString());
out.println("ch ������"+json.get("ch"));
//out.println(request.getAttribute("json"));



%>
		<input type="text" id="id" name="id" style="float: left;">
		<h3 id="text">[]</h3><br>
		
	</form>




</body>
</html>