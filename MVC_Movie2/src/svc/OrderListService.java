package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.OrderBean;
import vo.OrderBean;

public class OrderListService {
	public int getListCount(OrderBean ob) throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();	        
	        OrderDAO listDAO = OrderDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        listCount = listDAO.selectListCount(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+listCount+"조회");
	        return listCount;
	    }

	
	    public ArrayList<OrderBean> getArticleList(OrderBean ob) throws Exception {
	        ArrayList<OrderBean> articleList = null;
	        
	        Connection con = getConnection();  
	        OrderDAO listDAO = OrderDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        articleList = listDAO.selectArticleList(ob);
	        
	        close(con);
	        return articleList;
	    }

		public int getdelivery1_Count(OrderBean ob) {
	        int delivery1_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderDAO listDAO = OrderDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery1_Count = listDAO.selectdelivery1_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery1_Count+"조회");
	        return delivery1_Count;
	    }

		public int getdelivery2_Count(OrderBean ob) {
	        int delivery2_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderDAO listDAO = OrderDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery2_Count = listDAO.selectdelivery2_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery2_Count+"조회");
	        return delivery2_Count;
	    }
		
		public int getdelivery3_Count(OrderBean ob) {
	        int delivery3_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderDAO listDAO = OrderDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery3_Count = listDAO.selectdelivery3_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery3_Count+"조회");
	        return delivery3_Count;
	    }
		
		public int getdelivery4_Count(OrderBean ob) {
	        int delivery4_Count = 0; 
		      
	        Connection con = getConnection();	        
	        OrderDAO listDAO = OrderDAO.getInstance();
	        listDAO.setConnection(con);
	        
	        delivery4_Count = listDAO.selectdelivery4_Count(ob);
	        close(con);
	        System.out.println("OrderListService의 getListCount() 실행됨"+delivery4_Count+"조회");
	        return delivery4_Count;
	    }

}
