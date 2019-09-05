package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderListDAO;
import vo.OrderListBean;

public class OrderListService {
	  public int getListCount() throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();
	        
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        listCount = listDAO.selectListCount();
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨");
	        return listCount;
	    }

	    public ArrayList<OrderListBean> getArticleList(int page, int limit) throws Exception {
	        ArrayList<OrderListBean> articleList = null;
	        
	        Connection con = getConnection();  
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        articleList = listDAO.selectArticleList(page, limit);
	        
	        close(con);
	        System.out.println("OrderListService의  ArrayList<OrderListBean> 실행됨");
	        return articleList;
	    }
	    
}
