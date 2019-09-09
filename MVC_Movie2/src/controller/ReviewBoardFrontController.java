package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.Free_BoardDeleteProAction;
import action.Free_BoardModifyFormAction;
import action.Free_BoardReplyFormAction;
import action.ReviewBoardDeleteProAction;
import action.ReviewBoardDetailAction;
import action.ReviewBoardListAction;
import action.ReviewBoardModifyFormAction;
import action.ReviewBoardModifyProAction;
import action.ReviewBoardReplyFormAction;
import action.ReviewBoardReplyProAction;
import action.ReviewBoardWriteProAction;
import vo.ActionForward;

@WebServlet("*.re")
public class ReviewBoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		Action action = null;
		ActionForward forward = null;

		if (command.equals("/ReviewMain.re")) {
			// forward = new ActionForward();
			// forward.setPath("/reviewBoard/list.jsp");
		} else if (command.equals("/ReviewBoardWriteForm.re")) {
			forward = new ActionForward();
			forward.setPath("/reviewBoard/write.jsp");
		} else if (command.equals("/ReviewBoardWritePro.re")) {
			System.out.println("writePro");
			action = new ReviewBoardWriteProAction();
			try {
				forward = action.execute(request, response);
				// => 포워딩 방식은 Action 클래스 내에서 결정하므로 아직 알 수 없다!
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardList.re")) {
			System.out.println("컨트롤 들어옴");
			action = new ReviewBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardDetail.re")) {
			action = new ReviewBoardDetailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardModifyForm.re")) {
			System.out.println("modifyForm");
			action = new ReviewBoardModifyFormAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardModifyPro.re")) {
			System.out.println("modifyPro");
			action = new ReviewBoardModifyProAction();
			try {
				forward = action.execute(request, response);
				// => 포워딩 방식은 Action 클래스 내에서 결정하므로 아직 알 수 없다!
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardDeleteForm.re")) {
			System.out.println("deleteForm들어와용");
			forward = new ActionForward();
			forward.setPath("/reviewBoard/delete.jsp");
		} else if (command.equals("/ReviewBoardDeletePro.re")) {
			action = new ReviewBoardDeleteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardReplyForm.re")) {
			System.out.println("ReviewBoardReplyForm들어와용");
			action = new ReviewBoardReplyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ReviewBoardReplyPro.re")) {
			System.out.println("답글 pro");
			action = new ReviewBoardReplyProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (forward != null) {
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
