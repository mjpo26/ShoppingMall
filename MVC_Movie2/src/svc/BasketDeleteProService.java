package svc;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BasketListDAO;
import dao.MemberDAO;

public class BasketDeleteProService {

    
    
    public boolean isDeleteMember(String id) {
        System.out.println("바스킷딜리트프로서비스왔나 id는  :"+id);
        
        boolean isDeleteSuccess = false;
        
        Connection con = getConnection();
        BasketListDAO bDAO = BasketListDAO.getInstance();
        bDAO.setConnection(con);
        
        int count = bDAO.deleteMember(id);
        
        if(count > 0) {
            commit(con);
            isDeleteSuccess = true;
        } else {
            rollback(con);
        }
        
        return isDeleteSuccess;
        
    }
       
    
}
