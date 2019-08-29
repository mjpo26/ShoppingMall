package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnA_BoardDAO;
import vo.QnA_BoardBean;

public class QnA_BoardListService {

	public int getListCount() throws Exception {
		
		 int listCount = 0; // 전체 게시물 수 저장하는 변수
	        Connection con = getConnection();  
	        
	        QnA_BoardDAO qnA_BoardDAO = QnA_BoardDAO.getInstance();
	        qnA_BoardDAO.setConnection(con);
	        listCount = qnA_BoardDAO.selectListCount();
	        close(con);
		return listCount;
	}

	public ArrayList<QnA_BoardBean> getArticleList(int page, int limit) throws Exception {
		ArrayList<QnA_BoardBean> articleList = null;
		
		 Connection con = getConnection();
		 QnA_BoardDAO qnA_BoardDAO = QnA_BoardDAO.getInstance();
	     qnA_BoardDAO.setConnection(con);
	     
	     articleList = qnA_BoardDAO.selectArticleList(page,limit);
	     
	     close(con);
	     
		return articleList;
	}

}
