package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import svc.MemberIdCheckService;
import svc.MemberInfoService;
import svc.MemberJoinProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberIDFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession(); // 현재 세션 가져오기

		String name = request.getParameter("member_name");
		String email = request.getParameter("email") + "@" + request.getParameter("domain");

		System.out.println(name);
		System.out.println(email);
		MemberIdCheckService memberIdcheckService = new MemberIdCheckService();
		MemberBean memberBean = memberIdcheckService.findID(name, email);
		String authNum = memberIdcheckService.authNum();
		System.out.println("난수느ㅡ으ㅡ은 발생되엇나역여여거!!!!" + authNum);
		boolean result = memberIdcheckService.checkEmail(email, authNum);
		System.out.println(result);

		if (result == true) {
			request.setAttribute("memberBean", memberBean);
			request.setAttribute("authNum", authNum);
			forward = new ActionForward();
			// forward.setPath("./idcheck.jsp");
			forward.setPath("./member/id_findpro.jsp");
			forward.setRedirect(false);

			return forward;
		} else {
			
			request.setAttribute("memberBean", memberBean);
			forward = new ActionForward();
			// forward.setPath("./idcheck.jsp");
			forward.setPath("./member/id_find.jsp");
			forward.setRedirect(false);

			return forward;
		}
	}

}