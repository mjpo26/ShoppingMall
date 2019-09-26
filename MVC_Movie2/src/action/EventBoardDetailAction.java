package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.EventBoardDetailService;
import vo.ActionForward;
import vo.EventBean;

public class EventBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ArrayList<EventBean> EventBean = new ArrayList<EventBean>();


		int event_num = Integer.parseInt(request.getParameter("event_num"));
		String page = request.getParameter("page");


		EventBoardDetailService boardDetailService = new EventBoardDetailService();

		EventBean article = boardDetailService.getArticle(event_num);

		request.setAttribute("page", page);
		request.setAttribute("article", article);

		ActionForward forward = new ActionForward();
		forward.setPath("/event/view.jsp");
		forward.setRedirect(false);

		return forward;
	}
}
