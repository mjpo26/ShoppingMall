package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberDeleteProService;
import svc.ReviewBoardDeleteProService;
import vo.ActionForward;

public class MemberdeleteAdminAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getParameter("id");
		System.out.println("여기서아이ㅣㅇ디ㅣㅇ" + id);

		MemberDeleteProService memberDeleteProService = new MemberDeleteProService();
		boolean isDeleteSuccess = memberDeleteProService.isDeleteMember(id);
		System.out.println("아이디는" + id);
		// 회원삭제 결과가 false일경우 삭제 실패출력 후 이전페이지로이동
		// true일 경우 index.jsp로 이동
		ActionForward forward = null;

		if (!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 삭제 성공!')");
			out.println("history.back()");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("Admin_memberList.me");
			forward.setRedirect(true);
		}

		return forward;
	}

}
