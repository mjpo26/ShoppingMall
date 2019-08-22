package action;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.MemberLoginProService;
import svc.MovieInfoDetailProService;
import svc.MovieListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.MovieBean;

public class MovieReservationAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("MovieReservationAction");
        
        // 실제로는 영화 정보, 상영관 정보, 상영 회차 및 시간 정보 등 가져와서 함께 전달해야하지만
        // 지금은 모두 생략하고 바로 뷰 페이지로 포워딩
        
        // movie 디렉토리의 movie_reservation_form.jsp 페이지로 포워딩
        ActionForward forward = new ActionForward();
        forward.setPath("/movie/movie_reservation_form.jsp");
        forward.setRedirect(false);
        
        return forward;
        
    }

}















