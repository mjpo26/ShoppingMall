package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BasketListDAO;
import vo.BasketListBean;

public class BasketListService {
	  public int getListCount() throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();
	        
	        BasketListDAO listDAO = BasketListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        listCount = listDAO.selectListCount();
	        close(con);
	        System.out.println("BasketListService의 getListCount() 실행됨");
	        return listCount;
	    }

	    public ArrayList<BasketListBean> getArticleList(int page, int limit) throws Exception {
	        ArrayList<BasketListBean> articleList = null;
	        
	        Connection con = getConnection();  
	        BasketListDAO listDAO = BasketListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        articleList = listDAO.selectArticleList(page, limit);
	        
	        close(con);
	        System.out.println("BasketListService의  ArrayList<BasketListBean> 실행됨");
	        return articleList;
	    }
	    
}
