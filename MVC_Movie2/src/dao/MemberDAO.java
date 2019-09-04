package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import vo.MemberBean;

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
        
        String sql = "SELECT * FROM member WHERE member_id=? AND member_pass=?";
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);
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
                + "member_address_y1) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
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
                 
            
            insertCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("insertMember 실패! - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return insertCount;
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
    
    
}















