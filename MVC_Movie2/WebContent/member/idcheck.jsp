<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ok() {
		//join.jsp페이지 id.value= idcheck.jsp페이지 fid.value
		// window 내장객체  멤버변수 opener == join.jsp  창을 open() 한 페이지 
		opener.document.fr.id.value = document.wfr.fid.value;
		opener.document.fr.idDuplication.value = "idCheck";
		//창닫기
		window.close();
	}
</script>
</head>
<body>
	<%
		// member/idcheck.jsp
		// String id = fid 파라미터 가져와서 변수에 저장
		MemberDAO memberDAO = (MemberDAO)request.getAttribute("memberDAO");
		String id = request.getParameter("fid");
		int check=memberDAO.idcheck(id);
		
		// MembedrDAO mdao 객체생성
	%>
	<form action="MemberIdCheck.me" name="joinForm" method="get">
		아이디:<input type="text" name="fid" value="<%=id%>"> <input
			type="submit" value="아이디중복확인" class="dup">
	</form>
	<%
		if (check == 1) {
			out.println("이미 사용중인 아이디 입니다.");
		} else {
			out.println("사용가능한 아이디 입니다.");
	%>
	<input type="button" value="사용" onclick="ok()">
	<%
		}
	%>
</body>
</html>

