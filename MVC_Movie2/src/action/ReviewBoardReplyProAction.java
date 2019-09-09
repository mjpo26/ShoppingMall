package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardReplyProService;
import vo.ActionForward;
import vo.ReviewBoardBean;

public class ReviewBoardReplyProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardReplyProAction");
        // page 파라미터 가져오기
    	
        String page = request.getParameter("page");
        
        // BoardBean 객체(article) 생성 후 전달받은 모든 파라미터 추가
        ReviewBoardBean article = new ReviewBoardBean();
        System.out.println("Reply Action is Connected");
        article.setReview_num(Integer.parseInt(request.getParameter("review_num")));
        article.setReview_writer(request.getParameter("review_writer"));
        article.setReview_pass(request.getParameter("review_pass"));
        article.setReview_subject(request.getParameter("review_subject"));
        article.setReview_content(request.getParameter("review_content"));
        article.setReview_re_ref(Integer.parseInt(request.getParameter("review_re_ref")));
        article.setReview_re_lev(Integer.parseInt(request.getParameter("review_re_lev")));
        article.setReview_re_seq(Integer.parseInt(request.getParameter("review_re_seq")));
        
        System.out.println("ReplyProAction 클래스 : " + Integer.parseInt(request.getParameter("review_re_ref")) + ", " + Integer.parseInt(request.getParameter("review_re_lev")));
        
        // BoardReplyProService 인스턴스 생성
        ReviewBoardReplyProService boardReplyProService = new ReviewBoardReplyProService();
        boardReplyProService.replyArticle(article);
        
        // ActionForward 객체를 사용하여 BoardList.bo?page=x 포워딩 => 페이지 번호를 가지고 이동
        ActionForward forward = new ActionForward();
        forward.setPath("ReviewBoardList.re?page=" + page);
        forward.setRedirect(true);
        
        return forward;
    }
}
