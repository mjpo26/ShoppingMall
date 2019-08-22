package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MovieBean;
import vo.MovieReservationBean;

public class MovieDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static MovieDAO instance;
    private MovieDAO() {}
    
    public static MovieDAO getInstance() {
        // 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new MovieDAO();
        }
        
        return instance;
    }
    // -----------------------------------------------------

    Connection con;
    
    public void setConnection(Connection con) {
        this.con = con;
    }

    // 영화 목록 조회
    public ArrayList<MovieBean> getMovieList(String listType, String sort) {
        ArrayList<MovieBean> movieList = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        // 전체 영화 목록 조회(실제로는 사용하지 X)
        String sql = "";
        
        if(listType.equals("") || listType.equals("now")) {
            // WHERE 절을 사용하여 현재 날짜가 포함된 범위 내의 데이터 검색
            if(sort.equals("")) { // 기본 정렬 방식일 경우(실제로는 인기순으로 정렬)
                sql = "SELECT * FROM movie_info WHERE movie_start_day<=now() AND movie_end_day>=now()";
            } else if(sort.equals("title")) {
                sql = "SELECT * FROM movie_info WHERE movie_start_day<=now() AND movie_end_day>=now() ORDER BY movie_title ASC";
            } else if(sort.equals("date")) {
                sql = "SELECT * FROM movie_info WHERE movie_start_day<=now() AND movie_end_day>=now() ORDER BY movie_start_day DESC";
            }
        } else if(listType.equals("soon")) {
            // WHERE 절을 사용하여 현재 날짜보다 개봉일이 늦은(큰) 데이터 검색
            if(sort.equals("")) { // 기본 정렬 방식일 경우(실제로는 인기순으로 정렬)
                sql = "SELECT * FROM movie_info WHERE movie_start_day>now()";
            } else if(sort.equals("title")) {
                sql = "SELECT * FROM movie_info WHERE movie_start_day>now() ORDER BY movie_title ASC";
            } else if(sort.equals("date")) {
                sql = "SELECT * FROM movie_info WHERE movie_start_day>now() ORDER BY movie_start_day DESC";
            }
        }
        
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            movieList = new ArrayList<MovieBean>();
            
            while(rs.next()) {
                MovieBean movieBean = new MovieBean();
                movieBean.setMovie_idx(rs.getInt("movie_idx"));
                movieBean.setMovie_title(rs.getString("movie_title"));
                movieBean.setMovie_content(rs.getString("movie_content"));
                movieBean.setMovie_time(rs.getInt("movie_time"));
                movieBean.setMovie_hall_num(rs.getInt("movie_hall_num"));
                movieBean.setMovie_start_day(rs.getDate("movie_start_day"));
                movieBean.setMovie_end_day(rs.getDate("movie_end_day"));
                
                movieList.add(movieBean);
                
//                System.out.println(movieBean.getMovie_idx());
//                System.out.println(movieBean.getMovie_title());
//                System.out.println(movieBean.getMovie_content());
//                System.out.println(movieBean.getMovie_time());
//                System.out.println(movieBean.getMovie_hall_num());
//                System.out.println(movieBean.getMovie_start_day());
//                System.out.println(movieBean.getMovie_end_day());
//                System.out.println("---------------------------");
                
            }
            
        } catch (SQLException e) {
            System.out.println("getMovieList 에러! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        
        return movieList;
    }
    
    
    // 영화 상세 정보 조회
    public MovieBean getMovieInfo(int movie_idx) {
        MovieBean movieBean = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        // movie_idx 에 해당하는 영화 상세 정보 조회
        String sql = "SELECT * FROM movie_info WHERE movie_idx=?";
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, movie_idx);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                movieBean = new MovieBean();
                movieBean.setMovie_idx(rs.getInt("movie_idx"));
                movieBean.setMovie_title(rs.getString("movie_title"));
                movieBean.setMovie_content(rs.getString("movie_content"));
                movieBean.setMovie_time(rs.getInt("movie_time"));
                movieBean.setMovie_hall_num(rs.getInt("movie_hall_num"));
                movieBean.setMovie_start_day(rs.getDate("movie_start_day"));
                movieBean.setMovie_end_day(rs.getDate("movie_end_day"));
            }
            
        } catch (SQLException e) {
            System.out.println("getMovieInfo 에러! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        
        return movieBean;
    }
    
    // 영화 예매
    public int insertReservation(MovieReservationBean movieReservationBean) {
        int count = 0;
        
        PreparedStatement pstmt = null;
        
        // 영화번호, 아이디, 영화시간, 인원수, 예매금액 DB에 저장
        String sql = "INSERT INTO movie_reservation_info VALUES (null,?,?,?,?,?)";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, movieReservationBean.getMovie_idx());
            pstmt.setString(2, movieReservationBean.getMember_id());
            pstmt.setString(3, movieReservationBean.getMovie_time());
            pstmt.setInt(4, movieReservationBean.getMovie_people_count());
            pstmt.setInt(5, movieReservationBean.getPee());
            count = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("insertReservation 에러! - " + e.getMessage());
        }
        
        return count;
    }


		//다른 테이블들에서 불러와서 사용 
		//[movie_info: 영화제목, 상영관번호] [reservation_info:상영시각,예매인원,결제금액]순으로
		//따로따로 불러서 ArrayList에 넣음. Join을 사용하지않고.
