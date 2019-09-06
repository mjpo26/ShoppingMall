<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String sId = (String)session.getAttribute("sId");
%>
<%if(sId != null) {
	if(!sId.equals("admin")){
	%><script>
	alert("관리자 아님꼬죵");
	history.back();
	</script>
	<%} else{ %>
			<a href="MemberInfo.me"><%=sId %>님</a> | <a href="MemberLogoutPro.me">로그아웃</a> 
		<%}} else { %>	
			<a href="MemberLoginForm.me">로그인</a> 
		<%} %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상품등록 Main</h1>

<ul>
<li><a href="product_insert.jsp">상품등록</a></li>
<li><a href="product_list.jsp">상품목록</a></li>
<li><a href="product_category.jsp">상품분류관리</a></li>
<li><input type="button" value="Test목록" onclick="location.href='../product_list.sh'"></li>
</ul>
</body>
</html>