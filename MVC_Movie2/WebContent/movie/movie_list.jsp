<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//저장된 세션 아이디 가져오기
	String sId = (String)session.getAttribute("sId");

	// 영화 목록 정보 가져오기
	ArrayList<MovieBean> movieList = (ArrayList<MovieBean>)request.getAttribute("movieList");

	// 최근 조회 영화 목록 ArrayList 객체 가져오기
	ArrayList<String> todayMovieList = (ArrayList<String>)request.getAttribute("todayMovieList");
	ArrayList<String> todayMovieIndexList = (ArrayList<String>)request.getAttribute("todayMovieIndexList");

	// 목록 종류, 정렬 방식 가져오기
	String listType = (String)request.getAttribute("listType");
	String sort = (String)request.getAttribute("sort");
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
		width: 1024px;
		border: 1px solid darkgray;
	}
	
	div {
		width: 1100px;
	}
	
	#link {
		border: none;
	}

	#tr_top {
		background: orange;
		width: 800px; 
		text-align: center;
		font-weight: bold;
	}
	
	#td_center {
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<!-- 세션 아이디가 있을 경우 로그아웃 링크(Logout.me) 표시, 없을 경우 로그인 링크(LoginForm.me) 표시 -->
		<p align="right">
		<%if(sId != null) { %>
			<a href="MemberInfo.me"><%=sId %>님</a> | <a href="MemberLogoutPro.me">로그아웃</a> 
		<%} else { %>	
			<a href="MemberLoginForm.me">로그인</a> 
		<%} %>
		</p>
	</header>
	<h1>전체 영화 목록</h1>
	<%if(movieList == null) {%>
		<h1>영화 목록이 존재하지 않습니다.</h1>
	<%} else {%>
	<table id="link">
		<tr>
			<td align="left">
				<!-- 영화 목록 종류만 직접 지정하고, 정렬 방식은 기존 방식 유지 -->
				<a href="MovieList.mo?listType=now&sort=<%=sort%>">상영중</a>&nbsp;&nbsp;
				<a href="MovieList.mo?listType=soon&sort=<%=sort%>">개봉예정</a>
			</td>
			<td align="right">
				<!-- 정렬 방식만 직접 지정하고, 영화 목록 종류는 기존 종류 유지 -->
				<a href="MovieList.mo?listType=<%=listType %>&sort=title">제목순</a>&nbsp;&nbsp;
				<a href="MovieList.mo?listType=<%=listType %>&sort=date">최신순</a>
			</td>
		<tr>
	</table>
	<table>
		<tr id="tr_top"><td>영화명</td><td>영화내용</td><td>상영시간</td><td>상영관</td><td>개봉일</td><td>종료일</td></tr>
		<%for(MovieBean movieBean : movieList) {%>
		<tr>
			<td><a href="MovieInfoDetail.mo?movie_idx=<%=movieBean.getMovie_idx()%>"><%=movieBean.getMovie_title() %></a></td>
			<td><%=movieBean.getMovie_content() %></td>
			<td id="td_center"><%=movieBean.getMovie_time() %>분</td>
			<td id="td_center"><%=movieBean.getMovie_hall_num() %>관</td>
			<td id="td_center"><%=new SimpleDateFormat("yyyy-MM-dd").format(movieBean.getMovie_start_day()) %></td>
			<td id="td_center"><%=new SimpleDateFormat("yyyy-MM-dd").format(movieBean.getMovie_end_day()) %></td>
		</tr>
		<%} %>
	<%} %>
	</table>
	<p>
	<table>
		<tr>
			<th>오늘 조회한 영화 목록</th>
		</tr>
	<%for(int i = 0; i < todayMovieList.size(); i++) { %>
		<tr>
			<!-- 영화 제목 쿠키의 ArrayList 위치에 해당하는 영화 번호 쿠키의 ArrayList 요소값을 링크로 사용 -->
			<td><a href="MovieInfoDetail.mo?movie_idx=<%=todayMovieIndexList.get(i)%>">
				<%=URLDecoder.decode(todayMovieList.get(i), "UTF-8") %></a></td>
		</tr>
	<%} %>
	</table>
</body>
</html>



















