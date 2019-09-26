package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.EventBoardListService;
import svc.MemberInfoService;
import svc.ReviewBoardDetailService;
import svc.ReviewCommentDetailService;
import vo.ActionForward;
import vo.CommentBean;
import vo.PageInfo;
import vo.ReviewBoardBean;
import vo.EventBean;
import vo.MemberBean;

public class EventBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<EventBean> articleList = new ArrayList<EventBean>();
		HttpSession session = request.getSession();

		int num = (Integer.parseInt(request.getParameter("review_num")));
		System.out.println("대체뭔소리야 " + num);

		EventBoardListService eventBoardListService = new EventBoardListService();
		articleList = eventBoardListService.getArticleList(num);

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

		ActionForward forward = new ActionForward();
		forward.setPath("/reviewBoard/view.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
