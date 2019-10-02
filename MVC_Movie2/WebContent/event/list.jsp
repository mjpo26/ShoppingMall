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
           <div class="row">
                    <%                    
                    if (articleList != null & listCount > 0) {              
                        for (int i = 0; i < articleList.size(); i++) {
                    %>                  
               
                         <div class="event_list col-md-6 col-sm-12"  onclick="location.href='EventBoardDetail.event?event_num=<%=articleList.get(i).getEvent_num()%>&page=<%=nowPage%>'">
                             <figure class="figure">
                                <div class="event_photo">
                                 <%if(articleList.get(i).getEvent_imageMain()!= null){ %>
                                    <img src="./upload/event/<%=articleList.get(i).getEvent_imageMain()%>" class="figure-img">
                                 <% }else{%>                                
                               		<img src="../upload/event/basic.png" class="figure-img mx-auto" width="80%">
                                <% }%>
                                </div>
                                      
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
    












