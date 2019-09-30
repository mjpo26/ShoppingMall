package svc;

import java.sql.Connection;
import java.util.ArrayList;


import dao.ReviewBoardDAO;
import vo.ReviewBoardBean;

import static db.JdbcUtil.*;

public class ReviewBoardListService {

    public int getListCount() throws Exception {
        int listCount = 0; 
      
        Connection con = getConnection();
        
        ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        listCount = boardDAO.selectListCount();
       
        System.out.println("ReviewBoardListService의 getListCount() 실행됨");
        return listCount;
    }

    public ArrayList<ReviewBoardBean> getArticleList(int page, int limit) throws Exception {
        ArrayList<ReviewBoardBean> articleList = null;
        
        Connection con = getConnection();  
        ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        articleList = boardDAO.selectArticleList(page, limit);
        
        close(con);
        System.out.println("ReviewBoardListService의  ArrayList<ReviewBoardBean> 실행됨");
        return articleList;
    }


    public int getListCount(int item_code) throws Exception {
        int listCount = 0; 
      
        Connection con = getConnection();
        
        ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        listCount = boardDAO.selectListCount(item_code);
       
        System.out.println("ReviewBoardListService의 getListCount() 실행됨");
        return listCount;
    }

    public ArrayList<ReviewBoardBean> getArticleList(int item_code, int page, int limit) throws Exception {
        ArrayList<ReviewBoardBean> articleList = null;
        
        Connection con = getConnection();  
        ReviewBoardDAO boardDAO = ReviewBoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        articleList = boardDAO.selectArticleList(item_code, page, limit);
        
        close(con);
        System.out.println("ReviewBoardListService의  ArrayList<ReviewBoardBean> 실행됨");
        return articleList;
    }
    
    
    
}
