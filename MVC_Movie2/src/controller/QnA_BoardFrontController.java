package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.QnA_BoardListAction;
import action.QnA_BoardWriteProAction;
import vo.ActionForward;

// 서블릿 주소가 XXX.bo 로 끝나는 주소들을 모두 매핑
// ex. BoardList.bo, BoardWriteForm.bo 등
@WebServlet("*.qb")
public class QnA_BoardFrontController extends HttpServlet {
    // GET 방식과 POST 방식을 모두 하나의 메서드로 처리하기 위해
    // doGet() 메서드와 doPost() 메서드에서 공통된 메서드인 doProcess() 메서드를 호출하도록 함
    // => doGet(), doPost() 는 오버라이딩하고, doProcess() 는 새로 정의(매개변수는 동일해야함)
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("BoardFrontController");
        
        // POST 방식일 때의 한글 처리
        request.setCharacterEncoding("UTF-8");
        
        String command = request.getServletPath(); // 위의 코드를 간략하게 축약(서블릿 주소 가져오기)
        
        // Action 인터페이스와 ActionForward 클래스의 참조변수 선언
        Action action = null;
        ActionForward forward = null;
        
        if(command.equals("/Main.qb")) { // 입력된 서블릿 주소가 /Main.bo 인지 판별
            forward = new ActionForward();
            forward.setPath("/main.jsp");
        } else if(command.equals("/BoardWriteForm.qb")) {
            forward = new ActionForward();
            forward.setPath("../QnA_Board/qna_board_write.jsp");
        } else if(command.equals("/BoardWritePro.qb")) {
            action = new QnA_BoardWriteProAction(); // Action 클래스 인스턴스 생성
            try {
                forward = action.execute(request, response);
                // => 포워딩 방식은 Action 클래스 내에서 결정하므로 아직 알 수 없다!
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardList.qb")) {
            action = new QnA_BoardListAction();
            
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
    
}
















