<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<ReviewBoardBean> articleList = (ArrayList<ReviewBoardBean>) request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    int maxPage = pageInfo.getMaxPage();
%>

<jsp:include page="../assets/top.jsp"></jsp:include>
  
      <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>리뷰 게시판</h2>
                            <p>
                               리뷰 목록 <span>-</span> 상품 리뷰 모음
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
    <section class="review_board_list board_list mt-5">    
        <div class="container">
           <div class="row clearfix">
                    <%
                    if (articleList != null & listCount > 0) {              
                        for (int i = 0; i < articleList.size(); i++) {
                    %>                  
                         <div class="col-lg-3 col-md-4 col-sm-6 float-left review_list">
                             <figure class="figure">
                                 <%if(articleList.get(i).getReview_file1() != null){ %>
                                <div class="review_photo">
                                    <img src="./upload/review/<%=articleList.get(i).getReview_file1()%>" class="figure-img"                                 
                                    onclick="location.href='ReviewBoardDetail.re?review_num=<%=articleList.get(i).getReview_num()%>&page=<%=nowPage%>'">
                                </div>
                                <% }else{%>                                
                                <%=articleList.get(i).getReview_content() %>
                                <% }%>
                                      
                                <figcaption class="figure-caption position-absolute fixed-top review_title mx-auto"><p><%=articleList.get(i).getReview_subject()%></p></figcaption>
                                <figcaption class="figure-caption position-absolute fixed-bottom review_writer mx-auto"><p><%=articleList.get(i).getReview_subject()%></p></figcaption>
                             </figure>
                         </div>
                <%--         <div class="row clearfix">
                            <div class="float-left col"><p class="text-left"><%=articleList.get(i).getReview_writer()%></p> </div>
                            <div class="float-right col"><p class="text-right">조회수:<%=articleList.get(i).getReview_readcount()%></p> </div>
                         </div> --%>
             
                    <%
                        }
                    %>
           </div>
    
        <section id="writeButton">
            <a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
        </section>
    
        <section id="pageList">
            <%
            if (nowPage <= 1) {
            %>
            [이전]&nbsp;
            <%
                } else {
            %>
            <a href="ReviewBoardList.re?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
            <%
                }
                 for (int i = startPage; i <= endPage; i++) {
                        if (i == nowPage) {
            %>
            [<%=i%>]
            <%
                } else {
            %>
            <a href="ReviewBoardList.re?page=<%=i%>">[<%=i%>]
            </a>&nbsp;
            <%
                }

            }
            %>
    
            <%
            if (nowPage >= maxPage) {
            %>
            &nbsp;[다음]
            <%
                } else {
            %>
            <a href="ReviewBoardList.re?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
            <%
                }
            %>
        </section>
        <%
            } else {
        %>
        <section id="emptyArea">등록된 글이 없습니다.</section>
        <section id="writeButton">
            <a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
        </section>
        <%
            }
        %>
      
  
       </div>
   </section>
<jsp:include page="../assets/foot.jsp"></jsp:include>
    












