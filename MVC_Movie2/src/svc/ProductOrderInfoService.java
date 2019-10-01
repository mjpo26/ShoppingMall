package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;
import vo.ItemBean;

public class ProductOrderInfoService {

	public ItemBean getItemInfo(int itemId) {
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		ItemBean itemBean =itemDAO.selectItemInfo(itemId);
		
		  close(con);
		return itemBean;
	}

	public boolean getItemstock_count(int itemCode, int stock_count) {
		boolean isUpdateSuccess = false;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		
		 int count = itemDAO.updateItemInfo(itemCode,stock_count);
	        
	        if(count > 0) {
	            commit(con);
	            isUpdateSuccess = true;
	            
	        } else {
	            rollback(con);
	        }
	        close(con);
	        return isUpdateSuccess;
	}

}
