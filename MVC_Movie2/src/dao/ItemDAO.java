package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.ItemBean;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class ItemDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static ItemDAO instance;
    private ItemDAO() {}
    
    public static ItemDAO getInstance() {
        // 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new ItemDAO();
        }
        
        return instance;
    }
    // -----------------------------------------------------

    Connection con;
    
    public void setConnection(Connection con) {
        this.con = con;
    }

    // 상품 등록
    public int insertItem(ItemBean itemBean) {
        int insertCount = 0;
        
        PreparedStatement pstmt = null;
        
        String sql = "INSERT INTO Item VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, itemBean.getItem_title());//상품명
            pstmt.setInt(2, itemBean.getItem_old_price()); //판매가(정가)
            pstmt.setString(3, itemBean.getItem_content1());//상품요약설명
            pstmt.setString(4, itemBean.getItem_content2()); //상품상세설명
            pstmt.setString(5, itemBean.getItem_BGpic()); //상품 대표그림
            pstmt.setString(6, itemBean.getItem_pic1()); //추가이미지
            pstmt.setString(7, itemBean.getItem_display());//진열상태
            pstmt.setString(8, itemBean.getItem_sales());//판매상태
            pstmt.setString(9, itemBean.getItem_category1());//카테고리
            pstmt.setInt(10, itemBean.getItem_stock_price());//원가
            pstmt.setInt(11, itemBean.getItem_delivery_pee());//배송비
            pstmt.setInt(12, itemBean.getItem_weight()); //판매중량
            pstmt.setInt(13, itemBean.getItem_stock_count()); //재고
            pstmt.setDate(14, itemBean.getItem_Date());
            insertCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("insertItem 실패! - " + e.getMessage());
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















