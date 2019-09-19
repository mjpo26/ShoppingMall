package svc;

import java.sql.SQLException;

import org.json.simple.JSONObject;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberUserCheckService {

	public JSONObject searchId(String id) {
	    JSONObject json = new JSONObject();
        
        MemberDAO mdao = MemberDAO.getInstance();
        boolean flag = false;
        try {
        	 flag = mdao.selectId(id);
        } catch (SQLException e) {
              e.printStackTrace();
        }
        
        // DB조회 결과를 JSONObject에 추가
        json.put("idResult", flag);
        
        return json;
	}


}
