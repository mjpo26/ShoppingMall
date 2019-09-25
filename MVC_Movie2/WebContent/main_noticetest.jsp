<%@page import="vo.PageInfo"%>
<%@page import="dao.ReviewBoardDAO"%>
<%@page import="vo.ReviewBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// BoardDAO bdao 객체생성
// int count=getBoardCount() 메서드호출
// int pageSize=5;
// int startRow=1;
//   ReviewBoardListService boardListService = new ReviewBoardListService();
// 	        int listCount = boardListService.getListCount(); // 전체 게시물 수 가져오기

// 	        articleList = boardListService.getArticleList(reviewPage, limit); // 전체 게시물 목록 가져오기(10개 한정)
	        
// 	        // 전체 페이지(마지막 페이지) 수 계산
// 	        int maxPage = (int)((double)listCount / limit + 0.95);
	        
// 	        // 시작 페이지 수 계산
// 	        int startPage = (((int)((double)reviewPage / 10 + 0.9)) - 1) * 10 + 1;
	        
// 	        // 끝 페이지 수 계산
// 	        int endPage = startPage + 10 - 1;
	        
// 	        // 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
// 	        if(endPage > maxPage) {
// 	            endPage = maxPage;
// 	        }
	        
// 	        // PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
// 	        PageInfo pageInfo = new PageInfo(reviewPage, maxPage, startPage, endPage, listCount);
	        
// 	        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
// 	        request.setAttribute("review_pageInfo", pageInfo);
// 	        request.setAttribute("review_articleList", articleList);    
	        

// 게시판 글있으면
int count= pageInfo.getListCount();
//boardList = getBoardList(시작행,가져올 글개수)
JSONArray arr=new JSONArray();
ArrayList<ReviewBoardBean> articleList = (ArrayList<ReviewBoardBean>) request.getAttribute("review_articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("review_pageInfo");
// articleList.get(1).
if(count!=0){
// 	boardList=bdao.getBoardList(startRow, pageSize);
	for(int i=0;i<articleList.size();i++){
// 		BoardBean bb=boardList.get(i);
		ReviewBoardBean bb= articleList.get(i);
		JSONObject mb=new JSONObject();
// 		articleList.get(i).getReview_subject()
		mb.put("subject", bb.getReview_subject());
		mb.put("subject", bb.getSubject());
		
		arr.add(mb);
	}
}
%>
<%=arr%>