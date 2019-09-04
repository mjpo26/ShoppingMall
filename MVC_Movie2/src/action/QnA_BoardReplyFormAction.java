package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnA_BoardDetailService;
import vo.ActionForward;
import vo.QnA_BoardBean;

public class QnA_BoardReplyFormAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardReplyFormAction");
        
        // 게시물 번호(QnA_num), 현재 페이지(page) 파라미터 가져오기
        int QnA_num = Integer.parseInt(request.getParameter("QnA_num"));
        String page = request.getParameter("page");
        
        // BoardDetailService 클래스의 getArticle() 메서드를 호출하여 게시물 정보 가져오기
        QnA_BoardDetailService boardDetailService = new QnA_BoardDetailService();
        QnA_BoardBean article = boardDetailService.getArticle(QnA_num);
        
        // 현재 게시물 정보(article), 현재 페이지(page) request 객체에 저장
        request.setAttribute("article", article);
        request.setAttribute("page", page);
        
        ActionForward forward = new ActionForward();
        forward.setPath("/QnA_Board/QnA_Board_reply.jsp");
        forward.setRedirect(false);
        return forward;
    }

}
