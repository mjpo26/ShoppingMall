package svc;

import vo.ReviewBoardBean;
import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.ReviewBoardDAO;

public class ReviewBoardModifyProService {

	public boolean isArticleWriter(int review_num, String review_pass) throws Exception { 
        Connection con = getConnection();
        ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        boolean isArticleWriter = boardDAO.isArticleBoardWriter(review_num, review_pass);
        
        close(con);
        return isArticleWriter;
    }


    public boolean modifyArticle(ReviewBoardBean article) throws Exception {
        Connection con = getConnection();
        ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        boolean isModifySuccess = false;

        int updateCount = boardDAO.isUpdateArticle(article);

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
