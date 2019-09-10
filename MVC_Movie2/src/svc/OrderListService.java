package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderListDAO;
import vo.OrderListBean;
import vo.OrderSearchBean;

public class OrderListService {
	public int getListCount(OrderSearchBean ob) throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();	        
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        listCount = listDAO.selectListCount(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+listCount+"조회");
	        return listCount;
	    }

	    public ArrayList<OrderListBean> getArticleList(OrderSearchBean ob) throws Exception {
	        ArrayList<OrderListBean> articleList = null;
	        
	        Connection con = getConnection();  
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        articleList = listDAO.selectArticleList(ob);
	        
	        close(con);
	        System.out.println("OrderListService의  ArrayList<OrderListBean> 실행됨");
	        return articleList;
	    }


	    
}
