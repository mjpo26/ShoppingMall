<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>summernote</title>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	
	<link href="./dist/summernote-bs4.css" rel="stylesheet">
	<script src="./dist/summernote-bs4.js"></script>
    
<!--     <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->

<!-- <link -->
<!-- 	href="./dist/summernote-bs4.css" -->
<!-- 	rel="stylesheet"> -->
<!-- <script -->
<!-- 	src="./dist/summernote-bs4.js"></script> -->
<!-- <script src="./dist/lang/summernote-ko-KR.js"></script> -->
    
	<script type="text/javascript">

// 	    function sendFile(file,editor,welEditable) {
// 	        data = new FormData();
// 	        data.append("file", file);
// 	        $.ajax({
// 	            url: "./summernote_imageUpload.jsp", // image 저장 경로
// 	            data: data,
// 	            cache: false,
// 	            contentType: false,
// 	            enctype: 'multipart/form-data',
// 	            processData: false,
// 	            type: 'POST',
// 	            success: function(data){
// 	                var obj = JSON.parse(data);
// 	                alert(data.url);
// 	                if (obj.success) {
// 	                    var image = $('<img>').attr('src', '' + data.url); // 에디터에 img 태그로 저장
// 	                    $('.summernote').summernote("insertNode", image[0]); // summernote 에디터에 img 태그를 보여줌
// 	                } else {
// 	                    switch(parseInt(obj.error)) {
// 	                        case 1: alert('업로드 용량 제한에 걸렸습니다.'); break;
// 	                        case 2: alert('MAX_FILE_SIZE 보다 큰 파일은 업로드할 수 없습니다.'); break;
// 	                        case 3: alert('파일이 일부분만 전송되었습니다.'); break;
// 	                        case 4: alert('파일이 전송되지 않았습니다.'); break;
// 	                        case 6: alert('임시 폴더가 없습니다.'); break;
// 	                        case 7: alert('파일 쓰기 실패'); break;
// 	                        case 8: alert('알수 없는 오류입니다.'); break;
// 	                        case 100: alert('허용된 파일이 아닙니다.'); break;
// 	                        case 101: alert('0 byte 파일은 업로드할 수 없습니다.'); break;
// 	                    }
// 	                }
// 	            },
// 	            error: function(jqXHR, textStatus, errorThrown) {
// 	                console.log(textStatus+" "+errorThrown);
// 	            }
// 	        });
// 	    }
// 	    $(document).ready(function() {
	    	 
// 	    	  var IMAGE_PATH = 'http://localhost/new/ver_php/fb/uploads/';
	    	 
// 	    	  $('.summernote').summernote({
// 	    	    height: 300,
// 	    	    callbacks : {
// 	    	      onImageUpload: function(image) {
// 	    	        alert("이미지 업로드");
// 	    	        uploadImage(image[0]);
// 	    	      }
// 	    	    }
// 	    	  });
	    	 
// 	    	  function uploadImage(image) {
// 	    	    var data = new FormData();
// 	    	    data.append("image",image);
// 	    	    $.ajax ({
// 	    	      data: data,
// 	    	      type: "POST",
// 	    	      url: "./summernote_imageUpload.jsp",
// 	    	      encType: "multipart/form-data",
// 	    	      cache: false,
// 	    	      contentType: false,
// 	    	      processData: false,
// 	    	      success: function(url) {
// 	    	        var image = IMAGE_PATH + url;
// 	    	        $('.summernote').summernote('insertImage', image);
// 	    	        console.log(image);
// 	    	      },
// 	    	      error: function(data) {
// 	    	        console.log(data);
// 	    	      }
// 	    	    });
// 	    	  }
// 	    	});
	
	    
	    
	    
	
        /* summernote에서 이미지 업로드시 실행할 함수 */
        function sendFile(files, modules, editable) {
  for(var i=0; i < files.length; i++){
    (function(i) {
      var data = new FormData();
      data.append("uploadFile", files[i]);
      $.ajax({
        data : data,
        type : "POST",
        url : "./summernote_imageUpload.jsp",
        success : function(data) {
          modules.editor.insertImage(editable, data.url, files[i].name);
        }
      });
    })(i);
  }
}


// 	 	function sendFile(file, editor) {
//             // 파일 전송을 위한 폼생성
// 	 		data = new FormData();
// 	 	    data.append("uploadFile", file);
// 	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
// 	 	        data : data,
// 	 	        type : "POST",
// 	 	        url : "./summernote_imageUpload.jsp",
// 	 	        cache : false,
// 	 	        contentType : false,
// 	 	        processData : false,
// 	 	        success : function(data) { // 처리가 성공할 경우
//                     // 에디터에 이미지 출력
//                     alert(data.url);
//                     editor.inserImage(editor,data.url);
// 	 	        	$(editor).summernote('editor.insertImage', data.url);
// 	 	        	$('#summernote').summernote('editor.insertImage', data.url);
// 	 	        	$('#summernote').summernote("insertNode", data.url); // summernote 에디터에 img 태그를 보여줌
// 	 	        	editor.insertImage(welEditable, data.url);
// 	 	        	$editor.summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
</head>
<body>
	<h1>summernote</h1>
	<form name="writeForm" action="./summernote_insert.jsp" method="post">
	<img src="./upload/640_1.jpg">
		<textarea id="summernote">Hello Summernote</textarea>
        <script>
        $('.summernote').summernote({
        	height:400,
        	callbakck: {
            onImageUpload : function(files, modules, editable) {
                sendFile(files, modules, editable);
            }},
            lang : 'ko-KR'
        });


//         $(document).ready(function() {
//                 $('#summernote').summernote({ // summernote를 사용하기 위한 선언
//                     height: 400,
// 					callbacks: { // 콜백을 사용
//                         // 이미지를 업로드할 경우 이벤트를 발생
// 					    onImageUpload: function(files, editor, welEditable) {
// 						    sendFile(files[0], this);
// 						}
// 					}
// 				});
// 			});
		</script>
</body>
</html>
