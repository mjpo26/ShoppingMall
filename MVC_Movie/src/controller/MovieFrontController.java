package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MovieInfoDetailProAction;
import action.MovieListAction;
import action.MovieReservationAction;
import action.MovieReservationProAction;
import vo.ActionForward;

@WebServlet("*.mo")
public class MovieFrontController extends HttpServlet {
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 한글 설정
        
        // 서블릿 주소 가져오기
        String command = request.getServletPath();
        
        Action action = null;
        ActionForward forward = null;
        
        if(command.equals("/MovieList.mo")) {
            action = new MovieListAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MovieInfoDetail.mo")) {
            action = new MovieInfoDetailProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MovieReservation.mo")) {
            action = new MovieReservationAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MovieReservationPro.mo")) {
            action = new MovieReservationProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MovieReservationResult.mo")) {
            forward = new ActionForward();
            forward.setPath("/movie/movie_reservation_result.jsp");
        }
        
        // 포워딩 처리
        if(forward != null) {
            // ActionForward 객체의 isRedirect() 메서드가 true 이면 Redirect 방식으로 포워딩
            //                        ""                  false 이면 Dispatcher 방식으로 포워딩
            if(forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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
