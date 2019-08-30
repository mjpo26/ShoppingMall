package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.QnA_BoardBean;

public class QnA_BoardDAO {

    private static QnA_BoardDAO instance;
    private QnA_BoardDAO() {}
    
    public static QnA_BoardDAO getInstance() {
        // 기존의 BoardDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new QnA_BoardDAO();
        }
        
        return instance;
    }

    Connection con;
    
    // Service 클래스로부터 Connection 객체 전달받는 메서드
    public void setConnection(Connection con) {
        this.con = con;
    }
    
    public int insertArticle(QnA_BoardBean article) throws Exception {
    	 PreparedStatement pstmt = null;
         ResultSet rs = null;
         int insertCount = 0;
         
         try {
         String sql = "SELECT MAX(Qna_num) FROM QnA_Board";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         int num = 1; // 게시물 번호 저장할 변수(기본값으로 1 지정)
         
         if(rs.next()) {
             // 기존 게시물이 존재할 경우(가장 큰 번호를 조회했을 경우)
             num = rs.getInt(1) + 1; // 가장 큰 번호 + 1 값(새로운 게시물 번호)을 저장
         } 
         
         // 게시물 등록 구문 작성(마지막 컬럼인 board_date 항목은 DB 현재 시각 정보 사용)
         sql = "INSERT INTO QnA_Board VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, num); // 게시물 번호(새로 계산한 번호 사용)
         // board_name, board_pass, board_subject, board_content, board_file - BoardBean 객체 값 사용
         pstmt.setString(2, article.getQna_subject());
         pstmt.setString(3, article.getQna_content());
         pstmt.setString(4, article.getQna_name());
         pstmt.setString(4, article.getQna_pass());
         pstmt.setInt(5, num);	// 참조 게시물 번호 = 새 글이므로 현재 게시물 번호로 설정
         pstmt.setString(6, article.getQna_file1());
         pstmt.setString(7, article.getQna_file2());
         pstmt.setString(8, article.getQna_file3());
         pstmt.setString(9, article.getQna_file4());
         pstmt.setString(10, article.getQna_file5());
         pstmt.setInt(11, 0);	// 들여쓰기 레벨 = 새 글이므로 0
         pstmt.setInt(12, 0);	// 글 순서번호 = 새 글이므로 0
         pstmt.setInt(13, 0);	// 조회수 = 새 글이므로 0
         insertCount = pstmt.executeUpdate(); // 글 등록 처리 결과를 int 형 값으로 리턴받음
         
     } catch (SQLException e) {
//         e.printStackTrace();
         System.out.println("insertArticle() 에러 - " + e.getMessage());
         
         // 만약, 외부로 예외를 던질 때 메세지를 직접 지정하고 싶을 경우 throw 키워드 사용하여
         // Exception 객체 생성 시 예외 메세지를 지정하면 된다! => throws 키워드로 예외 던지기 필요!
//         throw new Exception("insertArticle() 에러 - " + e.getMessage());
     } finally {
         // static import 문을 사용하여 JdbcUtil 클래스명 지정 필요없음
         close(rs);
         close(pstmt);
     }
     
     return insertCount;
 }

    public int selectListCount() {
    	 int listCount = 0; // 게시물 갯수를 저장하는 변수
         
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         try {
             String sql = "SELECT COUNT(*) FROM QnA_Board";
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             if(rs.next()) {
                 listCount = rs.getInt(1);
             }
             
         } catch (SQLException e) {
             System.out.println("selectListCount() 에러 - " + e.getMessage());
         } finally {
             // static import 문을 사용하여 JdbcUtil 클래스명 지정 필요없음
             close(rs);
             close(pstmt);
         }
         
         return listCount;
     }
    
	public ArrayList<QnA_BoardBean> selectArticleList(int page, int limit) {
		  PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        ArrayList<QnA_BoardBean> articleList = new ArrayList<QnA_BoardBean>();

	        int startRow = (page - 1) * 10; // 읽어올 목록의 첫 레코드 번호
	        
	        try {
	            // SELECT 구문 : board 테이블 데이터 전체 조회 
	            // => board_re_ref 기준 내림차순, board_re_seq 기준 오름차순
	            // => 전체 갯수가 아닌 시작 레코드 번호 ~ limit 갯수 만큼 읽어오기
	            String sql = "SELECT * FROM board ORDER BY board_re_ref DESC,board_re_seq ASC LIMIT ?,?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, startRow);
	            pstmt.setInt(2, limit);
	            rs = pstmt.executeQuery();
	            
	            // ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
	            // => 패스워드 제외
	            while(rs.next()) {
	                QnA_BoardBean qnA_BoardBean = new QnA_BoardBean();
	                qnA_BoardBean.setQna_num(rs.getInt("Qna_num"));
	                qnA_BoardBean.setQna_subject(rs.getString("Qna_subject"));
	                qnA_BoardBean.setQna_content(rs.getString("Qna_content"));
	                qnA_BoardBean.setQna_name(rs.getString("Qna_name"));
	                qnA_BoardBean.setQna_file1(rs.getString("Qna_file1"));
	                qnA_BoardBean.setQna_file2(rs.getString("Qna_file2"));
	                qnA_BoardBean.setQna_file3(rs.getString("Qna_file3"));
	                qnA_BoardBean.setQna_file4(rs.getString("Qna_file4"));
	                qnA_BoardBean.setQna_file5(rs.getString("Qna_file5"));
	                qnA_BoardBean.setQna_re_ref(rs.getInt("Qna_re_ref"));
	                qnA_BoardBean.setQna_re_lev(rs.getInt("Qna_re_lev"));
	                qnA_BoardBean.setQna_re_seq(rs.getInt("Qna_re_seq"));
	                qnA_BoardBean.setQna_readcount(rs.getInt("Qna_readcount"));
	                qnA_BoardBean.setQna_date(rs.getDate("Qna_date"));
	                
	                articleList.add(qnA_BoardBean);
	            }
	            
	        } catch (SQLException e) {
	            System.out.println("selectArticleList() 에러 - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        
	        
	        return articleList;
	    }
}
























