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

public class MemberDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static MemberDAO instance;
    private MemberDAO() {}
    
    public static MemberDAO getInstance() {
        // 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new MemberDAO();
        }
        
        return instance;
    }
    // -----------------------------------------------------

    Connection con;
    
    public void setConnection(Connection con) {
        this.con = con;
    }

    public boolean selectLoginMember(String id, String pass) {
        // id, password 에 해당하는 레코드가 있으면 로그인 성공(true 리턴), 아니면 실패(false 리턴)
        boolean isLoginMember = false;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //query= "";
        String sql = "SELECT * FROM member WHERE member_id =? AND member_pass =?";
        
        try {
        	
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);
            
//            if(id.equals("")) {
//            	pstmt.setString(1, "is not null");	
//            }
//            else {
//            	pstmt.setString(1, "="+id);
//            }
//            
//            if(pass.equals("")) {
//            	pstmt.setString(2, "is not null");	
//            }
//            else {
//            	pstmt.setString(2, "="+pass);
//            }
            
            
            //pstmt.setString(2, pass);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                isLoginMember = true;
            }
        } catch (SQLException e) {
            System.out.println("selectLoginMember 실패! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return isLoginMember;
    }

    // 회원 추가
    public int insertMember(MemberBean memberBean) {
        int insertCount = 0;
        
        PreparedStatement pstmt = null;
        
        String sql = "INSERT INTO member ("
                + "member_id,"
                + "member_pass,"
                + "member_name,"
                + "member_address1,"
                + "member_address1_nick,"
                + "member_phone,"
                + "member_email,"
                + "member_sms_ok,"
                + "member_email_ok,"
                + "member_mypoint,"
                + "member_yechimoney,"
                + "member_grade,"
                + "member_used_point,"
                + "member_postcode1,"
                + "member_address_x1,"
                + "member_address_y1,"
                + "pickStart,"
                + "joinDate,"
                + "pickEnd ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberBean.getMember_id());
            pstmt.setString(2, memberBean.getMember_pass());
            pstmt.setString(3, memberBean.getMember_name());
            pstmt.setString(4, memberBean.getMember_address1());
            pstmt.setString(5, memberBean.getMember_address1_nick());
            pstmt.setString(6, memberBean.getMember_phone());
            pstmt.setString(7, memberBean.getMember_email());
            pstmt.setString(8, memberBean.getMember_sms_ok());
            pstmt.setString(9, memberBean.getMember_email_ok());
            pstmt.setInt(10, memberBean.getMember_mypoint());
            pstmt.setInt(11, memberBean.getMember_yechimoney());
            pstmt.setString(12, memberBean.getMember_grade());
            pstmt.setInt(13, memberBean.getMember_used_point());
            pstmt.setString(14, memberBean.getMember_postcode1());
            pstmt.setString(15, memberBean.getMember_address_x1());
            pstmt.setString(16, memberBean.getMember_address_y1());
            pstmt.setDate(17, memberBean.getPickStart());
            pstmt.setDate(18, memberBean.getPickEnd());
                 
            
            insertCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("insertMember 실패! - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return insertCount;
    }
    
    public boolean selectId(String id) throws SQLException {
        boolean flag = false;
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {

              String selectId = "SELECT id FROM member WHERE id=?";
              pstmt = con.prepareStatement(selectId);
              pstmt.setString(1, id);
              
              // 5. 쿼리 실행 결과 얻기
              rs = pstmt.executeQuery();
              
              flag = !rs.next(); // 조회되는게 있는지 없는지 여부만  판단
              
        } finally {
              // 6. 연결 끊기
              if (rs != null) { rs.close(); }
              if (pstmt != null) { pstmt.close(); }
              if (con != null) { con.close(); }
        }
        return flag;
  }
    //회원 정보 수정
    
    // 회원 추가
    public int updateMember(MemberBean memberBean) {
        int updateCount = 0;
        
        
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE member SET "
                + "member_pass=?,"
                + "member_name=?,"
                + "member_address1=?,"
                + "member_address1_nick=?,"
                + "member_phone=?,"
                + "member_email=?,"
                + "member_sms_ok=?,"
                + "member_email_ok=?,"
                + "member_mypoint=?,"
                + "member_yechimoney=?,"
                + "member_grade=?,"
                + "member_used_point=?,"
                + "member_postcode1=?,"
                + "member_address_x1=?,"
                + "member_address_y1=?"
                + "WHERE member_id=?";
        
        try {
            pstmt = con.prepareStatement(sql);
    //        pstmt.setString(1, memberBean.getMember_id());
            pstmt.setString(1, memberBean.getMember_pass());
            pstmt.setString(2, memberBean.getMember_name());
            pstmt.setString(3, memberBean.getMember_address1());
            pstmt.setString(4, memberBean.getMember_address1_nick());
            pstmt.setString(5, memberBean.getMember_phone());
            pstmt.setString(6, memberBean.getMember_email());
            pstmt.setString(7, memberBean.getMember_sms_ok());
            pstmt.setString(8, memberBean.getMember_email_ok());
            pstmt.setInt(9, memberBean.getMember_mypoint());
            pstmt.setInt(10, memberBean.getMember_yechimoney());
            pstmt.setString(11, memberBean.getMember_grade());
            pstmt.setInt(12, memberBean.getMember_used_point());
            pstmt.setString(13, memberBean.getMember_postcode1());
            pstmt.setString(14, memberBean.getMember_address_x1());
            pstmt.setString(15, memberBean.getMember_address_y1());
            pstmt.setString(16, memberBean.getMember_id());
                 
            
           updateCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("updateMember 실패! - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return updateCount;
    }
    
    
    // 회원 정보 조회
    public MemberBean selectMemberInfo(String member_id) {
        MemberBean memberBean = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT * FROM member WHERE member_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                memberBean = new MemberBean();
                memberBean.setMember_id(rs.getString("member_id"));
                memberBean.setMember_pass(rs.getString("member_pass"));
                memberBean.setMember_name(rs.getString("member_name"));
                memberBean.setMember_address1(rs.getString("member_address1"));
                memberBean.setMember_address1_nick(rs.getString("member_address1_nick"));
                memberBean.setMember_phone(rs.getString("member_phone"));
                memberBean.setMember_email(rs.getString("member_email"));
                memberBean.setMember_sms_ok(rs.getString("member_sms_ok"));
                memberBean.setMember_email_ok(rs.getString("member_email_ok"));
                memberBean.setMember_mypoint(rs.getInt("member_mypoint"));
                memberBean.setMember_yechimoney(rs.getInt("member_yechimoney"));
                memberBean.setMember_grade(rs.getString("member_grade"));
                memberBean.setMember_used_point(rs.getInt("member_used_point"));
                memberBean.setMember_postcode1(rs.getString("member_postcode1"));
                memberBean.setMember_address_x1(rs.getString("member_address_x1"));
                memberBean.setMember_address_y1(rs.getString("member_address_y1"));
              
            }
            
        } catch (SQLException e) {
            System.out.println("selectMemberInfo 실패! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return memberBean;
        
    }
    
    
    //회원삭제
    public int deleteMember(String id) {
        // id, password 에 해당하는 레코드가 있으면 삭제 (pass따로 받아와서 비번확인구현)
        System.out.println("딜리트멤버디에이오 왔나 id는 " +id);
        int deleteCount = 0;
        
        PreparedStatement pstmt = null;
       
        
        String sql = "DELETE FROM member where member_id = ?";//나중에 AND로 비번검사
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            deleteCount = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            System.out.println("deleteMember 실패! - " + e.getMessage());
        } finally {
            
            close(pstmt);
        }
        
        return deleteCount;
    }
    
    //어드민 회원조회 getMemberCount
    
    public int getMemberCount() {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
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
    public ArrayList<MemberBean> selectMemberList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();

		int startRow = (page - 1) * 10; 
		
		try {

			String sql = "SELECT * FROM member  LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

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

	public int idcheck(String id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ch = 0;
		
		try {	
		    System.out.println("멤버아이디체크-DAO"+id);
			String sql = "select member_id  from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			if(id.equals(rs.getString("member_id"))) {
				ch=1; //아이디 중복
			} else {
				ch=0; //아이디사용가능
			}
		} 	
		catch (SQLException e) {
			System.out.println("아이디중복체크DAO() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		System.out.println("idcheckDAO 리턴값 ch 확인"+ch);
		return ch;
	}

	public MemberBean addPoint(String member_Mypoint) {
		
		String sql = "I don't know what do I write here =.="
				+ "즉시구매 => OrderBean에 있는 ItemPoint를 MemberBean에 있는"
				+ "MyPoint로 넣어야함니다,,";
		return null;
	}

	public int updateMember1(String sId, int item_point) {
		  int updateCount = 0;
	        
	        
	        PreparedStatement pstmt = null;
	        
	        String sql = "UPDATE member SET member_mypoint=? where member_id=?";
	        
	        try {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, item_point);
	            pstmt.setString(2, sId);
	            
	           updateCount = pstmt.executeUpdate();
	            
	        } catch (SQLException e) {
	            System.out.println("updateMember 실패! - " + e.getMessage());
	        } finally {
	            close(pstmt);
	        }
	        
	        return updateCount;
	    }
    
}















