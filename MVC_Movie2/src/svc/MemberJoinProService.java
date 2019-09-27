package svc;

import vo.MemberBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;

public class MemberJoinProService {
    
    public boolean insertMember(MemberBean memberBean) {
//        System.out.println("MemberJoinProService()");
        
        boolean isInsertSuccess = false;
        
        // MemberDAO 클래스의 insertMember() 메서드를 호출하여 MemberBean 전달
        // => 전달된 회원에 대한 INSERT 작업 수행 결과를 int 형으로 전달받아 판별 후 boolean 타입으로 리턴
        Connection con = getConnection();
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.setConnection(con);
        
        int count = memberDAO.insertMember(memberBean);
        
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

















