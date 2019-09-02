package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Free_BoardDetailService;
import vo.ActionForward;
import vo.Free_BoardBean;

public class Free_BoardReplyFormAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardReplyFormAction");
        
        // 게시물 번호(free_num), 현재 페이지(page) 파라미터 가져오기
        int free_num = Integer.parseInt(request.getParameter("free_num"));
        String page = request.getParameter("page");
        
        // BoardDetailService 클래스의 getArticle() 메서드를 호출하여 게시물 정보 가져오기
        Free_BoardDetailService boardDetailService = new Free_BoardDetailService();
        Free_BoardBean article = boardDetailService.getArticle(free_num);
        
        // 현재 게시물 정보(article), 현재 페이지(page) request 객체에 저장
        request.setAttribute("article", article);
        request.setAttribute("page", page);
        
        ActionForward forward = new ActionForward();
        forward.setPath("/free_board/Free_board_reply.jsp");
        forward.setRedirect(false);
        return forward;
    }

}
