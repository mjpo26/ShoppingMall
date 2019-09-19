<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

 <!-- 부트스트랩과 제이쿼리 라이브러리를 사용하기 위한 선언 -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<script src="../js/jquery-3.4.1.js"></script>
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> --> 
     
<!-- summernote의 스타일시트와 자바스크립트을 사용하기 위한 선언 -->
<!-- <link href="../wysiwyg/summernote/summernote.css" rel="stylesheet" type="text/css">
<script src="../wysiwyg/summernote/summernote.js"></script> -->


<link href="../wysiwyg/summernote/summernote-lite.css" rel="stylesheet" type="text/css">
<script src="../wysiwyg/summernote/summernote-lite.js"></script>
<script src="../wysiwyg/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
function sendFile(file, editor) {
    // 파일 전송을 위한 폼생성
	data = new FormData();
    data.append("uploadFile", file);
    $.ajax({ // ajax를 통해 파일 업로드 처리
        data : data,
        type : "POST",
        url : "../wysiwyg/summernote/imageUpload.jsp",
        cache : false,
        contentType : false,
        processData : false,
        async:false,
        success : function(data) { // 처리가 성공할 경우
        	 console.log(data);/*
        	console.log(data.url); */
        	$(editor).summernote('editor.insertImage', "../"+data.url);
        	//$('#hidFilename').val() +
        	$('#hidFilename').val($('#hidFilename').val()+data.fileName+ '|');
        	//console.log($('#subject').val());
        	//console.log("hidFilename;" + $('#hidFilename').val());

        },
        error:function(data){
        	console.log("실패");
        	console.log(data);
        } 

    });
}
	    
$(document).ready(function() {
   $('#content').summernote({
	
	height: 300                 // set editor height
	, minHeight: null             // set minimum height of editor
	, maxHeight: null             // set maximum height of editor
	, focus: true                  // set focus to editable area after initializing summernote
	, lang : 'ko-KR'
	, callbacks: { // 콜백을 사용
         // 이미지를 업로드할 경우 이벤트를 발생
	    onImageUpload: function(files, editor, welEditable) {
		    for (var i = files.length - 1; i >= 0; i--) {
            	sendFile(files[i], this);
            }
		}
	}
	});
});


</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<header>
</header>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 게시판 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
	<table id="notice">
	<!-- <tr><th class="tno">No.</th>
	    <th class="ttitle">Title</th>
	    <th class="twrite">Writer</th>
	    <th class="tdate">Date</th>
	    <th class="tread">Read</th></tr>
	<tr> -->
	<!-- <tr>
		<td class="twrite">글쓴이</td>
		<td class="ttitle"><input type="text" name="name"></td>
	</tr> -->
	<!-- <tr>
		<td class="twrite">비밀번호</td>
		<td class="ttitle"><input type="password" name="pass"></td>
	</tr> -->
	<tr>
		<td class="twrite">제목</td>
		<td class="ttitle"><input type="text" name="subject" id="subject"></td>
	</tr>
	<tr>
		<td class="twrite">글내용</td>
		<td class="ttitle">
			<textarea name="content" id="content"></textarea>
			<input type="hidden" id="hidFilename" name="hidFilename" value="">
		</td>
	</tr>

</form>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<footer>
</footer>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>