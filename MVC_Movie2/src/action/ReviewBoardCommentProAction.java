package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardCommentProService;
import vo.ActionForward;
import vo.CommentBean;
import vo.ReviewBoardBean;

public class ReviewBoardCommentProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardReplyProAction");
        // page 파라미터 가져오기
    	
        String page = request.getParameter("page");
        
        // BoardBean 객체(article) 생성 후 전달받은 모든 파라미터 추가
        CommentBean article = new CommentBean();
        System.out.println("댓글액션 연결됨!!!!");
//        article.setComment_num(Integer.parseInt(request.getParameter("Commentnum")));
        article.setComment_writer(request.getParameter("comment_name"));
        article.setComment_pass(request.getParameter("comment_pass"));
        article.setComment_content(request.getParameter("comment_content"));
        article.setComment_id(request.getParameter("comment_id"));
        article.setComment_review_num(Integer.parseInt(request.getParameter("comment_review_num")));
       
        // BoardReplyProService 인스턴스 생성
        ReviewBoardCommentProService boardReplyProService = new ReviewBoardCommentProService();
        boardReplyProService.replyArticle(article);
        
        // ActionForward 객체를 사용하여 BoardList.bo?page=x 포워딩 => 페이지 번호를 가지고 이동
        ActionForward forward = new ActionForward();
        forward.setPath("/reviewBoard/list.jsp");
        forward.setRedirect(true);
        
        return forward;
    }
}
