package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

public class ProductListService {

	public int getListCount() {
	     int listCount = 0; // �쟾泥� 寃뚯떆臾� �닔 ���옣�븯�뒗 蹂��닔
	        Connection con = getConnection();  
	        
	        ItemDAO itemDAO = ItemDAO.getInstance();
	        
	        itemDAO.setConnection(con);
	        
	        listCount = itemDAO.selectListCount();
	        close(con);
	        
	        return listCount;
	    }

	    public ArrayList<ItemBean> getArticleList(int page, int limit) throws Exception {
	        ArrayList<ItemBean> articleList = null;
	        
	        Connection con = getConnection();  
	        ItemDAO itemDAO = ItemDAO.getInstance();
	        itemDAO.setConnection(con);
	        
	        articleList = itemDAO.selectArticleList(page, limit);
	        

	        
	        close(con);
	        
	        return articleList;

}
}