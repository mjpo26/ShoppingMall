package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;
import vo.MemberBean;

public class MemberIdCheckService {

    public int Member_idcheck(String id) {
    	
      Connection con = getConnection();
      MemberDAO memberDAO = MemberDAO.getInstance();
      memberDAO.setConnection(con);
      
      int Member_idcheck = memberDAO.idcheck(id);
      
      close(con);
      
      return Member_idcheck;
      
  }
  
}




