package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

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

}
