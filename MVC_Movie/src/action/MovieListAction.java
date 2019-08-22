package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.MemberLoginProService;
import svc.MovieListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.MovieBean;

public class MovieListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("MovieListAction");
        
        // 정렬 방식 파라미터(sort)값 가져오기
        String sort = "";
        
        if(request.getParameter("sort") != null) {
            sort = request.getParameter("sort");
        }
        
        // 목록 종류(현재 상영중 or 개봉 예정) 파라미터(listType)값 가져오기
        String listType = "";
        
        if(request.getParameter("listType") != null) {
            listType = request.getParameter("listType");
        }
        
        // 영화 목록 조회하기 위한 MovieListService 객체 생성 및 조회 요청(목록 종류, 정렬 방식 전달)
        MovieListService movieListService = new MovieListService();
        ArrayList<MovieBean> movieList = movieListService.getMovieList(listType, sort);
        
        
        // 저장되어 있는 쿠키 정보를 가져와서 ArrayList 객체로 생성
        Cookie[] cookies = request.getCookies(); // 저장된 모든 쿠키를 배열로 가져오기
        
        // 쿠키를 저장할 ArrayList 객체 생성
        ArrayList<String> todayMovieList = new ArrayList<String>(); // 영화 제목 저장할 객체
        ArrayList<String> todayMovieIndexList = new ArrayList<String>(); // 영화 번호 저장할 객체
        
        // 쿠키 배열이 비어있지 않으면 쿠키 내의 todayXXX 에 해당하는 쿠키 모두 가져와서 ArrayList 에 저장
        if(cookies != null) {
            for(int i = 0; i < cookies.length; i++) {
                // 쿠키의 이름이 "today"로 시작하는 문자열을 가진 쿠키일 때
                if(cookies[i].getName().startsWith("today")) {
                    todayMovieList.add(cookies[i].getValue()); // 쿠키 값 ArrayList 객체에 저장
                    
                    // 쿠키 이름에서 "today" 를 제외한 나머지를 추출 후 todayMovieIndexList 객체에 저장
                    todayMovieIndexList.add(cookies[i].getName().substring("today".length()));
                }
            }
        }
        
//        System.out.println("인덱스 번호 : " + todayMovieIndexList);
        
        // 영화 목록 정보, 종류, 정렬 방식을 request 객체에 저장
        request.setAttribute("movieList", movieList);
        request.setAttribute("listType", listType);
        request.setAttribute("sort", sort);
        
        // 쿠키 정보를 담은 ArrayList 객체도 request 객체에 저장
        request.setAttribute("todayMovieList", todayMovieList);
        request.setAttribute("todayMovieIndexList", todayMovieIndexList);
        
        // movie 디렉토리의 movie_list.jsp 페이지로 포워딩
        ActionForward forward = new ActionForward();
        forward.setPath("/movie/movie_list.jsp");
        forward.setRedirect(false);
        
        return forward;
        
    }

}















