<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../main/adminTop.jsp"></jsp:include>

<h3>이벤트 등록</h3>
</div>
</div>
</header>

<!-- 썸머노트 에디트를 이용하기 위한 링크 및 스크립트. -->
<script src="./js/jquery-3.4.1.js"></script>
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

<article id="content">
	<div class="container mainDiv">
		<section class="content product_insert">
			<form action="./EventBoardWritePro.event" method="post" name="fr" enctype="multipart/form-data">
				<div class="content_title">
					<h1>이벤트 게시판</h1>
				</div>
				<table class="table" id="itemtable">
					<tr>
						<th>이벤트명</th>
						<td><input type="text" name="subject"></td>
					</tr>
					<tr>
						<th>이벤트상태</th>
						<td><input type="radio" name="status" value="ing">진행
							<input type="radio" name="status" value="end">종료 <input
							type="radio" name="status" value="stand_by">대기</td>
					</tr>
					<tr>
						<th>이벤트요약</th>
						<td><textarea name="summary" rows="5" cols="100"> </textarea></td>
					</tr>

					<tr>
						<th>이벤트글</th>
						<td><textarea id="summernote" name="content" rows="5"
								cols="100"></textarea></td>
					</tr>
					<tr>
						<th>이벤트이미지(메인)</th>
						<td><input type="file" name="imageMain"></td>
					</tr>
					<tr>
						<th>이벤트이미지(배경)</th>
						<td><input type="file" name="imageBackground"></td>
					</tr>
					<tr>
						<th>이벤트이미지(배너)</th>
						<td><input type="file" name="banner"></td>
					</tr>
					<tr>
						<th>이벤트이미지(배너작은아이콘)</th>
						<td><input type="file" name="banner2"></td>
					</tr>

				</table>
				<input type="submit" value="등록하기">
				 <input type="reset" value="취소하기">
			</form>
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