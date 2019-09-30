<%@page import="vo.PageInfo"%>
<%@page import="vo.EventBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    ArrayList<EventBean> articleList = (ArrayList<EventBean>) request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    int maxPage = pageInfo.getMaxPage();
%>

<jsp:include page="../main/top.jsp"></jsp:include>
  
      <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>이벤트 게시판</h2>
                            <p>
                              이벤트 목록 <span>-</span> 이벤트 모음
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
    <section class="event_board_list board_list mt-5">    
        <div class="container">
           <div class=" ">
                    <%                    
                    if (articleList != null & listCount > 0) {              
                        for (int i = 0; i < articleList.size(); i++) {
                    %>                  
               
                         <div class="event_list">
                             <figure class="figure">
                                 <%if(articleList.get(i).getEvent_imageMain()!= null){ %>
                                <div class="event_photo">
                                    <img src="./upload/event/<%=articleList.get(i).getEvent_imageMain()%>" class="figure-img"                                 
                                    onclick="location.href='EventBoardDetail.event?event_num=<%=articleList.get(i).getEvent_num()%>&page=<%=nowPage%>'">
                                </div>
                                <% }else{%>                                
                                <%=articleList.get(i).getEvent_content() %>
                                <% }%>
                                      
                                <figcaption class="figure-caption position-absolute fixed-top event_title mx-auto">
                                <p><%=articleList.get(i).getEvent_subject()%><br>
								</p>
								</figcaption>
                                <figcaption class="figure-caption position-absolute fixed-bottom event_writer mx-auto">
                                	<p><%=articleList.get(i).getEvent_content()%></p>
                               	</figcaption>
                             </figure>
                         </div>
                          <%
                        }
                    %>
           </div>
    
<!--         <section id="writeButton">
            <a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
        </section> -->
    
        <div id="pageList" class="text-center event_board board_paging">
            <%
            if (nowPage <= 1) {
            %>
            <i class="ti-angle-left text-black-50"></i> &nbsp;&nbsp;&nbsp;
            <%
                } else {
            %>
            <a href="EventBoardList.event?page=<%=nowPage - 1%>"><i class="ti-angle-left"></i></a>&nbsp;&nbsp;&nbsp;
            <%
                }
                 for (int i = startPage; i <= endPage; i++) {
                        if (i == nowPage) {
            %>
            <span class="current"><b><%=i%></b></span>&nbsp;
            <%
                } else {
            %>
            <a href="EventBoardList.event?page=<%=i%>">
            <%=i%>&nbsp;
            </a>
            <%
                }

            }
            %>
    
            <%
            if (nowPage >= maxPage) {
            %>
            &nbsp;&nbsp;&nbsp; <i class="ti-angle-right text-black-50"></i> 

            <%
                } else {
            %>
            <a href="EventBoardList.event?page=<%=nowPage + 1%>">&nbsp;&nbsp;&nbsp; <i class="ti-angle-right" ></i> </a>
            <%
                }
            %>
        </div>
        <%
            } else {
        %>
        <section id="emptyArea">등록된 글이 없습니다.</section>
<!--         <section id="writeButton">
            <a href="ReviewBoardWriteForm.re"><input type="button" value="글쓰기"></a>
        </section> -->
        <%
            }
        %>
      
  
       </div>	<!--container  -->
   </section>
<jsp:include page="../main/foot.jsp"></jsp:include>
    












