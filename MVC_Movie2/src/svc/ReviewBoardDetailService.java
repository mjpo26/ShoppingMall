package svc;

import vo.ReviewBoardBean;
import dao.ReviewBoardDAO;
import static db.JdbcUtil.*;
import java.sql.Connection;

public class ReviewBoardDetailService {
	public ReviewBoardBean getArticle(int review_num) throws Exception {
		Connection con = getConnection();
		// BoardDAO 객체 가져오기
		ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();

		// BoardDAO 객체에 Connection 객체 전달하기
		boardDAO.setConnection(con);
		
		ReviewBoardBean article= boardDAO.selectArticle(review_num);
		
		int updateCount=boardDAO.updateReadCount(review_num);
		
		if(updateCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
	    
		return article;
	}
}
