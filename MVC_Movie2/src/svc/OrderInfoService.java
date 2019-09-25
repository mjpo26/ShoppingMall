package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.OrderBean;

public class OrderInfoService {

	public ArrayList<OrderBean> getOrderInfo(String sId) {
ArrayList<OrderBean> articleList = null;
        
        Connection con = getConnection();  
        
        OrderDAO OrderDao =OrderDAO.getInstance();
		
        OrderDao.setConnection(con);
        
        
        articleList = OrderDao.selectArticleList(sId);
        

        
        close(con);
        
        return articleList;
	}

	public static OrderBean getOrderInfo1(int order_item_code) {
		OrderBean ob=null; 
		Connection con = getConnection();  
	        
	        OrderDAO OrderDao =OrderDAO.getInstance();
			
	        OrderDao.setConnection(con);
	        
	        
	        ob = OrderDao.selectArticleList(order_item_code);
	        

	        
	        close(con);
	        
		return ob;
	}

	public ArrayList<OrderBean> getOrderInfo2(String bId) {
		ArrayList<OrderBean> articleList = null;
        
        Connection con = getConnection();  
        
        OrderDAO OrderDao =OrderDAO.getInstance();
		
        OrderDao.setConnection(con);
        
        
        articleList = OrderDao.selectArticleList1(bId);
        
        
        close(con);
        
        return articleList;

	}

}
