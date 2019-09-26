package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.EventBoardDetailAction;
import action.EventBoardListAction;
import action.EventBoardWriteProAction;
import action.ProductInsertProAction;
import action.ReviewBoardDetailAction;
import action.ReviewBoardListAction;
import action.ReviewBoardWriteFormAction;
import vo.ActionForward;

@WebServlet("*.event")
public class EventBoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		Action action = null;
		ActionForward forward = null;

		if (command.equals("/EventBoardWriteForm.event")) {
			System.out.println("이벤트글폼!!!!!!!");
			forward = new ActionForward();
			forward.setPath("/admin/admin_event.jsp");
		}
		else if(command.equals("/EventBoardWritePro.event")) {
            action = new EventBoardWriteProAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
		else if (command.equals("/EventBoardList.event")) {
			System.out.println("이벤ㅌㅡㅡㅡ컨트롤 들어옴");
			action = new EventBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/EventBoardDetail.event")) {
			action = new EventBoardDetailAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        if(forward != null) { // 예외 발생 시를 제외한 나머지(ActionForward 객체가 null 이 아닐 때)
            
            // Redirect or Dispatcher 방식 판별
            if(forward.isRedirect()) { // Redirect 방식일 경우
                response.sendRedirect(forward.getPath()); // 지정된 주소로 리다이렉트 방식 포워딩
            } else { // Dispatcher 방식일 경우
                // request 객체로부터 Dispatcher 객체를 가져오기(매개변수로 포워딩 주소 전달)
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                // Dispatcher 객체의 forward() 메서드 호출하여 포워딩(매개변수로 request, response 객체 전달)
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
