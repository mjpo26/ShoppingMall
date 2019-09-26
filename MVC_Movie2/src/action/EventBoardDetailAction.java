package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.ReviewBoardDetailService;
import svc.ReviewCommentDetailService;
import vo.ActionForward;
import vo.EventBean;
import vo.MemberBean;
import vo.ReviewBoardBean;

public class EventBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ArrayList<EventBean> EventBean = new ArrayList<EventBean>();

		int num = (Integer.parseInt(request.getParameter("review_num")));
		System.out.println("대체뭔소리야 " + num);

		ReviewCommentDetailService reviewCommentDetailService = new ReviewCommentDetailService();
		EventBean = reviewCommentDetailService.getArticleList(num);

		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String page = request.getParameter("page");
		String sId = (String) session.getAttribute("sId");
		MemberBean memberBean = MemberInfoService.getMemberInfo(sId);
		System.out.println(sId);

		ReviewBoardDetailService boardDetailService = new ReviewBoardDetailService();

		ReviewBoardBean article = boardDetailService.getArticle(review_num);

		request.setAttribute("page", page);
		request.setAttribute("article", article);
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("EventBean", EventBean);
		System.out.println("쫌찎혀바바"+EventBean);
		ActionForward forward = new ActionForward();
		forward.setPath("/reviewBoard/view.jsp");
		forward.setRedirect(false);

		return forward;
	}
}
