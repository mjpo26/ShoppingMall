package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

public class ProductListService {

	public int getListCount(String category) {
	     int listCount = 0;
	        Connection con = getConnection();  
	        
	        ItemDAO itemDAO = ItemDAO.getInstance();
	        
	        itemDAO.setConnection(con);
	        
	        listCount = itemDAO.selectListCount(category);
	        close(con);
	        
	        return listCount;
	    }

	    public ArrayList<ItemBean> getArticleList(int page, int limit, String category) throws Exception {
	        ArrayList<ItemBean> articleList = null;
	        
	        Connection con = getConnection();  
	        ItemDAO itemDAO = ItemDAO.getInstance();
	        itemDAO.setConnection(con);
	        
	        articleList = itemDAO.selectArticleList(page, limit,category);
	        

	        
	        close(con);
	        
	        return articleList;

}
}