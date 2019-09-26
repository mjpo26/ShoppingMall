package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.EventBoardUpdateProService;
import svc.QnA_BoardModifyProService;
import vo.ActionForward;
import vo.EventBean;

public class EventBoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int event_num = Integer.parseInt(request.getParameter("event_num"));
		String page = request.getParameter("page");
		// 패스워드가 일치할 경우
		// 전달받은 파라미터 데이터(번호, 제목, 내용)를 BoardBean 객체에 저장
		EventBean article = new EventBean();
		article.setEvent_num(event_num);
		article.setEvent_subject(request.getParameter("event_subject"));
		article.setEvent_content(request.getParameter("event_content"));
		ActionForward forward = null;
		
	    EventBoardUpdateProService boardModifyProService = new EventBoardUpdateProService();
	    boolean isModifySuccess = boardModifyProService.modifyArticle(article);
		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {

			forward = new ActionForward();
			forward.setPath("EventBoardDetail.event?event_num=" + event_num + "&page=" + page);
			forward.setRedirect(true); // Redirect 방식이므로 생략 불가
		}
		return forward;
	}

}
