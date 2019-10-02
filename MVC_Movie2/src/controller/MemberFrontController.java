package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import action.AdminBoardListAction;
import action.Admin_memberListAction;
import action.MemberDeleteProAction;
import action.MemberFwFindAction;
import action.MemberFwUpdateAction;
import action.MemberIDFindAction;
import action.MemberIdCheckAction;
import action.MemberInfoAction;
import action.MemberJoinProAction;
import action.MemberLoginProAction;
import action.MemberLogoutProAction;
import action.MemberPointUpdateProAction;
import action.MemberPwUpdateProAction;
import action.MemberUpdateAction;
import action.MemberUpdateProAction;
import action.MemberUsercheckAction;
import action.MemberdeleteAction;
import action.MemberdeleteAdminAction;
import vo.ActionForward;


@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 설정

		// 서블릿 주소 가져오기
		String command = request.getServletPath();

		Action action = null;
		ActionForward forward = null;

		if (command.equals("/MemberLoginForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/loginForm.jsp");
		} else if (command.equals("/MemberJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/joinForm.jsp");
		} else if (command.equals("/MemberfindPw.me")) {
			forward = new ActionForward();
			forward.setPath("/member/pw_find.jsp");
		} else if (command.equals("/MemberIDfind.me")) {
			forward = new ActionForward();
			forward.setPath("/member/id_find.jsp");
		} else if (command.equals("/MemberLoginPro.me")) {
			action = new MemberLoginProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUsercheck.me")) {
			action = new MemberUsercheckAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberLogoutPro.me")) {
			action = new MemberLogoutProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberJoinPro.me")) {
			action = new MemberJoinProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberInfo.me")) {
			action = new MemberInfoAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberDeletePro.me")) {
			action = new MemberDeleteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdatePro.me")) {
			action = new MemberUpdateProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdate.me")) {
			action = new MemberUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberPointUpdate.me")) {
			action = new MemberPointUpdateProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/MemberIdCheck.me")) {
			action = new MemberIdCheckAction();
			JSONObject json = (JSONObject) request.getAttribute("json");
			request.setAttribute("json", json);
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberFwfind.me")) {
			action = new MemberFwFindAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberFwUpdate.me")) {
			System.out.println("여기안오납 ??");
			action = new MemberFwUpdateAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/MemberPwUpdatePro.me")) {
			System.out.println("여긴오니? ??");
			action = new MemberPwUpdateProAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/MemberfindID.me")) {
			action = new MemberIDFindAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/Admin_memberList.me")) {
			System.out.println("Admin_memberList controller 들어옴");
			action = new Admin_memberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminBoardList.me")) {
			System.out.println("adminBoardList controller 들어옴");
			action = new AdminBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/deleteMember.me")) {
			action = new MemberdeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/deletePro.me")) {
			action = new MemberDeleteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/deleteMemberAdmin.me")) {
			action = new MemberdeleteAdminAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		// 포워딩 처리
		if (forward != null) {
			// ActionForward 객체의 isRedirect() 메서드가 true 이면 Redirect 방식으로 포워딩
			// "" false 이면 Dispatcher 방식으로 포워딩
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}