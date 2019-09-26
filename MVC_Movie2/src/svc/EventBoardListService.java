package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.EventBoardDAO;
import vo.EventBean;

public class EventBoardListService {

	public int getListCount()throws Exception {
        int listCount = 0; 
      
        Connection con = getConnection();
        
        EventBoardDAO boardDAO = EventBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        listCount = boardDAO.selectListCount();
        close(con);
        System.out.println("ReviewBoardListService의 getListCount() 실행됨");
        return listCount;
    }

    public ArrayList<EventBean> getArticleList(int page, int limit) throws Exception {
        ArrayList<EventBean> articleList = null;
        
        Connection con = getConnection();  
        EventBoardDAO boardDAO = EventBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        articleList = boardDAO.selectArticleList(page, limit);
        
        close(con);
        System.out.println("ReviewBoardListService의  ArrayList<ReviewBoardBean> 실행됨");
        return articleList;
    }
    
    
    
}
