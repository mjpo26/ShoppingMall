package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnA_BoardReplyProService;
import vo.ActionForward;
import vo.QnA_BoardBean;

public class QnA_BoardReplyProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardReplyProAction");
        // page 파라미터 가져오기
        String page = request.getParameter("page");
        
        // BoardBean 객체(article) 생성 후 전달받은 모든 파라미터 추가
        QnA_BoardBean article = new QnA_BoardBean();
        System.out.println("Reply Action is Connected");
        article.setQnA_num(Integer.parseInt(request.getParameter("QnA_num")));
        article.setQnA_writer_id(request.getParameter("QnA_writer_id"));
        article.setQnA_pass(request.getParameter("QnA_pass"));
        article.setQnA_subject(request.getParameter("QnA_subject"));
        article.setQnA_content(request.getParameter("QnA_content"));
        article.setQnA_re_ref(Integer.parseInt(request.getParameter("QnA_re_ref")));
        article.setQnA_re_lev(Integer.parseInt(request.getParameter("QnA_re_lev")));
        article.setQnA_re_seq(Integer.parseInt(request.getParameter("QnA_re_seq")));
        article.setQnA_replycount("1");
        
        System.out.println("ReplyProAction 클래스 : " + Integer.parseInt(request.getParameter("QnA_re_ref")) + ", " + Integer.parseInt(request.getParameter("QnA_re_lev")));
        
        // BoardReplyProService 인스턴스 생성
        QnA_BoardReplyProService boardReplyProService = new QnA_BoardReplyProService();
        boardReplyProService.replyArticle(article);
        
        
        // ActionForward 객체를 사용하여 BoardList.bo?page=x 포워딩 => 페이지 번호를 가지고 이동
        ActionForward forward = new ActionForward();
        forward.setPath("QnA_BoardList.qa?page=" + page);
        forward.setRedirect(true);
        
        return forward;
    }

}
