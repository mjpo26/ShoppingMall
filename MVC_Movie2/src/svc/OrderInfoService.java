package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderListDAO;
import vo.OrderListBean;
import vo.OrderListBean;

public class OrderInfoService {

	public ArrayList<OrderListBean> getOrderInfo(String sId) {
ArrayList<OrderListBean> articleList = null;
        
        Connection con = getConnection();  
        
        OrderListDAO orderListDAO =OrderListDAO.getInstance();
		
        orderListDAO.setConnection(con);
        
        
        articleList = orderListDAO.selectArticleList(sId);
        

        
        close(con);
        
        return articleList;
	}

	public static OrderListBean getOrderInfo1(int order_item_code) {
		OrderListBean ob=null; 
		Connection con = getConnection();  
	        
	        OrderListDAO orderListDAO =OrderListDAO.getInstance();
			
	        orderListDAO.setConnection(con);
	        
	        
	        ob = orderListDAO.selectArticleList(order_item_code);
	        

	        
	        close(con);
	        
		return ob;
	}

	public ArrayList<OrderListBean> getOrderInfo2(String bId) {
		ArrayList<OrderListBean> articleList = null;
        
        Connection con = getConnection();  
        
        OrderListDAO orderListDAO =OrderListDAO.getInstance();
		
        orderListDAO.setConnection(con);
        
        
        articleList = orderListDAO.selectArticleList1(bId);
        

        
        close(con);
        
        return articleList;

	}

}
