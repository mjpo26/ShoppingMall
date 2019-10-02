package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDeleteProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String sId = (String) session.getAttribute("sId");

		MemberDeleteProService memberDeleteProService = new MemberDeleteProService();
		boolean isDeleteSuccess = memberDeleteProService.isDeleteMember(sId, request.getParameter("member_pass"));
		System.out.println("아이디는" + sId + "비밀번호는" + request.getParameter("member_pass"));
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
			session.invalidate();
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 탈퇴 성공!')");
			out.println("history.back()");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(true);
		}

		return forward;
	}

}
