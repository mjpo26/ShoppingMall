package svc;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;

public class MemberDeleteProService {

    
    
    public boolean isDeleteMember(String id) {
        System.out.println("멤버딜리트프로서비스왔나 id는  :"+id);
        
        boolean isDeleteSuccess = false;
        
        Connection con = getConnection();
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.setConnection(con);
        
        int count = memberDAO.deleteMember(id);
        
        if(count > 0) {
            commit(con);
            isDeleteSuccess = true;
        } else {
            rollback(con);
        }
        
        return isDeleteSuccess;
        
    }
       
    
}
