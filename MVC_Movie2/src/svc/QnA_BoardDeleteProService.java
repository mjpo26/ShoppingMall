package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QnA_BoardDAO;

public class QnA_BoardDeleteProService {

    // 게시물 패스워드 확인
    public boolean isArticleWriter(int QnA_num, String QnA_pass) throws Exception {
        boolean isArticleWriter = false;
        
        // 객체 가져오기
        Connection con = getConnection();
        QnA_BoardDAO boardDAO = QnA_BoardDAO.getInstance();
        boardDAO.setConnection(con); // DAO 객체에 Connection 객체 전달
        
        // BoardDAO 객체의 isArticleBoardWriter() 메서드를 호출하여 패스워드 확인
        isArticleWriter = boardDAO.isArticleBoardWriter(QnA_num, QnA_pass);
        
        close(con);
        
        return isArticleWriter;
    }

    // 글 번호를 전달받아 게시물 삭제(본인 확인 완료된 상태)
    public boolean removeArticle(int QnA_num) throws Exception {
        boolean isRemoveSuccess = false; // 게시물 삭제 결과 저장할 변수
        
        Connection con = getConnection();
        QnA_BoardDAO boardDAO = QnA_BoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        // BoardDAO 객체의 deleteArticle() 메서드를 호출하여 글 번호(QnA_num)를 전달
        // => 게시물 삭제 결과를 정수형으로 리턴받아 성공 여부 판별
        int deleteCount = boardDAO.deleteArticle(QnA_num);
        
        if(deleteCount > 0) { // 삭제 성공했을 경우
            commit(con);
            isRemoveSuccess = true;
        } else { // 삭제 실패했을 경우
            rollback(con);
        }
        
        close(con);
        
        return isRemoveSuccess;
    }
    
    

}
















