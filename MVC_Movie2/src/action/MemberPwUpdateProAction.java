package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberUpdateProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberPwUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBean memberBean = new MemberBean();
		memberBean.setMember_id(request.getParameter("id"));
		memberBean.setMember_pass(request.getParameter("pass"));

		MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
		boolean isUpdateSuccess = memberUpdateProService.updatePass(memberBean);
		ActionForward forward = null;

		if (!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(true);
		}

		return forward;
	}

}
