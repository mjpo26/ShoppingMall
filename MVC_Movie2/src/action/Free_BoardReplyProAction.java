package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Free_BoardReplyProService;
import vo.ActionForward;
import vo.Free_BoardBean;


public class Free_BoardReplyProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardReplyProAction");
        // page 파라미터 가져오기
        String page = request.getParameter("page");
        
        // BoardBean 객체(article) 생성 후 전달받은 모든 파라미터 추가
        Free_BoardBean article = new Free_BoardBean();
        System.out.println("리플라이프로액션 왔다");
        article.setFree_num(Integer.parseInt(request.getParameter("free_num")));
        article.setFree_writer_id(request.getParameter("free_writer_id"));
        article.setFree_pass(request.getParameter("free_pass"));
        article.setFree_subject(request.getParameter("free_subject"));
        article.setFree_content(request.getParameter("free_content"));
        article.setFree_ref(Integer.parseInt(request.getParameter("free_ref")));
        article.setFree_lev(Integer.parseInt(request.getParameter("free_lev")));
        article.setFree_seq(Integer.parseInt(request.getParameter("free_seq")));
        
        System.out.println("ReplyProAction 클래스 : " + Integer.parseInt(request.getParameter("free_ref")) + ", " + Integer.parseInt(request.getParameter("free_lev")));
        
        // BoardReplyProService 인스턴스 생성
        Free_BoardReplyProService boardReplyProService = new Free_BoardReplyProService();
        boardReplyProService.replyArticle(article);
        
        
        // ActionForward 객체를 사용하여 BoardList.bo?page=x 포워딩 => 페이지 번호를 가지고 이동
        ActionForward forward = new ActionForward();
        forward.setPath("Free_BoardList.bo?page=" + page);
        forward.setRedirect(true);
        
        return forward;
    }

}
