package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

public class ProductListService {

	public int getListCount(String category, String category2) {
	     int listCount = 0;
	        Connection con = getConnection();  
	        
	        ItemDAO itemDAO = ItemDAO.getInstance();
	        
	        itemDAO.setConnection(con);
	        
	        listCount = itemDAO.selectListCount(category,category2);
	        close(con);
	        
	        return listCount;
	    }

	    public ArrayList<ItemBean> getArticleList(int page, int limit, String category, String category2) throws Exception {
	        ArrayList<ItemBean> articleList = null;
	        
	        Connection con = getConnection();  
	        ItemDAO itemDAO = ItemDAO.getInstance();
	        itemDAO.setConnection(con);
	        
	        articleList = itemDAO.selectArticleList(page, limit,category,category2);
	        

	        
	        close(con);
	        
	        return articleList;

}
}