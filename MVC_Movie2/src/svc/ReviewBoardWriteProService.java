package svc;

import java.sql.Connection;

import dao.ReviewBoardDAO;
import db.JdbcUtil;
import vo.ReviewBoardBean;

public class ReviewBoardWriteProService {
    public boolean registArticle(ReviewBoardBean boardBean) throws Exception {
      
      boolean isWriteSuccess = false; 
      
      Connection con = JdbcUtil.getConnection();
      ReviewBoardDAO dao = ReviewBoardDAO.getInstance();
      dao.setConnection(con); 
    
      int insertCount = dao.insertArticle(boardBean);

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
