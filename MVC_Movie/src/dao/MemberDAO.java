package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public boolean selectLoginMember(String id, String password) {
        // id, password 에 해당하는 레코드가 있으면 로그인 성공(true 리턴), 아니면 실패(false 리턴)
        boolean isLoginMember = false;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM movie_member WHERE member_id=? AND member_passwd=?";
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
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
        
        String sql = "INSERT INTO movie_member VALUES (null,?,?,?,?,?,?,?)";
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberBean.getMember_name());
            pstmt.setString(2, memberBean.getMember_id());
            pstmt.setString(3, memberBean.getMember_passwd());
            pstmt.setString(4, memberBean.getMember_gender());
            pstmt.setString(5, memberBean.getMember_jumin());
            pstmt.setString(6, memberBean.getMember_email());
            pstmt.setString(7, memberBean.getMember_phone());
            insertCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("insertMember 실패! - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return insertCount;
    }
    
    
    // 회원 정보 조회
    public MemberBean selectMemberInfo(String member_id) {
        MemberBean memberBean = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT * FROM movie_member WHERE member_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                memberBean = new MemberBean();
                memberBean.setMember_name(rs.getString("member_name"));
                memberBean.setMember_id(rs.getString("member_id"));
                memberBean.setMember_gender(rs.getString("member_gender"));
                memberBean.setMember_jumin(rs.getString("member_jumin"));
                memberBean.setMember_email(rs.getString("member_email"));
                memberBean.setMember_phone(rs.getString("member_phone"));
            }
            
        } catch (SQLException e) {
            System.out.println("selectMemberInfo 실패! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return memberBean;
        
    }
    
    
}