//	    public ArrayList selectReservationList(String member_id) {
//	        // [movie_info : 영화제목, 상영관번호] [reservation_info : 상영시각, 예매인원, 결제금액] 순으로 
//	        // ArrayList 객체에 추가
//	        // => member_id 를 사용하여 영화번호(movie_idx), 상영시각(movie_time), 예매인원(movie_people_count),
//	        //    결제금액(pee) 를 조회한 후, 영화번호(movie_idx) 에 해당하는 
//	        //    영화제목(movie_title), 상영관번호(movie_hall_num) 를 따로 조회하여 합치기
//	        
//	        
//	        ArrayList reservationList = null;
//	        
//	        PreparedStatement pstmt = null;
//	        ResultSet rs = null;
//	        
//	        String sql = "SELECT movie_idx,movie_time,movie_people_count,pee "
//	                        + "FROM movie_reservation_info WHERE member_id=?";
//	        try {
//	            pstmt = con.prepareStatement(sql);
//	            pstmt.setString(1, member_id);
//	            rs = pstmt.executeQuery();
//	            
//	            int movie_idx = 0;
//	            String movie_time = "";
//	            int movie_people_count = 0;
//	            int pee = 0;
//	            String movie_title = "";
//	            int movie_hall_num = 0;
//	            
//	            reservationList = new ArrayList();
//	            
//	            while(rs.next()) {
//	                ArrayList reservationInfo = new ArrayList();
//	                movie_idx = rs.getInt("movie_idx");
//	                movie_time = rs.getString("movie_time");
//	                movie_people_count = rs.getInt("movie_people_count");
//	                pee = rs.getInt("pee");
//	                
//	                sql = "SELECT movie_title,movie_hall_num FROM movie_info WHERE movie_idx=?";
//	                PreparedStatement pstmt2 = con.prepareStatement(sql);
//	                pstmt2.setInt(1, movie_idx);
//	                ResultSet rs2 = pstmt2.executeQuery();
//	                
//	                if(rs2.next()) {
//	                    movie_title = rs2.getString("movie_title");
//	                    movie_hall_num = rs2.getInt("movie_hall_num");
//	                }
//	                
//	                reservationInfo.add(movie_title);
//	                reservationInfo.add(movie_hall_num);
//	                reservationInfo.add(movie_time);
//	                reservationInfo.add(movie_people_count);
//	                reservationInfo.add(pee);
//	                
//	                reservationList.add(reservationInfo);
//	                
//	                close(rs2);
//	                close(pstmt2);
//	            }
//	            
//	        } catch (SQLException e) {
//	            System.out.println("selectReservationList 에러! - " + e.getMessage());
//	        } finally {
//	            close(rs);
//	            close(pstmt);
//	        }
//	        
//	        
//	        return reservationList;
//	    }
    public ArrayList selectReservationList(String member_id) {
        // [movie_info : 영화제목, 상영관번호] [reservation_info : 상영시각, 예매인원, 결제금액] 순으로 
        // ArrayList 객체에 추가 => Inner Join 사용하여 한 번에 조회
        ArrayList reservationList = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT movie_title,movie_hall_num,movie_reservation_info.movie_time,movie_people_count,pee,movie_reservation_info.movie_idx " + 
                "FROM movie_info JOIN movie_reservation_info " + 
                "ON movie_info.movie_idx = movie_reservation_info.movie_idx " + 
                "WHERE member_id=?";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            
            reservationList = new ArrayList();
            
            while(rs.next()) {
                ArrayList reservationInfo = new ArrayList(); // 영화 1개의 예약 정보를 저장할 ArrayList
                reservationInfo.add(rs.getString("movie_title"));
                reservationInfo.add(rs.getInt("movie_hall_num"));
                reservationInfo.add(rs.getString("movie_time"));
                reservationInfo.add(rs.getInt("movie_people_count"));
                reservationInfo.add(rs.getInt("pee"));
                reservationInfo.add(rs.getInt("movie_idx"));
                
                reservationList.add(reservationInfo);
            }
            
        } catch (SQLException e) {
            System.out.println("selectReservationList 에러! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return reservationList;
    }
    
}















