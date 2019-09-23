package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.OrderDAO;
import vo.OrderBean;

public class OrderUpdateService {

	public boolean updateOrder(OrderBean orderBean) {
		
		  boolean isUpdateSuccess = false;
	        
	        // MemberDAO 클래스의 insertMember() 메서드를 호출하여 MemberBean 전달
	        // => 전달된 회원에 대한 INSERT 작업 수행 결과를 int 형으로 전달받아 판별 후 boolean 타입으로 리턴
	        Connection con = getConnection();
	        OrderDAO orderDAO = OrderDAO.getInstance();
	        orderDAO.setConnection(con);
	        
	        int count = orderDAO.updateOrder(orderBean);
	        
	        if(count > 0) {
	            commit(con);
	            isUpdateSuccess = true;
	        } else {
	            rollback(con);
	        }
	        
	        return isUpdateSuccess;
	}

}
