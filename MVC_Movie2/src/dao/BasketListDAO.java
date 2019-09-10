package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BasketListBean;
import vo.OrderListBean;

public class BasketListDAO {
	private static BasketListDAO instance;

	private BasketListDAO() {
	}

	public static BasketListDAO getInstance() {
		if (instance == null) {
			instance = new BasketListDAO();
		}
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int selectListCount() {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM basket";
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
	public ArrayList<BasketListBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BasketListBean> articleList = new ArrayList<BasketListBean>();

		int startRow = (page - 1) * 10; 
	
		try {
			String sql = "SELECT * FROM basket ORDER BY basket_idx LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BasketListBean listBean = new BasketListBean();
				listBean.setBasket_code(rs.getInt("Basket_code"));
				listBean.setBasket_member_id(rs.getString("Basket_member_id"));
				listBean.setBasket_title(rs.getString("Basket_title"));
				listBean.setBasket_option_color(rs.getString("Basket_option_color"));
				listBean.setBasket_option_size(rs.getString("Basket_option_size"));
				listBean.setBasket_code_count(rs.getInt("Basket_code_count"));
				listBean.setBasket_sel_price(rs.getInt("Basket_sel_price"));
				listBean.setBasket_new_price(rs.getInt("Basket_new_price"));
				listBean.setBasket_point(rs.getInt("Basket_point"));
				listBean.setBasket_delivery_pee(rs.getInt("Basket_delivery_pee"));
				listBean.setBasket_date(rs.getDate("Basket_date"));
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

	public int insertItem(BasketListBean basketListBean, String sId) {
		int insertCount = 0;

		PreparedStatement pstmt = null;

		String sql = "INSERT INTO basket(basket_code,basket_member_id,basket_title,basket_sel_price,"
				+ "basket_new_price,basket_point,basket_code_count,basket_delivery_pee) VALUES(?,?,?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, basketListBean.getBasket_code());// 상품명
			pstmt.setString(2, basketListBean.getBasket_member_id()); // 회원아이디
			pstmt.setString(3, basketListBean.getBasket_title()); // 상품명
			pstmt.setInt(4, basketListBean.getBasket_sel_price()); //판매할인후가격
			pstmt.setInt(5, basketListBean.getBasket_new_price()); // 판매정가
			pstmt.setInt(6, basketListBean.getBasket_point()); // 적립금
			pstmt.setInt(7, basketListBean.getBasket_code_count()); // 상품선택수량
			pstmt.setInt(8, basketListBean.getBasket_delivery_pee()); // 배송비
			
			insertCount = pstmt.executeUpdate();
			System.out.println("DB성공");
		} catch (SQLException e) {
			System.out.println("insertItem 실패! - " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return insertCount;
	}
}
