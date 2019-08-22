package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MovieDAO;
import vo.MovieBean;

public class MovieListService {
    
    public ArrayList<MovieBean> getMovieList(String listType, String sort) {
//        System.out.println("MovieListService");
        Connection con = getConnection();
        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.setConnection(con);
        
        ArrayList<MovieBean> movieList = movieDAO.getMovieList(listType, sort);
        
        close(con);
        
        return movieList;
    }
    
}



















