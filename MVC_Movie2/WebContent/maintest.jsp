<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]--> 

 <script src="../script/jquery-3.4.1.js"></script>
 <script type="text/javascript">
 	$(document).ready(function() {
 		$('#noti').click(function(){
			$.getJSON('main_notice.jsp',function(data){
				$.each(data,function(index,item){
					$('table').append("<tr><td class='contxt'><a href='../center/content.jsp?num="+item.num+"&pageNum=1'>"+item.subject+"</td><td>"+item.date+"</td></tr>");
				});
			});
 		});
	});
 </script> 
 	
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<%-- <jsp:include page="../inc/top.jsp" /> --%>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>
<div id="news_notice">
<!-- <h3 class="brown">News &amp; Notice</h3> -->
<h3 class="brown"><a href="#" id="noti">News &amp; Notice</a>
  &amp; Driver Download</h3>
<table>
</table>
<!-- <table> -->
<%
// // BoardDAO bdao 객체생성
// BoardDAO bdao=new BoardDAO();
// // int count=getBoardCount() 메서드호출 
// int count=bdao.getBoardCount();
// int pageSize=5;
// int startRow=1;
// SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
// List<BoardBean> boardList =null;
// // 게시판 글있으면
// //boardList = getBoardList(시작행,가져올 글개수)
// if(count!=0){
// 	boardList=bdao.getBoardList(startRow, pageSize);
// 	for(int i=0;i<boardList.size();i++){
// 		BoardBean bb=boardList.get(i);
		%>
<%-- 	<tr><td class="contxt"><a href="../center/content.jsp?num=<%//=bb.getNum()%>&pageNum=1"><%//=bb.getSubject() %></a></td> --%>
<%--     <td><%//=sdf.format(bb.getDate()) %></td></tr>	 --%>
		<%
// 	}
// }
%>
<!-- </table> -->
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>