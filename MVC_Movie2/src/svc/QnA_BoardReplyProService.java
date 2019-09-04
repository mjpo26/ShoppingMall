package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.QnA_BoardDAO;
import vo.QnA_BoardBean;

public class QnA_BoardReplyProService {
    
    // 답변글 등록 - replyArticle() => 성공 여부를 boolean 타입으로 리턴
    public boolean replyArticle(QnA_BoardBean article) throws Exception {
        boolean isReplySuccess = false;
        
        // 객체 가져오기
        Connection con = getConnection();
        QnA_BoardDAO dao = QnA_BoardDAO.getInstance();
        dao.setConnection(con); // DAO 객체에 Connection 객체 전달
        
        System.out.println("BoardReply번호 참조"+article.getQnA_re_ref());
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
