package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MovieDAO;
import vo.MovieReservationBean;

public class MovieReservationProService {

    public boolean addReservation(MovieReservationBean movieReservationBean) {
//        System.out.println("MovieReservationProService");
        
        Connection con = getConnection();
        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.setConnection(con);
        
        boolean isReservationSuccess = false;
        
        // 예매 정보 저장 위해 MovieReservationBean 객체 전달 후 int형 타입으로 결과 리턴
        int count = movieDAO.insertReservation(movieReservationBean);
        
        // 리턴받은 값이 1이면 예매 성공 => commit(), boolean 타입 변수 true 로 변경
        //       ""      0이면 예매 실패 => rollback()
        if(count > 0) {
            commit(con);
            isReservationSuccess = true;
        } else {
            rollback(con);
        }
        
        close(con);
        
        return isReservationSuccess;
        
    }
    
}

















