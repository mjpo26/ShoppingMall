package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.EventBoardDetailService;
import vo.ActionForward;
import vo.EventBean;

public class EventBoardUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		  int event_num = Integer.parseInt(request.getParameter("event_num"));

        EventBoardDetailService boardDetailService = new EventBoardDetailService();
        EventBean article = boardDetailService.getArticle(event_num);
        
        // request 객체에 BoardBean 객체 저장
        request.setAttribute("article", article);
        
        ActionForward forward = new ActionForward();
        forward.setPath("/event/update.jsp");
        forward.setRedirect(false); // Dispatcher 방식 지정
        return forward;
    }
}
