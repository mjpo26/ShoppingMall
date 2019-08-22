package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MovieReservationProService;
import vo.ActionForward;
import vo.MovieReservationBean;

public class MovieReservationProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("MovieReservationProAction");
        
        // 전달받은 파라미터 가져오기
        int movie_idx = Integer.parseInt(request.getParameter("movie_idx"));
        String reservationTime = request.getParameter("reservationTime");
        int numOfPeople = Integer.parseInt(request.getParameter("numOfPeople"));
        int pee = Integer.parseInt(request.getParameter("pee"));
        
        // 세션 아이디 가져오기
        HttpSession session = request.getSession();
        String sId = (String)session.getAttribute("sId");
        
//        System.out.println("영화 번호 : " + movie_idx);
//        System.out.println("영화 시간 : " + reservationTime);
//        System.out.println("예매 인원 : " + numOfPeople);
//        System.out.println("총 금액: " + pee);
        
        // MovieReservationBean 객체 생성 후 가져온 파라미터값 저장
        MovieReservationBean movieReservationBean = new MovieReservationBean();
        movieReservationBean.setMovie_idx(movie_idx);
        movieReservationBean.setMovie_time(reservationTime);
        movieReservationBean.setMovie_people_count(numOfPeople);
        movieReservationBean.setPee(pee);
        movieReservationBean.setMember_id(sId);
        
        MovieReservationProService movieReservationProService = new MovieReservationProService();
        boolean isReservationSuccess = movieReservationProService.addReservation(movieReservationBean);
        
        ActionForward forward = null;
        
        // 작업 실패(false) 시 "영화 예매 실패" 메세지 출력 후 이전 페이지로 이동
        if(!isReservationSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('영화 예매 실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else {
            // 작업 성공(true) 시 MovieReservationResult.mo 페이지(/movie_reservation_result.jsp)로 포워딩
            forward = new ActionForward();
            forward.setPath("MovieReservationResult.mo");
            forward.setRedirect(true);
        }
        
        return forward;
        
    }

}















