package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import vo.Admin_MemberSearchBean;
import vo.Free_BoardBean;
import vo.MemberBean;
import vo.OrderListBean;

import static db.JdbcUtil.*;

public class MemberListDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static MemberListDAO instance;
    private MemberListDAO() {}
    
    public static MemberListDAO getInstance() {
        // 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new MemberListDAO();
        }
        
        return instance;
    }
    // -----------------------------------------------------

    Connection con;
    
    public void setConnection(Connection con) {
        this.con = con;
    }

    public int getMemberCount(Admin_MemberSearchBean ams) {
    	int listCount = 0;
    	
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String member_sms_ok = ams.getMember_sms_ok();
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	String sql = "SELECT COUNT(*) FROM member where member_sms_ok=?";
    	try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_sms_ok);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("sns check 여부 : "+ams.getMember_sms_ok()+"갯수는"+listCount);
			}
			
		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}
      
    
    //어드민 회원리스트 조회
    public ArrayList<MemberBean> selectMemberList(Admin_MemberSearchBean ams) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
		
		int startRow = (ams.getPage() - 1) * 10; 
		
		try {
			
			
			
			
//setInt 처리하는거는 나중에 시간나면 하면 된다.
//지금은 무조건 전체페이지 연결부터 해야 일이 될거야.		    
//텍스트박스 공백 들어오는건 세터에서 null 처리해주면되더라.
//누군가 시간 남는 사람이 고민한 번 해 보도록^^;
//이런거 생각해보고 짜는 것이 공부가 될꺼야.
		    
			String sql = "SELECT * FROM member where "
			        + "member_id like ifnull(?,'%%') "
			        + "and member_name like ifnull(?,'%%') "
			        + "and member_phone like ifnull(?,'%%') "
			        + "and member_sms_ok like ifnull(?,'%%') "
			        + "and  member_email_ok like ifnull(?,'%%')"
			     //   + "and joinDate >= ifnull(?,now())&& joinDate<=ifnull(?,now())"
			        + "ORDER BY member_id LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ams.getMember_id());
			pstmt.setString(2, ams.getMember_name());
			pstmt.setString(3, ams.getMember_phone());
			pstmt.setString(4, ams.getMember_sms_ok());
			pstmt.setString(5, ams.getMember_email_ok());
			//pstmt.setDate(6, ams.getPickStart());
			//pstmt.setDate(7, ams.getPickEnd());
			pstmt.setInt(6, startRow);
			pstmt.setInt(7, ams.getLimit());

			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+ams.getLimit());
			
			while (rs.next()) {
				MemberBean memberBean = new MemberBean();
				memberBean.setMember_id(rs.getString("member_id"));
				memberBean.setMember_pass(rs.getString("member_pass"));
				memberBean.setMember_name(rs.getString("member_name"));
				memberBean.setMember_address1(rs.getString("member_address1"));
				memberBean.setMember_address2(rs.getString("member_address2"));
				memberBean.setMember_address3(rs.getString("member_address3"));
				memberBean.setMember_address4(rs.getString("member_address4"));
				memberBean.setMember_address5(rs.getString("member_address5"));
				memberBean.setMember_address_default(rs.getString("member_address_default"));
				memberBean.setMember_address1_nick(rs.getString("member_address1_nick"));
				memberBean.setMember_address2_nick(rs.getString("member_address2_nick"));
				memberBean.setMember_address3_nick(rs.getString("member_address3_nick"));
				memberBean.setMember_address4_nick(rs.getString("member_address4_nick"));
				memberBean.setMember_address5_nick(rs.getString("member_address5_nick"));
				memberBean.setMember_address_default_nick(rs.getString("member_address_default_nick"));
				memberBean.setMember_phone(rs.getString("member_phone"));
				memberBean.setMember_email(rs.getString("member_email"));
				memberBean.setMember_sms_ok(rs.getString("member_sms_ok"));
				memberBean.setMember_email_ok(rs.getString("member_email_ok"));
				memberBean.setMember_mypoint(rs.getInt("member_mypoint"));
				memberBean.setMember_yechimoney(rs.getInt("member_yechimoney"));
				memberBean.setMember_grade(rs.getString("member_grade"));
				memberBean.setMember_used_point(rs.getInt("member_used_point"));
				memberBean.setMember_postcode1(rs.getString("member_postcode1"));
				memberBean.setMember_postcode2(rs.getString("member_postcode2"));
				memberBean.setMember_postcode3(rs.getString("member_postcode3"));
				memberBean.setMember_postcode4(rs.getString("member_postcode4"));
				memberBean.setMember_postcode5(rs.getString("member_postcode5"));
				memberBean.setMember_address_x1(rs.getString("member_address_x1"));
				memberBean.setMember_address_x2(rs.getString("member_address_x2"));
				memberBean.setMember_address_x3(rs.getString("member_address_x3"));
				memberBean.setMember_address_x4(rs.getString("member_address_x4"));
				memberBean.setMember_address_x5(rs.getString("member_address_x5"));
				memberBean.setMember_address_y1(rs.getString("member_address_y1"));
				memberBean.setMember_address_y2(rs.getString("member_address_y2"));
				memberBean.setMember_address_y3(rs.getString("member_address_y3"));
				memberBean.setMember_address_y4(rs.getString("member_address_y4"));
				memberBean.setMember_address_y5(rs.getString("member_address_y5"));
							
				memberList.add(memberBean);
			}
			System.out.println("mDAO: 멤버빈 담긴거 확인:" +memberList);
		} catch (SQLException e) {
			System.out.println("MemberDAO: selectMemberList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return memberList;
	}

  
    
}





