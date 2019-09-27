<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

//String page ="1";
//String limit ="10";

%>
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$( document ).ready(function() { 
	$.ajax({
        type:"POST",
        url : "<%=request.getContextPath()%>/ReviewAjax.ra",
        //Servlet과 mapping할 URL
        dataType : "json",
        data: {"page" : "1", "limit":"5"},
        success: function(data){
            console.log(data);   //통신에 성공하면 콘솔에 출력한다. 
      
            
            
			}

            
            
            
            
            
//             $('#category1_text').val(data[0].review_writer);
//             $('#category2_text').val(data[0].review_subject);
//             $('#category2_text').val(data[0].review_content);
        
        
        
        },
        error: function(xhr, status, error) {
            alert(error);
        }  
    });
});







	
</script>
<title>Insert title here</title>

</head>
<body>

 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        
        
        
        <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="row">
                 <div class="product_reivew clearfix">
                 <%                    
                    if (articleList != null & listCount > 0) {              
                        for (int i = 0; i < articleList.size(); i++) {
                    %>                  
                         <div class="col-12 review_list mb-4 float-left">
                         	<div class="review_title clearfix">
	                         	<h5 class="float-left">
	                         		<%=articleList.get(i).getReview_subject()%>
	                         	</h5>
	                         	<p class="float-right">
	                         		   작성자 : <%=articleList.get(i).getReview_writer() %> &nbsp;&nbsp;&nbsp;
	                         		     별점 : <%for(int j=0; j<articleList.get(i).getReview_starPoint(); j++ ){
										%> <i class="fa fa-star review_score"></i>
										<%} %> 
								</p>
                         	</div>       	
        
                         	
                         	
                           <script type="text/javascript">
			            	function doDisplay(i){
			            	    var detail = document.getElementById("review_detail"+i)
			            	    var summary = document.getElementById("review_summary"+i)
			            	    if(detail.style.display =='none'){
			            	    	detail.style.display ='block';
			            	    	summary.style.display ='none';
			            	    }else{
			            	    	summary.style.display ='block';
			            	    	detail.style.display ='none';
			            	    }
			            	}
		            	  </script>
		            	  
							<div class="bg-light p-3 review_bg" id="review_summary<%=i%>" onclick="doDisplay(<%=i%>);">
								<div class="review_summary">
								 <p class="float-left d-inline-block"><%=articleList.get(i).getReview_content()%></p>
								</div>
								 <i class="ti-angle-down float-right d-inline-block review_more" onclick="doDisplay(<%=i%>);"></i>
							</div>
							<div class="bg-light p-3 review_detail review_bg" id="review_detail<%=i%>" style="display:none;" onclick="doDisplay(<%=i%>);">
								<div class="review_content clearfix row">
								
		                           	<% if(articleList.get(i).getReview_file1()!=null){ %>                                	
                         			<div class="review_image float-left d-inline-block col-3">
		                               <img src="./upload/review/<%=articleList.get(i).getReview_file1()%>" class="rounded"                            
		                               onclick="location.href='ReviewBoardDetail.re?review_num=<%=articleList.get(i).getReview_num()%>&page=<%=nowPage%>'">
                         			</div><%}%>
		                         	<div class="review_text float-right d-inline-block col-9">
		                         	<i class="ti-angle-up float-right d-inline-block review_more" onClick="doDisplay(<%=i%>);"></i>		                         	
		                         	<p class="p-3">
		                         	<%=articleList.get(i).getReview_content()%>
		                         	</p>
		                         	</div>
								</div>
                         	</div>                   
                         </div>    
           
                    <%
                        }
                    %>







<table></table>
	<h1>상품관리_상품분류관리</h1>
	<div>
		<b>1차 카테고리</b>
		<form name ="myForm" method="post">
		
		<input type="text" id="category1_text" name="category1_text" value=" "size="12">
		<input type="text" id="category2_text" name="category2_text" size="12">
		<input type="text" id="category3_text" name="category3_text" size="12">
		
		%>
		
		
		
		
		<input type="button" id ="findCategory1" name ="findCategory1" value="검색">
		<br>
		<select id="cate1sel" onchange="chkCate1Sel(this)" name = "cate1sel">
  		<option value ="">1차 카테고리</option>
		</select>

	</form>
	</div>
	<br><br>
		<div>
		<b>2차 카테고리</b>
		<form name ="myForm2" method="post">
		<input type="text" id="category2_text" name="category2_text" size="12">
		<br>
	<select id="cate2sel" onchange="chkCate2Sel(this)" name = "cate2sel">
  		<option value ="">2차 카테고리</option>
		</select>
	</form>
	</div>
</body>
</html>