package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MovieDAO;
import vo.MovieBean;

public class MovieInfoDetailProService {
    
    public MovieBean getMovieInfo(int movie_idx) {
//        System.out.println("MovieInfoDetailProService");
        Connection con = getConnection();
        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.setConnection(con);
        
        // MovieDAO 객체의 getovieInfo() 메서드를 호출하여 영화 상세 정보 조회(영화번호 전달)
        MovieBean movieBean = movieDAO.getMovieInfo(movie_idx);
        
        close(con);
        
        return movieBean;
    }
    
}



















