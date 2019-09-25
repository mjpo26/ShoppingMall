package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnA_BoardDAO;
import vo.AdminBoardSearchBean;
import vo.QnA_BoardBean;

public class AdminQnABoardListService {

	public int getListCount(AdminBoardSearchBean abb) throws Exception {
        int listCount = 0; 
	    System.out.println("getListCount 입력");
        Connection con = getConnection();
        
        QnA_BoardDAO BDAO = QnA_BoardDAO.getInstance();
        BDAO.setConnection(con);
        
        listCount = BDAO.getBoardCount(abb);
        close(con);
        System.out.println("AdminQnABoardListService 의 getBoardCount() 실행됨"+listCount+"조회");
        return listCount;
    }

	public ArrayList<QnA_BoardBean> getArticleList(AdminBoardSearchBean abb) {
		  ArrayList<QnA_BoardBean> articleList = null;
	        
	        Connection con = getConnection();  
	        QnA_BoardDAO BDAO = QnA_BoardDAO.getInstance();
	        BDAO.setConnection(con);
	        
	        articleList = BDAO.selectBoardList(abb);
	        
	        close(con);
	        System.out.println("Admin_memberListService의  ArrayList<MemberBean> 실행됨");
	        return articleList;
		}

}
