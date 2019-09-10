package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardListDAO;
import dao.MemberListDAO;
import vo.AdminBoardSearchBean;
import vo.MemberBean;
import vo.ReviewBoardBean;

public class AdminBoardListService {

	public int getListCount(AdminBoardSearchBean abb) throws Exception {
        int listCount = 0; 
	      
        Connection con = getConnection();
        
        BoardListDAO BDAO = BoardListDAO.getInstance();
        BDAO.setConnection(con);
        
        listCount = BDAO.getBoardCount(abb);
        close(con);
        System.out.println("AdminBoardListService 의 getBoardCount() 실행됨"+listCount+"조회");
        return listCount;
    }

	public ArrayList<ReviewBoardBean> getArticleList(AdminBoardSearchBean abb)  throws Exception {
        ArrayList<ReviewBoardBean> articleList = null;
        
        Connection con = getConnection();  
        BoardListDAO BDAO = BoardListDAO.getInstance();
        BDAO.setConnection(con);
        
        articleList = BDAO.selectMemberList(abb);
        
        close(con);
        System.out.println("Admin_memberListService의  ArrayList<MemberBean> 실행됨");
        return articleList;
	}

}
