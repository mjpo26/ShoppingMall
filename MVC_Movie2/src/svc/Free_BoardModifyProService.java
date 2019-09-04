package svc;

import java.sql.Connection;

import dao.Free_BoardDAO;
import vo.Free_BoardBean;

import static db.JdbcUtil.*;

public class Free_BoardModifyProService {
    
    // 본인 확인을 위한 패스워드 비교
    // 글 번호와 패스워드 전달받음
    public boolean isArticleWriter(int free_num, String free_pass) throws Exception { 
        Connection con = getConnection();
        Free_BoardDAO boardDAO = Free_BoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        // 글 번호와 패스워드를 전달하여 본인 확인 후 결과 리턴
        boolean isArticleWriter = boardDAO.isArticleBoardWriter(free_num, free_pass);
        
        close(con);
        return isArticleWriter;
    }

    // 글 수정
    public boolean modifyArticle(Free_BoardBean article) throws Exception {
        Connection con = getConnection();
        Free_BoardDAO boardDAO = Free_BoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        boolean isModifySuccess = false;
        // 수정할 내용 전달하여 수정 후 결과 리턴
        int updateCount = boardDAO.isUpdateArticle(article);

        // updateCount 가 1이면 성공이므로 commit(), isModifySuccess = true 변경
        //        ""      0이면 실패이므로 rollback() 수행
        if(updateCount == 1) {
            commit(con);
            isModifySuccess = true;
        } else {
            rollback(con);
        }
        
        close(con);
        return isModifySuccess;
    }
    
}





















