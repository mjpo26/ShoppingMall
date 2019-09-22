package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import org.json.simple.JSONObject;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberIdCheckService {

    public JSONObject Member_idcheck(String id) {
    	
        JSONObject json = new JSONObject();
      Connection con = getConnection();
      MemberDAO memberDAO = MemberDAO.getInstance();
      memberDAO.setConnection(con);
      System.out.println("멤버아이디체크-서비스"+id);
      int Member_idcheck = memberDAO.idcheck(id);
      
      json.put("ch", Member_idcheck);
      
      
      
      close(con);
      
      return json;
      
  }
  
}




