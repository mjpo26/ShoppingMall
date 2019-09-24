package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBoardBean;

public class productReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		  
	       // ---------------------- 리뷰 추가
	        
	        ArrayList<ReviewBoardBean> articleList = new ArrayList<ReviewBoardBean>();
	        // 페이징 처리를 위한 변수 선언
	        int reviewPage = 1; // 현재 페이지
	        int limit = 5; // 한 페이지 당 표시할 게시물 수
	        
	        // 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장
	        if(request.getParameter("page") != null) {
	        	reviewPage = Integer.parseInt(request.getParameter("page"));
	        }
	        
	        ReviewBoardListService boardListService = new ReviewBoardListService();
	        int listCount = boardListService.getListCount(); // 전체 게시물 수 가져오기

	        articleList = boardListService.getArticleList(reviewPage, limit); // 전체 게시물 목록 가져오기(10개 한정)
	        
	        // 전체 페이지(마지막 페이지) 수 계산
	        int maxPage = (int)((double)listCount / limit + 0.95);
	        
	        // 시작 페이지 수 계산
	        int startPage = (((int)((double)reviewPage / 10 + 0.9)) - 1) * 10 + 1;
	        
	        // 끝 페이지 수 계산
	        int endPage = startPage + 10 - 1;
	        
	        // 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
	        if(endPage > maxPage) {
	            endPage = maxPage;
	        }
	        
	        // PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
	        PageInfo pageInfo = new PageInfo(reviewPage, maxPage, startPage, endPage, listCount);
	        
	        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
	        request.setAttribute("review_pageInfo", pageInfo);
	        request.setAttribute("review_articleList", articleList);    
	        
	  
	        
	        ActionForward forward = new ActionForward();
	        forward.setPath("/productDetail.sh?Item_code=1&page=1");
	        forward.setRedirect(true); // 생략 가능	        
      
	        
	        return forward;
	}

}
