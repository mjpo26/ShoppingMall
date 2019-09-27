package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BasketListDAO;
import dao.ItemDAO;
import vo.BasketListBean;

public class BasketListService2 {

		public boolean insertbasket(BasketListBean basketListBean, String sId) {
			System.out.println("BasketListInserPrService");
	        boolean isInsertSuccess = false;
	        
	        // MemberDAO 클래스의 insertMember() 메서드를 호출하여 MemberBean 전달
	        // => 전달된 회원에 대한 INSERT 작업 수행 결과를 int 형으로 전달받아 판별 후 boolean 타입으로 리턴
	        Connection con = getConnection();
	        BasketListDAO basketListDAO = BasketListDAO.getInstance();
	        basketListDAO.setConnection(con);
	        
	        
	        int count = basketListDAO.insertItem(basketListBean,sId);
	        
	        if(count > 0) {
	            commit(con);
	            isInsertSuccess = true;
	        } else {
	            rollback(con);
	        }
	        close(con);
	        return isInsertSuccess;
	        
		}
	    
}
