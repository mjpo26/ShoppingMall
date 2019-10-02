<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
<title>ERROR PAGE</title>
</head>
<body>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
        </c:if>
    <section class="review_board_content board_content">
		<div class="container">
			<div class="review_content col-lg-8 mx-auto mt-5 p-5">    
				<div class="container text-center">
			<img src="image/404.png" class="img-responsive" alt="" />
			<h1><b>OPPS!</b> 경로를 잘못 입력하였습니다</h1>
			<p>올바르지 않은 주소를 입력하였습니다 X__X</p>
			<h2><a href="./main.ma">Bring me back Our Main Page MO:V</a></h2>
				</div>
			</div>
		</div>
	</section>
  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>