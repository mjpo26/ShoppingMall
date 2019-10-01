package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberInfoService {
    
    public static MemberBean getMemberInfo(String member_id) {
        Connection con = getConnection();
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.setConnection(con);
        
        // MemberDAO 객체의 selectMemberInfo() 메서드를 호출하여 회원 정보 조회(회원 아이디 전달)
        MemberBean memberBean = memberDAO.selectMemberInfo(member_id);
        
        close(con);
        
        return memberBean;
    }

	public int getPoint(String member_id) {
	    Connection con = getConnection();
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.setConnection(con);
        
        // MemberDAO 객체의 selectMemberInfo() 메서드를 호출하여 회원 정보 조회(회원 아이디 전달)
        int memberBean = memberDAO.getPoint(member_id);
        System.out.println("인포서비스 : memberDao 호출 성공여부: " + memberBean);
        
        close(con);
        
        return memberBean;
	}
    
}



















