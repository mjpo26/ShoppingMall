package svc;

import vo.ReviewBoardBean;
import dao.ReviewBoardDAO;
import db.JdbcUtil;

import static db.JdbcUtil.*;
import java.sql.Connection;

public class ReviewBoardDetailService {
	public ReviewBoardBean getArticle(int review_num) throws Exception {
		Connection con = JdbcUtil.getConnection();
		// BoardDAO 객체 가져오기
		ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();

		// BoardDAO 객체에 Connection 객체 전달하기
		boardDAO.setConnection(con);
		
		ReviewBoardBean article= boardDAO.selectArticle(review_num);
		
		int updateCount=boardDAO.updateReadCount(review_num);
		
		if(updateCount>0) {
			  con.commit();
		}else {
			con.rollback();
		}
<<<<<<< HEAD
		close(con);
	    
=======
		 JdbcUtil.close(con);
	        
>>>>>>> branch 'master' of https://github.com/mjpo26/ShoppingMall.git
		return article;
	}
}
