package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import dao.OrderDAO;
import vo.ItemBean;
import vo.OrderBean;

public class ProductList1Service {



		public ArrayList<ItemBean> getArticleList(ItemBean pb) throws Exception {
	        ArrayList<ItemBean> articleList = null;
	        
	        Connection con = getConnection();
	        ItemDAO itemDAO = ItemDAO.getInstance(); 
	        
	        itemDAO.setConnection(con);
	        
	        articleList = itemDAO.selectArticleList(pb);
	        
	        close(con);
	        System.out.println("OrderListService의  ArrayList<OrderBean> 실행됨");
	        return articleList;
	    }

}
