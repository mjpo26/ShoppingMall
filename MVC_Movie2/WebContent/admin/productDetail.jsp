<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
	// 	String sId = (String)session.getAttribute("sId");
	// 	if(sId == null) {
	// 	    out.println("<script>");
	// 	    out.println("alert('잘못된 접근입니다!')");
	// 	    out.println("location.href='index.jsp'");
	// 	    out.println("</script>");
	// 	}
	ItemBean itemBean = (ItemBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
</head>
<body>

	<h1>제품 상세페이지</h1>


	<div style="width: 500; float: left;">
		<div>
			<nav>
				<img src="./image/<%=itemBean.getItem_bgpic() %>" width="350px" height="450px">
			</nav>
		</div>
	</div>
	<br>
	<br>
	<div style="width: 800; float: left;">
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;아이콘 / 아이콘 / 아이콘 / 아이콘 <br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>상품 : <%=itemBean.getItem_title() %></b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>가격 : <%=itemBean.getItem_old_price() %>원</b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>할인가격 : <%=itemBean.getItem_new_price() %>원</b><br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>
		상세내용 요약</b><br>
		&emsp;&emsp;&emsp;<%=itemBean.getItem_content1() %><br>
		
		<br> <br>
		
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>Color</b> <select>
			<%if(itemBean.getItem_option_color1()!=null){
				if (itemBean.getItem_option_color1().equals("블랙")) {
			%>
			<option>Black</option>
			<%
				}}
			%>
			<%
			if(itemBean.getItem_option_color2()!=null){
			if (itemBean.getItem_option_color2().equals("화이트")) {
			%>
			<option>White</option>
			<%
				}}
			%>
			<%if(itemBean.getItem_option_color3()!=null){
			if (itemBean.getItem_option_color3().equals("레드")) {
			%>
			<option>Red</option>
			<%
				}}
			%>
			
			<%
			if(itemBean.getItem_option_color4()!=null){
			if (itemBean.getItem_option_color4().equals("옐로우")) {
			%>
			<option>Yellow</option>
			<%
				}}
			%></select>
			 <br>
		<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="Button"
			value="장바구니 담기" size="30"><br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="Button" value="즉시구매"><input
			type="Button" value="찜하기">
	</div>
	<br>

	<div style="clear: both;">
	<h3>제품설명</h3><br>
		<%=itemBean.getItem_content2() %><br><br><br>
		<h3>*일괄구매 또는 코디세트</h3>
		<table>
			<tr>
				<td><img alt="" src="./image/<%=itemBean.getItem_bgpic() %>" width="150px"
					height="150px"></td>
				<td><img alt="" src="./image/doodle.png" width="150px"
					height="150px"></td>
				<td><img alt="" src="./image/doodle.png" width="150px"
					height="150px"></td>
				<td><img alt="" src="./image/doodle.png" width="150px"
					height="150px"></td>
			</tr>
		</table>
	</div>


	<h3>상품 이름</h3>
	<!-- 정렬 기준 -->
	<select>
		<option>설명</option>
		<option>가격</option>
		<option>옵션</option>
	</select>

	<input type="submit" value="장바구니">
	<input type="submit" value="찜하기">
	<br>

</body>
</html>