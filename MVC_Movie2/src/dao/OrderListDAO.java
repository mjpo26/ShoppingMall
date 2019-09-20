package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.OrderListBean;
import vo.OrderListBean;
import vo.OrderSearchBean;

public class OrderListDAO {
	// -----------------------------------------------------
	
	private static OrderListDAO instance;

	private OrderListDAO() {
	}

	public static OrderListDAO getInstance() {
		if (instance == null) {
			instance = new OrderListDAO();
		}
		return instance;
	}

	// -----------------------------------------------------
	
	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int selectListCount(OrderSearchBean ob) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String order_member_id=ob.getOrder_member_id();
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_member_id);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_member_id()+"갯수는"+listCount);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}
	
	// Admin OrderList Select
	public ArrayList<OrderListBean> selectArticleList(OrderSearchBean ob) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<OrderListBean> articleList = new ArrayList<OrderListBean>();

		int startRow = (ob.getPage() - 1) * 10;

		try {

			System.out.println("디에오 체크/"+ob.getPickStart() + "/" +ob.getPickEnd());
			
			String sql = "SELECT * FROM item_order where "
			        + "order_item_code like ifnull(?,'%%') "
					+ "and order_date >= ?"
					+ "and order_date <= ?"
			        + "and order_item_title like ifnull(?,'%%') "
			        + "and order_member_id like ifnull(?,'%%') "
			        + "and order_pay_status like ifnull(?,'%%') "
			        + "and order_delivery_status like ifnull(?,'%%')"
			        + "and order_item_status like ifnull(?,'%%')"
			        + "and order_bank like ifnull(?,'%%')"
			        + "and order_payment like ifnull(?,'%%')"
			        + "ORDER BY order_item_code LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, ob.getOrder_item_option_color());
			pstmt.setString(1, ob.getOrder_item_code());
			pstmt.setDate(2, ob.getPickStart());
			pstmt.setDate(3, ob.getPickEnd());
			pstmt.setString(4, ob.getOrder_item_title());
			pstmt.setString(5, ob.getOrder_member_id());
			pstmt.setString(6, ob.getOrder_pay_status());
			pstmt.setString(7, ob.getOrder_delivery_status());
			pstmt.setString(8, ob.getOrder_item_status());
			pstmt.setString(9, ob.getOrder_bank());
			pstmt.setString(10, ob.getOrder_payment());
			pstmt.setInt(11, startRow);
			pstmt.setInt(12, ob.getLimit());
			
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+ob.getLimit());

			while (rs.next()) {
				OrderListBean listBean = new OrderListBean();
				listBean.setOrder_date(rs.getDate("order_date"));
				listBean.setOrder_idx(rs.getInt("order_idx"));
				listBean.setOrder_item_title(rs.getString("order_item_title"));
				listBean.setOrder_member_id(rs.getString("order_member_id"));
				listBean.setOrder_pay_status(rs.getString("order_pay_status"));
				listBean.setOrder_item_sel_price(rs.getInt("order_item_sel_price"));
				listBean.setOrder_bank(rs.getString("order_bank"));
				listBean.setOrder_payment(rs.getString("order_payment"));
				listBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
				listBean.setOrder_item_status(rs.getString("order_item_status"));
				listBean.setOrder_memo(rs.getString("order_memo"));
				articleList.add(listBean);
			}
			
			System.out.println("OrderDAO: orderList 담긴거 확인:" + articleList);
		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}
	
	public int selectdelivery1_Count(OrderSearchBean ob) {
		int delivery1_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_start="입금전";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_start);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery1_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery1_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return delivery1_Count;
	}
	
	public int selectdelivery2_Count(OrderSearchBean ob) {
		int delivery2_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_before="배송전";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_before);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery2_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery2_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return delivery2_Count;
	}
	
	public int selectdelivery3_Count(OrderSearchBean ob) {
		int delivery3_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_ing="배송중";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_ing);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery3_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery3_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return delivery3_Count;
	}
	
	public int selectdelivery4_Count(OrderSearchBean ob) {
		int delivery4_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_end="배송완료";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_end);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery4_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery4_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return delivery4_Count;
	}

	public ArrayList<OrderListBean> selectArticleList(String sId) {
		 PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        ArrayList<OrderListBean> articleList = new ArrayList<OrderListBean>();

	         
	        
	        try {
	            String sql = "SELECT * FROM item_order where order_member_id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, sId);
	            rs = pstmt.executeQuery();
	            

	            while(rs.next()) {
	            	OrderListBean orderListBean = new OrderListBean();
	            	orderListBean.setOrder_idx(rs.getInt("order_idx"));
	            	orderListBean.setOrder_item_title(rs.getString("order_item_title"));
	            	orderListBean.setOrder_item_option_color(rs.getString("order_item_option_color"));
	            	orderListBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
	                orderListBean.setOrder_date(rs.getDate("order_date"));
	            	articleList.add(orderListBean);
	            }
	            
	        } catch (SQLException e) {
	            System.out.println("selectArticleList() - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        
	        
	        return articleList;
		}
	
}
