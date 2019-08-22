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

public class MovieInfoDetailProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("MovieInfoDetailProAction");
        
        // 파라미터로 전달된 영화 번호(idx) 가져오기
        int movie_idx = Integer.parseInt(request.getParameter("movie_idx"));
        
        // 영화 상세정보 조회하기 위한 MovieInfoDetailProService 객체 생성 및 조회 요청(영화 번호 전달)
        MovieInfoDetailProService movieInfoDetailProService = new MovieInfoDetailProService();
        MovieBean movieBean = movieInfoDetailProService.getMovieInfo(movie_idx);
        
        // 영화 상세 정보 객체를 request 객체에 저장
        request.setAttribute("movieBean", movieBean);
        
        // 최근 조회한 영화 정보를 표시하기 위한 쿠키 생성
        // => 쿠키 이름은 today + 영화번호 로 설정, 쿠키 값은 영화제목(실제는 이미지파일명)으로 설정
        // => 주의사항! 쿠키에 한글 등의 문자를 사용해야할 경우 정상적으로 인식되지 않아 오류 발생할 수 있음
        //    따라서, URLEncoder 클래스의 encode() 메서드로 인코딩 필요
        //    URLEncoder.encode(인코딩할 데이터, 인코딩방식) 형태로 지정하며
        //    한글 인코딩 방식은 대표적으로 "UTF-8"(주로 사용) 또는 "EUC-KR" 사용
        //    => 반대로, 인코딩 된 한글 쿠키를 읽어올 경우 
        //       URLDecoder.decode(디코딩할 데이터, 디코딩 방식) 형태로 사용 
        Cookie todayMovieCookie = new Cookie("today" + movie_idx, URLEncoder.encode(movieBean.getMovie_title(), "UTF-8"));
        todayMovieCookie.setMaxAge(60 * 60 * 24); // 쿠키 유지시간 설정(1일)
        // response 객체에 쿠키 저장
        response.addCookie(todayMovieCookie);
        
        // movie 디렉토리의 movie_info_detail.jsp 페이지로 포워딩
        ActionForward forward = new ActionForward();
        forward.setPath("/movie/movie_info_detail.jsp");
        forward.setRedirect(false);
        
        return forward;
        
    }

}















