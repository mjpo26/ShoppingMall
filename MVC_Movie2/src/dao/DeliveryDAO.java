package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import vo.Admin_DeliveryListBean;

import static db.JdbcUtil.*;

public class DeliveryDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static DeliveryDAO instance;
    private DeliveryDAO() {}
    
    public static DeliveryDAO getInstance() {
        // 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new DeliveryDAO();
        }
        
        return instance;
    }
    // -----------------------------------------------------

    Connection con;
    
    public void setConnection(Connection con) {
        this.con = con;
    }

    public int getDeliveryCount(Admin_DeliveryListBean adb) {
    	int listCount = 0;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String Delivery_title = adb.getDelivery_title();
    	  	
    	String sql = "SELECT COUNT(*) FROM Delivery where Delivery_title=?";
    	try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Delivery_title);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("배송 개수 : "+adb.getDelivery_title()+"갯수는"+listCount);
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
    public ArrayList<Admin_DeliveryListBean> selectDelivery(Admin_DeliveryListBean adb) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Admin_DeliveryListBean> deliveryList = new ArrayList<Admin_DeliveryListBean>();
		
		
		int startRow = (adb.getPage() - 1) * 10; 
		
		try {
			
			
//setInt 처리하는거는 나중에 시간나면 하면 된다.
//지금은 무조건 전체페이지 연결부터 해야 일이 될거야.		    
//텍스트박스 공백 들어오는건 세터에서 null 처리해주면되더라.
//누군가 시간 남는 사람이 고민한 번 해 보도록^^;
//이런거 생각해보고 짜는 것이 공부가 될꺼야.
		    
			String sql = "SELECT * FROM Delivery where "
			        + "Delivery_code like ifnull(?,'%%') "
			        + "and Delivery_member_id like ifnull(?,'%%') "
			        + "and Delivery_title like ifnull(?,'%%') "
			        + "and Delivery_ok like ifnull(?,'%%') "
			        + "and Delivery_bank like ifnull(?,'%%')"
			        + "ORDER BY Delivery_code LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, adb.getDelivery_code());
			pstmt.setString(2, adb.getDelivery_member_id());
			pstmt.setString(3, adb.getDelivery_title());
			pstmt.setString(4, adb.getDelivery_ok());
			pstmt.setString(5, adb.getDelivery_bank());
			pstmt.setInt(6, startRow);
			pstmt.setInt(7, adb.getLimit());

			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+adb.getLimit());
			
			while (rs.next()) {
				Admin_DeliveryListBean deliveryBean = new Admin_DeliveryListBean();
				deliveryBean.setDelivery_date(rs.getDate("delivery_date"));
				deliveryBean.setDelivery_code(rs.getString("delivery_code"));
				deliveryBean.setDelivery_title(rs.getString("delivery_title"));
				deliveryBean.setDelivery_member_id(rs.getString("delivery_member_id"));
				deliveryBean.setDelivery_sel_price(rs.getString("delivery_sel_price"));
				deliveryBean.setDelivery_bank(rs.getString("delivery_bank"));
				deliveryBean.setDelivery_ok(rs.getString("delivery_ok"));
				deliveryBean.setDelivery_memo(rs.getString("delivery_memo"));		
				deliveryList.add(deliveryBean);
			}
			System.out.println("mDAO: 멤버빈 담긴거 확인:" +deliveryList);
		} catch (SQLException e) {
			System.out.println("MemberDAO: selectMemberList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return deliveryList;
	}

  
    
}
