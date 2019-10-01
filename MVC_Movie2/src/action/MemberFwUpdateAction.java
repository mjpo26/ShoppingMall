package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFwUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;

		HttpSession session = request.getSession();
		String id = (String)request.getParameter("fid");
		System.out.println("여기아이디"+id);
		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다!')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		} else {
			MemberInfoService memberInfoService = new MemberInfoService();
			MemberBean memberBean = memberInfoService.getMemberInfo(id); // 세션 아이디값을 파라미터로 전달

			if (memberBean != null) {
				// 조회된 회원정보(MemberBean)를 request 객체에 저장
				request.setAttribute("memberBean", memberBean);

				forward = new ActionForward();
				forward.setPath("/member/pw_update.jsp");
//	                forward.setPath("/member/memberInfo.jsp");
				forward.setRedirect(false);
			}

		}

		return forward;

	}

}
