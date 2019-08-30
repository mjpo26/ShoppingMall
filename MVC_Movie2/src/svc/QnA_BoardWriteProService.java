package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.QnA_BoardDAO;
import db.JdbcUtil;
import vo.QnA_BoardBean;

public class QnA_BoardWriteProService {

	public boolean registArticle(QnA_BoardBean qnA_BoardBean) throws Exception {
		
		boolean isWriteSuccess = false; // 글쓰기 성공/실패 여부 저장 변수
		
		Connection con = JdbcUtil.getConnection();
	    QnA_BoardDAO dao = QnA_BoardDAO.getInstance();
	    dao.setConnection(con);
	    
	    int insertCount = dao.insertArticle(qnA_BoardBean);
		
	    // insertCount 가 1 이면 글 등록 성공이므로 commit() 실행 및 isWriteSuccess 를 true 로 설정
        // 아니면 rollback() 실행
        if(insertCount == 1) {
            con.commit();
            isWriteSuccess = true;
        } else {
            con.rollback();
        }
        
        // Connection 객체 반환
        JdbcUtil.close(con);
        
        return isWriteSuccess;
    }
}


















