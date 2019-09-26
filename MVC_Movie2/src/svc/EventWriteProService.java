package svc;

import java.sql.Connection;

import dao.EventBoardDAO;
import db.JdbcUtil;
import vo.EventBean;

public class EventWriteProService {

	public boolean registArticle(EventBean eventBean)throws Exception {
	      
	      boolean isWriteSuccess = false; 
	      
	      Connection con = JdbcUtil.getConnection();
	     EventBoardDAO dao = EventBoardDAO.getInstance();
	      dao.setConnection(con); 
	    
	      int insertCount = dao.insertArticle(eventBean);

	      if(insertCount == 1) {
	          con.commit();
	          isWriteSuccess = true;
	      } else {
	          con.rollback();
	      }
	      JdbcUtil.close(con);
	      
	      return isWriteSuccess;
	  }

}
