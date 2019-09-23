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

		public int getdelivery1_Count(OrderSearchBean ob) {
	        int delivery1_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery1_Count = listDAO.selectdelivery1_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery1_Count+"조회");
	        return delivery1_Count;
	    }

		public int getdelivery2_Count(OrderSearchBean ob) {
	        int delivery2_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery2_Count = listDAO.selectdelivery2_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery2_Count+"조회");
	        return delivery2_Count;
	    }
		
		public int getdelivery3_Count(OrderSearchBean ob) {
	        int delivery3_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery3_Count = listDAO.selectdelivery3_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery3_Count+"조회");
	        return delivery3_Count;
	    }
		
		public int getdelivery4_Count(OrderSearchBean ob) {
	        int delivery4_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderListDAO listDAO = OrderListDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery4_Count = listDAO.selectdelivery4_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery4_Count+"조회");
	        return delivery4_Count;
	    }

}
