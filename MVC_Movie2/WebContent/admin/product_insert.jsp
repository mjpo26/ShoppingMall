<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	
	<!-- 썸머노트 에디트를 이용하기 위한 링크 및 스크립트. -->
    <script src="../js/jquery-3.4.1.js"></script>
    <link href="../dist/summernote-lite.css" rel="stylesheet" type="text/css">
<script src="../dist/summernote-lite.js"></script>
<script src="../dist/lang/summernote-ko-KR.js"></script>
    
	<script type="text/javascript">    
	
        /* summernote에서 이미지 업로드시 실행할 함수 */
        function sendFile(file, editor) {
	            // 파일 전송을 위한 폼생성
		 		data = new FormData();
		 	    data.append("uploadFile", file);
		 	    $.ajax({ // ajax를 통해 파일 업로드 처리
		 	        data : data,
		 	        type : "POST",
		 	        url : "./summernote_imageUpload.jsp",
		 	        cache : false,
		 	        contentType : false,
		 	        processData : false,
		 	        async:false, //용훈햄꺼
		 	        success : function(data) { // 처리가 성공할 경우
	                    // 에디터에 이미지 출력
	                    alert(data.url);
		 	        console.log(data.url);
		 	        	$(editor).summernote('editor.insertImage', data.url);
		 	        }
		 	    });
		 	}
        <!-- 섬머노트 이미지 업로드시 아작스를 이용하여 업로드폴더에 저장후 summernote editor에 화면 출력됩니다. -->
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
                    placeholder: '내용을 입력하세요',
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor, welEditable) {
					    	for (var i = files.length - 1; i >= 0; i--) {
				            	sendFile(files[i], this);}
						}
					}
				});
			});
		
	</script>



<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: #000000 solid;
	border-width: 0px 0px 0px 0px
}

form {
	display: inline
}
</style>





	

</head>
<body>
	<div style="width: 800px">
		<h1 style="margin-bottom: 0;">관리자 메인 페이지</h1>
		<div style="height: 500px; width: 120px; float: left;">
			<nav>
				<ul>
					<li><a href="product_main.jsp">상품관리</a></li>
					<li><a href="#">주문관리</a></li>
					<li><a href="#">고객관리</a></li>
					<li><a href="#">게시판관리</a></li>
					<li><a href="#">통계분석</a></li>
				</ul>
			</nav>
		</div>
		<form action="../ItemInsert.sh" method="get">
			<div style="height: 500px; width: 400px; float: left;">
				<h3>오늘매출현황</h3>
				<table border="1" id="itemtable">
					<tr>
						<th colspan="3">상품명(필수)</th>
						<td colspan="5"><input type="text" name="title"></td>
					</tr>
					<tr>
						<th colspan="3">판매가(필수)</th>
						<td colspan="5"><input type="text" name="old_price"> 할인율 : <input type="text" name="sale_price">%</td>
						
					</tr>
					<tr>
						<th colspan="3">상품요약설명</th>
						<td colspan="12"><textarea rows="5" cols="130" name="content1"></textarea></td>
					</tr>
					<tr>
						<th colspan="12">상품상세설명</th></tr><tr>
				
  	<td colspan="12">	<textarea id="summernote" name="content2"></textarea></td>

					</tr>
					<tr>
<!-- 						<th colspan="2">첨부파일</th> -->
<!-- 						<td colspan="2"><input type="file" name="Item_bgpic"></td> -->
						<th colspan="2">이미지추가</th>
						<td colspan="2" ><input type="file"	name="pic1" ></td>
							<td colspan="2" ><input type="file"	name="pic2" ></td>
							<td colspan="2" ><input type="file"	name="pic3" ></td>
							<td colspan="2" ><input type="file"	name="pic4" ></td>

<!-- 						<script src="//code.jquery.com/jquery.min.js"></script> -->
<!-- 						<script> -->
<!-- // 							$('.addItemBtn')
// 									.click(
// 											function() {
// 												// 		$('#itemtable > #tbody:last').append('<td><input type="file"> </td>');
// 												$('#tbody:last')
// 														.append(
// 																'<tr><td><input type="file" class="addItemBtn"> </td></tr>');
// 											});
						</script> -->

					</tr>

				</table>

				<h3>진열상태</h3>
				<input type="radio" name="display" value="yes">진열함 <input
					type="radio" name="display" value="no">진열안함
				<h3>판매상태</h3>
				<input type="radio" name="sales" value="yes">판매함 <input
					type="radio" name="sales" value="no">판매안함
				<h3>매인진열</h3>
				<input type="radio" name="category" value="recommend"> 추천상품
				<input type="radio" name="category" value="new"> 신상품 
				<input type="radio" name="category" value="ca1">카테고리1 
				<input type="radio" name="category" value="ca2">카테고리2

				<div style="display: inline-block">
					<h3>상품분류</h3>
					<input type="text"> <input type="button" value="검색">
					<!-- 위에꺼(상품분류) 이부분은 잠깐보류 -->
				</div>
				<h3>판매정보</h3>
				원가 <input type="text" name="stock_price"> <br>
				<br> 배송비 입력 <input type="text" name="delivery_pee"
					value="50000"><br>
				<br> 상품전체중량 <input type="text" name="weight"> <br>
				<br> 재고수량 <input type="text" name="stock_count"> <br>
				<br> <input type="submit" value="등록하기"> <input
					type="reset" value="취소하기">
			</div>
		</form>
	</div>

</body>
</html>
