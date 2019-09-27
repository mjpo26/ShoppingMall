<%@page import="vo.QnA_BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="vo.AdminBoardSearchBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AdminBoardSearchBean abb = new AdminBoardSearchBean();
	abb = (AdminBoardSearchBean) request.getAttribute("abb");
%>
<jsp:include page="../main/adminTop.jsp"></jsp:include>  
	<h3>관리자 게시물 관리</h3>
	     </div>                    
      </div>
	</header>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 날짜선택임포트 끝 -->
<!-- dataTables 시작-->
<script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
	
    <script>
    $(document).ready(function() {
        var table = $('#example1').DataTable({
            columnDefs: [{
                orderable: true
            
            }]
        });
     
        $('button').click( function() {
            var data = table.$('input, select').serialize();
            alert(
                "The following data would have been submitted to the server: \n\n"+
                data.substr( 0, 120 )+'...'
            );
            return false;
        } );
    } );
	</script>
	
	 <script>
    $(document).ready(function() {
        var table = $('#example2').DataTable({
            columnDefs: [{
                orderable: true
            
            }]
        });
     
        $('button').click( function() {
            var data = table.$('input, select').serialize();
            alert(
                "The following data would have been submitted to the server: \n\n"+
                data.substr( 0, 120 )+'...'
            );
            return false;
        } );
    } );
	</script>
	
	 <script>
    $(document).ready(function() {
        var table = $('#example3').DataTable({
            columnDefs: [{
                orderable: true
            
            }]
        });
     
        $('button').click( function() {
            var data = table.$('input, select').serialize();
            alert(
                "The following data would have been submitted to the server: \n\n"+
                data.substr( 0, 120 )+'...'
            );
            return false;
        } );
    } );
	</script>
<!-- dataTables 끝-->
<!-- 날짜선택 스크립트 -->
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>

<script type = "text/javascript">
function pickNullCheck(){
	if(document.fr1.pickStart.value==""){
//		document.fr1.pickStart.value=="2015-01-01";
		var pickStart = $('#pickStart').val('01/01/2010');

		return false;
	}
	if(document.fr1.pickEnd.value==""){
 	//	document.fr1.pickEnd.value=="2020-01-01";
		var pickEnd =  $('#pickEnd').val('01/01/2020');
	
		return false;
	}
	if(document.fr1.list.value==""){
	 	alert("검색 할 게시판 선택은 필수입니다.")
		
			return false;
		}
	//
	
	
}

