package svc;

import java.sql.Connection;

import dao.QnA_BoardDAO;
import vo.QnA_BoardBean;

import static db.JdbcUtil.*;

public class QnA_BoardDetailService {
    // 글 내용 보기 요청을 처리하는 비즈니스 로직 - getArticle() 메서드 정의
    public QnA_BoardBean getArticle(int QnA_num) throws Exception {
        // Connection 객체 가져오기 - getConnection()
       
        System.out.println("BoardDetialService is Connected");
        
        Connection con = getConnection();
        
        // BoardDAO 객체 가져오기 - getInstance()
        QnA_BoardDAO boardDAO = QnA_BoardDAO.getInstance();
        
        // Connection 객체 -> BoardDAO 에 전달 - setConnection()
        boardDAO.setConnection(con);
        
        // BoardDAO 객체의 selectArticle() 메서드를 호출하여 글 상세 내용(BoardBean 객체) 리턴받기
        QnA_BoardBean article = boardDAO.selectArticle(QnA_num);
        
        
        // 조회수 증가
        int updateCount = boardDAO.updateReadcount(QnA_num);
        
        if(updateCount > 0) {
            commit(con);
        } else {
            rollback(con);
        }
        
        // Connection 객체 반환
        close(con);
        
        // BoardBean 객체 리턴
        return article;
    }
    
}
















