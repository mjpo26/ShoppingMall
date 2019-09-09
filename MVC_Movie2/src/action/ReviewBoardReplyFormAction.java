package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardDetailService;
import vo.ActionForward;
import vo.ReviewBoardBean;

public class ReviewBoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      System.out.println("ReviewBoardReplyFormAction");
	        
	        // 게시물 번호(Review_num), 현재 페이지(page) 파라미터 가져오기
	        int review_num = Integer.parseInt(request.getParameter("review_num"));
	        String page = request.getParameter("page");
	        
	        // BoardDetailService 클래스의 getArticle() 메서드를 호출하여 게시물 정보 가져오기
	        ReviewBoardDetailService boardDetailService = new ReviewBoardDetailService();
	        ReviewBoardBean article = boardDetailService.getArticle(review_num);
	        
	        // 현재 게시물 정보(article), 현재 페이지(page) request 객체에 저장
	        request.setAttribute("article", article);
	        request.setAttribute("page", page);
	        
	        ActionForward forward = new ActionForward();
	        forward.setPath("/reviewBoard/reply.jsp");
	        forward.setRedirect(false);
	        return forward;
	    }
}