</script>
<!-- 날짜선택 스크립트 끝 -->

    <article id="content">
    	<div class="container mainDiv">
	<!-- 폼 선택!!!!!!!!!!!!!!-->

				<div class="content_title">
                   <h1>게시판 목록</h1>
				</div>
				<form action="./AdminBoardList.me" name="fr1" method="post" onsubmit="return pickNullCheck()">
					<table class="table">
						<tr>
							<th>기간검색</th>
							<td>시작날짜:&nbsp;&nbsp;<input type="text" name="pickStart" id="pickStart">&nbsp;&nbsp;&nbsp;
								끝 날짜:&nbsp;&nbsp;<input type="text" name="pickEnd" id="pickEnd">
							</td>
						</tr>
						<tr>
							<th>게시판 선택 *필수*</th>
							<td>
								<select name="list">
									<option value="리뷰게시판">리뷰게시판</option>
									<option value="QnA게시판">QnA게시판</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>내용 검색</th>
							<td> 
							<input type="text" size="20" name="title" placeholder="제목으로 검색"> <input type="text" size="20" name="writer" placeholder="작성자로 검색">
							</td>
						</tr>
			
						<tr>
							<th>답변여부</th>
							<td>
								<input type="radio" name="replyCheck" value="*">전체 
								<input type="radio" name="replyCheck" value="0">답변전 
								<input type="radio" name="replyCheck" value="1">답변완료
							</td>
						</tr>
					</table>
					<input class="btn btn-primary" type="submit" value="검색">
					<input class="btn btn-secondary" type="reset" value="초기화">
				</form>
					
					
					
				<div class="content_title">
               		<h1>게시판 검색</h1>
				</div>

			<!-- 리뷰게시판 게시판!!!!!!!!!!!!!! -->
			<%
				if (abb.getBoard_list().equals("리뷰게시판")||abb.getBoard_list() == null) {
					ArrayList<ReviewBoardBean> boardList = (ArrayList<ReviewBoardBean>) request.getAttribute("boardList");
					PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
					int listCount = pageInfo.getListCount();
					int nowPage = pageInfo.getPage();
					int startPage = pageInfo.getStartPage();
					int endPage = pageInfo.getEndPage();
					int maxPage = pageInfo.getMaxPage();
			%>
			<div style="width: 100%; float: left;">
				<table id="example2" class="display compact table">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
							<th>게시글보기</th>
						</tr>
					</thead>
					<tbody>
					<%
						for (int i = 0; i < boardList.size(); i++) {
								// 				String[] reviewStatus = new String[100];
								if (boardList.get(i).getReview_re_lev() != 0)
									continue; //답변은 표시안함
					%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%=boardList.get(i).getReview_num()%></td>
							<td><%=boardList.get(i).getReview_subject()%></td>
							<td><%=boardList.get(i).getReview_writer()%></td>
							<td><%=boardList.get(i).getReview_date()%></td>
							<td>
							<%
								if (boardList.get(i).getReview_replycount().equals("1")) {
							%> 답변완료 <%
								} else {
							%> 답변전 <%
								}
							%>
							</td>
							<td>
								<a href="ReviewBoardDetail.re?review_num=<%=boardList.get(i).getReview_num()%>&page=<%=nowPage%>">
								<input type="button" value="게시글 보기"></a>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
					<tfoot>
					</tfoot>
				 </table>
			</div>
					
			<!-- QnA 게시판!!!!!!!!!!!!!! -->
			<%
				} else if (abb.getBoard_list().equals("QnA게시판")) {
					ArrayList<QnA_BoardBean> boardList = (ArrayList<QnA_BoardBean>) request.getAttribute("boardList");
					PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
					int listCount = pageInfo.getListCount();
					int nowPage = pageInfo.getPage();
					int startPage = pageInfo.getStartPage();
					int endPage = pageInfo.getEndPage();
					int maxPage = pageInfo.getMaxPage();
					%>
				<div style="width: 100%; float: left;">
					<table id="example3" class="display compact table">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
							<th>게시글보기</th>
						</tr>
					</thead>
					<tbody>
					<%
						for (int i = 0; i < boardList.size(); i++) {
								// 				String[] reviewStatus = new String[100];
								if (boardList.get(i).getQnA_re_lev() != 0)
									continue;
					%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%=boardList.get(i).getQnA_num()%></td>
							<td><%=boardList.get(i).getQnA_subject()%></td>
							<td><%=boardList.get(i).getQnA_writer_id()%></td>
							<td><%=boardList.get(i).getQnA_date()%></td>
							<td>
								<%
									if (boardList.get(i).getQnA_replycount().equals("1")) {
								%> 답변완료 <%
									} else {
								%> 답변전 <%
									}
								%> 
							</td> 
							<td>
								<a href="ReviewBoardDetail.re?review_num=<%=boardList.get(i).getQnA_num()%>&page=<%=nowPage%>">
								<input type="button" value="게시글 보기"></a>
							</td>
						</tr>
						<%
							}
						}
						%>
						</tbody>
					<tfoot>
					</tfoot>
					</table>
				</div>
				
				
				
			</div>
		</article> 
	 </div> <!-- id=main div  -->
</div> <!--  id wrap div -->

    <!-- jquery plugins here-->
    
<!-- <script src="./assets/js/jquery-1.12.1.min.js"></script> -->
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



