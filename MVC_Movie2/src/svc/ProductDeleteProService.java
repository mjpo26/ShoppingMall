package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;
import dao.MemberDAO;

public class ProductDeleteProService {

	public boolean isDeleteItem(int item_code) {
		boolean isDeleteSuccess = false;
        
        Connection con = getConnection();
        ItemDAO itemDAO = ItemDAO.getInstance();
        itemDAO.setConnection(con);
        
        int count = itemDAO.Delete(item_code);
        if(count > 0) {
            commit(con);
            isDeleteSuccess = true;
        } else {
            rollback(con);
        }
        close(con);
        return isDeleteSuccess;
	}
       
    
}
