package svc;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;
import vo.ItemBean;

public class ProductUpdateProService {

	public boolean updateItem(ItemBean itemBean) {
		System.out.println("ProductUpdatePrService");
        boolean isUpdateSuccess = false;
        
        // MemberDAO 클래스의 insertMember() 메서드를 호출하여 MemberBean 전달
        // => 전달된 회원에 대한 INSERT 작업 수행 결과를 int 형으로 전달받아 판별 후 boolean 타입으로 리턴
        Connection con = getConnection();
        ItemDAO itemDAO = ItemDAO.getInstance();
        itemDAO.setConnection(con);
        
        int count = itemDAO.UpdateItem(itemBean);
        
        if(count > 0) {
            commit(con);
            isUpdateSuccess = true;
        } else {
            rollback(con);
        }
        
        return isUpdateSuccess;
        
	}

}
