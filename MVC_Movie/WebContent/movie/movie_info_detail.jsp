<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MovieBean movieBean = (MovieBean)request.getAttribute("movieBean");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 600px;
		border: 1px solid darkgray;
	}
	
	#movie_image {
 		margin: auto;
		width: 300px;
		height: 300px;		
		border: none;
	}
	
	#movie_content {
		margin: auto;
		width: 300px;
		height: 200px;		
		border: 1px solid darkgray;
	}
	
	#button {
		text-align: center;
	}
</style>
</head>
<body>
	<h1>영화 상세 정보</h1>
	<table>
		<tr>
			<td rowspan="6"><img src="./image/doodle.png" id="movie_image"></td>
			<td>영화명 : </td><td><%=movieBean.getMovie_title() %></td>
		</tr>
		<tr>
			<td>상영시간 : </td><td><%=movieBean.getMovie_time() %>분</td>
		</tr>
		<tr>
			<td>개봉일 : </td><td><%=new SimpleDateFormat("yyyy-MM-dd").format(movieBean.getMovie_start_day()) %></td>
		</tr>
		<tr>
			<td><input type="button" id="button" value="예매하기" 
					onclick="location.href='MovieReservation.mo?movie_idx=<%=movieBean.getMovie_idx()%>'"></td>
		</tr>
		<tr>
			<td colspan="2">
				----영화 상세 줄거리----
			</td>
		</tr>
		<tr>
			<td colspan="2" id="movie_content" valign="top">
				<%=movieBean.getMovie_content() %>
			</td>
		</tr>
		<tr>
			<td colspan="3" id="button">
				<input type="button" value="돌아가기" onclick="history.back()">
			</td>
		</tr>
	</table>
	
</body>
</html>



















