package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;

public class MemberLoginProService {

    public boolean isLoginMember(String id, String password) {
//        System.out.println("LoginProService");
        
        Connection con = getConnection();
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.setConnection(con);
        
        boolean isLoginMember = memberDAO.selectLoginMember(id, password);
        
        
        close(con);
        
        return isLoginMember;
    }

}

















