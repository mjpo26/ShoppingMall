package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MovieDAO;
import vo.MovieBean;

public class MemberReservationInfoService {
    
    public ArrayList getReservationList(String member_id) {
        System.out.println("MemberReservationInfoService");
        Connection con = getConnection();
        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.setConnection(con);
        
        ArrayList reservationList = movieDAO.selectReservationList(member_id);
        
        close(con);
        
        return reservationList;
    }
    
}



















