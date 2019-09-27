<%@page import="vo.PageInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
 	ArrayList<ItemBean> articleList = (ArrayList<ItemBean>) request.getAttribute("articleList");

%>
<jsp:include page="../main/adminTop.jsp"></jsp:include>  
	<h3>관리자 상품 리스트</h3>
	     </div>                    
      </div>
	</header>

<!-- 날짜 선택 -->	

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- dataTables 시작-->
<script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script>
$(document).ready(function() {
    var table = $('#example').DataTable({
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
<script>
	$(function() {

		$("#pickStart").datepicker();

	});

	$(function() {

		$("#pickEnd").datepicker();

	});
</script>
<script type="text/javascript">
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
	
	//
	
	
}
</script>

    <article id="content">
    	<div class="container mainDiv">
			<form action ="./productList.sh"  name ="fr1" method="get" onsubmit="return pickNullCheck()">
				<div class="content_title">
                   <h1>상품목록</h1>
				</div>
				<table class="table">
					<tr>
						<td>검색분류</td>
						<td>
						<select>
							<option value="상품명">상품명</option>
							<option value="모델명">모델명</option>
						</select>
						<input type="text" name="title">
						</td>
					</tr>
					<tr>
						<td>상품분류</td>
						<td>
							<select name="category">
								<option value="">카테고리</option>
								<option value="best">best</option>
								<option value="new">new</option>
								<option value="recommend">recommend</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>기간검색</td>
						<td>
							시작날짜:<input type="text" name="pickStart" id="pickStart">
							끝 날짜:<input type="text" name="pickEnd" id="pickEnd">
						</td>
					</tr>
					<tr>
						<td>진열상태</td>					
						<td>
							<select name="display">
							<option value="">전체</option>
							<option value="yes">진열함</option>
							<option value="no">진열안함</option>
							</select>
						</td>
					</tr>
					<tr>						
						<td>판매상태</td>
						<td>
							<select name="sales">
							<option value="">전체</option>
							<option value="yes">진열함</option>
							<option value="no">진열안함</option>
							</select>
						</td>
					</tr>
				</table>
				<input class="btn btn-primary" type= "submit" value="검색하기"> 
				<input class="btn btn-secondary" type="reset"  value="초기화">
			
				
				
				<div style="width: 100%; float: left;">
					<div class="content_title">
                  		<h1>상품 목록 조회</h1>
					</div>
					<table id="example" class="display compact table">
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>상품명</th>
								<th>판매가</th>
								<th>할인가</th>
								<th>진열상태</th>
								<th>판매상태</th>
								<th>재고량</th>
								<th>이벤트</th>
								<th>상품분류</th>
								<th>등록일</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>		
						<%
						for (int i = 0; i < articleList.size(); i++) {
						%>
					<tr>
						<!-- 여기서 For문 돌려서 list를 받아옵니다. -->
						<th><input type="checkbox" name="cb"></th> <!-- 체크박스 -->
						<td><%=articleList.get(i).getItem_title()%></td> <!-- 상품명-->
						<td><%=articleList.get(i).getItem_old_price()%></td> <!-- 판매가-->
						<td><%=articleList.get(i).getItem_old_price()-articleList.get(i).getItem_sel_price()%></td><!-- 할인가-->
						
						<td><select name="display"><!-- 진열상태 -->
						<option <%if(articleList.get(i).getItem_display().equals("no")){%>selected<%}%>>no</option>
						<option <%if(articleList.get(i).getItem_display().equals("yes")){%>selected<%}%>>yes</option>
						</td>
						
						<td><select name="sales"> <!-- 판매상태 -->
						<option <%if(articleList.get(i).getItem_sales().equals("no")){%>selected<%}%>>no</option>
						<option <%if(articleList.get(i).getItem_sales().equals("yes")){%>selected<%}%>>yes</option>
						</td>
						
						<td><%=articleList.get(i).getItem_stock_count()%></td><!-- 재고 -->
						<td><%=articleList.get(i).getItem_icon1()%></td> <!-- 이벤트 -->
						<td><%=articleList.get(i).getItem_category1()+"/"+articleList.get(i).getItem_category2()%></td><!-- 카테고리 -->
						<td><%=articleList.get(i).getItem_Date()%></td><!-- 등록날짜 -->
						
						<th>
						<input type="hidden" name="Item_code" value=<%=articleList.get(i).getItem_code()%>>
						<input class="btn btn-default" type="submit" value="수정" formaction="./productUptdate.sh">
						<input class="btn btn-default" type="button" value="상세수정" class="genric-btn primary-border small"
								onclick="location.href='./update.sh?Item_code=<%=articleList.get(i).getItem_code()%>'">
						</th>
					</tr>
					<%
						}
					%>
								</tbody>
								<tfoot>
								</tfoot>
							</table>
						</form>
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












