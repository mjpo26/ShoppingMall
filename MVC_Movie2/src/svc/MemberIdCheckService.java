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
		System.out.println("멤버아이디체크-서비스" + id);
		int Member_idcheck = memberDAO.idcheck(id);

		json.put("ch", Member_idcheck);

		close(con);

		return json;

	}

	public MemberBean findFw(String id, String phone) {
		MemberBean memberBean = new MemberBean();
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		memberBean = memberDAO.findFw(id, phone);
		close(con);
		return memberBean;
	}

	public MemberBean findID(String name, String email) {
		MemberBean memberBean = new MemberBean();
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		memberBean = memberDAO.findID(name, email);
		close(con);
		return memberBean;
	}

	public String authNum() {
		MemberBean memberBean = new MemberBean();
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		String authNum = memberDAO.authNum();
		close(con);
		return authNum;
	}

	public boolean checkEmail(String email, String authNum) {
		MemberBean memberBean = new MemberBean();
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		boolean result = memberDAO.sendEmail(email, authNum);

		close(con);
		return result;
	}

}
