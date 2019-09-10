package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.OrderListBean;
import vo.OrderSearchBean;

public class OrderListDAO {
	private static OrderListDAO instance;

	private OrderListDAO() {
	}

	public static OrderListDAO getInstance() {
		if (instance == null) {
			instance = new OrderListDAO();
		}
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int selectListCount(OrderSearchBean ob) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String order_item_option_color=ob.getOrder_item_option_color();

		try {
			String sql = "SELECT COUNT(*) FROM item_order ";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			//	System.out.println("색깔은"+ob.getOrder_item_option_color()+"갯수는"+listCount);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<OrderListBean> selectArticleList(OrderSearchBean ob) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<OrderListBean> articleList = new ArrayList<OrderListBean>();

		int startRow = (ob.getPage() - 1) * 10;

		try {

			String sql = "SELECT * FROM item_order ORDER BY order_idx LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, startRow);
			//pstmt.setInt(2, ob.getLimit());
//			pstmt.setString(1, ob.getOrder_item_option_color());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, ob.getLimit());
			
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+ob.getLimit());

			while (rs.next()) {
				OrderListBean listBean = new OrderListBean();
				listBean.setOrder_date(rs.getDate("order_date"));
				listBean.setOrder_idx(rs.getInt("order_idx"));
				listBean.setOrder_member_id(rs.getString("order_member_id"));
				listBean.setOrder_item_title(rs.getString("order_item_title"));
				listBean.setOrder_pay_status(rs.getString("order_pay_status"));
				listBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
				listBean.setOrder_payment(rs.getString("order_payment"));
				listBean.setOrder_memo(rs.getString("order_memo"));
				listBean.setOrder_item_option_color(rs.getString("order_item_option_color"));
				articleList.add(listBean);
			}

		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}
}
