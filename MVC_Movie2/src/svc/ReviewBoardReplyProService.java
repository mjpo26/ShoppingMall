package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewBoardDAO;
import vo.ReviewBoardBean;

public class ReviewBoardReplyProService {

	public boolean replyArticle(ReviewBoardBean article)  throws Exception {
        boolean isReplySuccess = false;
        
        // 객체 가져오기
        Connection con = getConnection();
        ReviewBoardDAO dao = ReviewBoardDAO.getInstance();
        dao.setConnection(con); // DAO 객체에 Connection 객체 전달
        
        System.out.println("BoardReply번호 참조"+article.getReview_re_ref());
        // BoardDAO 객체의 insertReplyArticle() 메서드를 호출하여 답글 등록 => 정수형 결과 insertCount 리턴받음
        int insertCount = dao.insertReplyArticle(article);
        
        // insertCount 가 0보다 크면 commit(), replySuccess 변수를 true 로 지정
        // 아니면 rollback() 수행
        if(insertCount > 0) {
            commit(con);
            isReplySuccess = true;
        } else {
            rollback(con);
        }
        
        // Connection 자원 반환
        close(con);
        
        // replySuccess 변수값 리턴
        return isReplySuccess;
        
        
    }

}
