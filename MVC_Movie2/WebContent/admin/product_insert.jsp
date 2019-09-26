<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="../main/adminTop.jsp"></jsp:include>  


                        <h3>상품 등록</h3>
                    </div>                    
                </div>
            </header>
            
	<!-- 썸머노트 에디트를 이용하기 위한 링크 및 스크립트. -->
    <script src="./js/jquery-3.4.1.js"></script>
    <link href="./dist/summernote-lite.css" rel="stylesheet" type="text/css">
    <script src="./dist/summernote-lite.js"></script>
    <script src="./dist/lang/summernote-ko-KR.js"></script>    
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
//         섬머노트 이미지 업로드시 아작스를 이용하여 업로드폴더에 저장후 summernote editor에 화면 출력됩니다.

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
<script type="text/javascript">
	$(function() {
	$("input[name='findCategory1']").on("click", function(){
		//$('.dup').click(function(){
			var cate1 = $('#item_category1').val();
		
			$.ajax({
		url : "<%=request.getContextPath()%>/CategoryListServlet.ca",
	//		url : 'CategoryListServlet.ca',
	           type: "post", 
	           data : {
	        	   item_category1 : cate1
				},


				success : function(data) {
// 					console.log("111111");
// 					console.log(data);
// 					alert(data);
					var cate1and2 = data.split("and");
					var result1 = cate1and2[0].split("/");
					var result2 = cate1and2[1].split("/");
					for ( var i = 0; i < result1.length-1; i++) {
					
					$("#cate1sel").append("<option value='"+result1[i]+"'>"+result1[i]+"</option>");
					
					}
					for ( var i = 0; i < result2.length-1; i++) {
						$("#cate2sel").append("<option value='"+result2[i]+"'>"+result2[i]+"</option>");
						}
				},
				
				error : function(error) {
					console.log("111111");
					console.log(data);
					alert("실패");
				}
			});
		});
	});

function chkCate1Sel(cate1sel) {
 document.fr.category1_text.value = cate1sel.value;
}
function chkCate2Sel(cate2sel) {
	 document.fr.category2_text.value = cate2sel.value;
}
	
	
</script>
	
	  <article id="content">
      	<div class="container mainDiv">
			<section class="content product_insert">			
				<form action="./ItemInsert.sh" method="post" name="fr">
				   <div class="content_title">				
						<h1>상품 등록</h1>
					</div>
					<table class="table" id="itemtable">
						<tr>
							<th>상품명(필수)</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th >판매가(필수)</th>
							<td><input type="text" name="old_price"> 할인율 : <input type="text" name="sale_price">%</td>
							
						</tr>
						<tr>
							<th>상품요약설명</th>
							<td><textarea rows="5" cols="130" name="content1"></textarea></td>
						</tr>
						<tr>
							<th>상품상세설명</th>					
						  	<td>	
						  	<textarea id="summernote" name="content2"></textarea>
						  	 </td>
	
						</tr>
						<tr>
							<th>이미지추가</th>
							<td><input type="file" name="pic1"><br>
								<input type="file"	name="pic2"><br>
								<input type="file"	name="pic3"><br>
								<input type="file"	name="pic4"></td>
						</tr>
					
						<tr>						
							<th>진열상태</th>
							<td><input type="radio" name="display" value="yes">진열함 <input type="radio" name="display" value="no">진열안함
							</td>
						</tr>
											
						<tr>						
							<th>판매상태</th>
							<td><input type="radio" name="sales" value="yes">판매함 <input type="radio" name="sales" value="no">판매안함
							</td>
						</tr>
					
						<tr>						
							<th>매인진열</th>
							<td><input type="radio" name="category" value="recommend">추천상품
								<input type="radio" name="category" value="new"> 신상품 
								<input type="radio" name="category" value="best"> 카테고리1 
								<input type="radio" name="category" value="ca2"> 카테고리2
							</td>
						</tr>	
						
						<tr>
							<th>상품분류<th>
							
							<td>
			
								1차 카테고리
								<input type="text" id="category1_text" name="category1_text" size="12">
								<input type="button" id ="findCategory1" name ="findCategory1" value="검색">
						
								<select id="cate1sel" onchange="chkCate1Sel(this)" name = "cate1sel">
						  		<option value ="">1차 카테고리</option>
								</select>
						
							<br>
						
								2차 카테고리
								<input type="text" id="category2_text" name="category2_text" size="12">
							<select id="cate2sel" onchange="chkCate2Sel(this)" name = "cate2sel">
						  		<option value ="">2차 카테고리</option>
								</select>			
							</td>
						
						
						
						</tr>
						
						
										
					</table>
					
					
					
					
					

	
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
				</form>
			</section>
		</div>
	</article>


    </div>


    <!-- jquery plugins here-->
    
<!--     <script src="./assets/js/jquery-1.12.1.min.js"></script> -->
    <!-- popper js -->
    <script src="./assets/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- easing js -->

    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="./assets/js/slick.min.js"></script>
    
    <script src="./assets/js/jquery.counterup.min.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    <script src="./assets/js/jquery.form.js"></script>    
    <!-- custom js -->
      <script src="./assets/js/theme.js"></script>
    
    <script src="./assets/js/custom.js"></script>



</body>
</html>