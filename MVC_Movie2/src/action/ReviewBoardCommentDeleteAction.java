package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardDeleteProService;
import vo.ActionForward;

public class ReviewBoardCommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기까찌는 오니 ?");
		int num = Integer.parseInt(request.getParameter("num"));
		int commentNum =Integer.parseInt(request.getParameter("commentNum"));
		System.out.println("받아온 넘값!!!!!!!!!" + num+"댓글번호오ㅗ"+commentNum);
		ReviewBoardDeleteProService boardDeleteProService = new ReviewBoardDeleteProService();
		ActionForward forward = null;
		boolean isDeleteSuccess = boardDeleteProService.removeComment(num,commentNum);
		if (!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ReviewBoardList.re");
			forward.setRedirect(true); // Redirect 방식이므로 생략 불가
		}
		return forward;
	}

}
