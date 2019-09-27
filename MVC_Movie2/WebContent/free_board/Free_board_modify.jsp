<%@page import="vo.Free_BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // BoardBean 객체(article) 가져오기
	Free_BoardBean article = (Free_BoardBean)request.getAttribute("article");
	//page 파라미터 값 가져오기(page 식별자 지정 불가) => page 디렉티브 때문에 JSP의 예약어로 취급됨
	String nowPage = request.getParameter("page");
%>

<%
       
        	
        	// 세션 아이디 가져오기
        	String sId = (String)session.getAttribute("sId");
        	
        	
        	// 세션 아이디 없으면 Main.bo 로 이동
        	if(sId == null) {
        	    out.println("<script>");
        	    out.println("alert('로그인이 필요한 메뉴입니다!')");
        	    out.println("location.href='Main.bo'");
        	    out.println("</script>");
        	}
%>   
    
<jsp:include page="../main/adminTop.jsp"></jsp:include>

<h3>공지사항 게시글 수정</h3>
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
	 
<script type="text/javascript">
	function modifyBoard(password) {
		// DB 에 저장된 패스워드(password)와 폼태그에 입력된 패스워드(free_pass) 비교
// 		if(password != boardForm.free_pass.value) { // 패스워드 불일치 시
// 			alert('패스워드 불일치')
// 			return false
// 		}
		
		return true
		
		// 만약, 비즈니스 로직에서 별도로 패스워드를 확인할 경우 현재 자바스크립트 생략 가능
	}
</script>

<article id="content">
	<div class="container mainDiv">
		<section class="content product_insert">
		
	<!-- 게시판 글 수정 -->
	<section id="modifyForm">
		<div class="content_title">
			<h1>공지사항 게시글 수정</h1>
		</div>
		<form action="Free_BoardModifyPro.bo" method="post" 
				name="boardForm" onsubmit="return modifyBoard(<%=article.getFree_pass()%>)">
			<input type="hidden" name="free_num" value="<%=article.getFree_num() %>" />
			<input type="hidden" name="page" value="<%=nowPage%>" />
			<table class="table" id="free_modifytable">
				<tr>
					<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
					<td class="td_left"><label for="free_writer_id">ID</label></td>
					<td class="td_right">
						<input type="text" name="free_writer_id" id="free_writer_id" value="<%=article.getFree_writer_id() %>"  readonly="readonly" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="free_pass">비밀번호</label></td>
					<td class="td_right">
						<input type="password" name="free_pass" id="free_pass" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="free_subject">제목</label></td>
					<td class="td_right">
						<input type="text" name="free_subject" id="free_subject" value="<%=article.getFree_subject() %>" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="free_content">내용</label></td>
					<td class="td_right"><textarea id="summernote" name="content" rows="5" cols="100"></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록하기" />&nbsp;&nbsp;
				<input type="button" value="뒤로가기" onclick="history.back()" />
			</section>
		</form>	
	</section>
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















