<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

	<meta charset="uft-8" />
	<title>summernote</title>
<!-- 	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>  -->
<!-- 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
<!-- 	<link href="./dist/summernote.css" rel="stylesheet"> -->
<!-- 	<script src="./dist/summernote.js"></script> -->

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

		 	        	$(editor).summernote('editor.insertImage', data.url);
		 	        }
		 	    });
		 	}
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor, welEditable) {
					    	//for문부터 용훈햄꺼
					    	for (var i = files.length - 1; i >= 0; i--) {
				            	sendFile(files[i], this);}
// 						    sendFile(files[0], this);
						}
					}
				});
			});
		
	</script>
</head>
<body>
	<h1>summernote</h1>
	<form name="writeForm" action="./summernote_insert.jsp" method="post">
		<textarea id="summernote">Hello Summernote</textarea>
		<img src="./upload/640.jpg">

</body>
</html>
