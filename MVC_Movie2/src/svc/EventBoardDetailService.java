package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.EventBoardDAO;
import dao.ReviewBoardDAO;
import vo.EventBean;

public class EventBoardDetailService {

	public EventBean getArticle(int event_num)throws Exception {
		Connection con = getConnection();
		// BoardDAO 객체 가져오기
		EventBoardDAO boardDAO = EventBoardDAO.getInstance();

		// BoardDAO 객체에 Connection 객체 전달하기
		boardDAO.setConnection(con);
		
		EventBean article= boardDAO.selectArticle(event_num);
		
		int updateCount=boardDAO.updateReadCount(event_num);
		
		if(updateCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
	    close(con);
		return article;
	}

}
