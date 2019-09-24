package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BasketListBean;
import vo.ItemBean;
import vo.MemberBean;
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
		System.out.println("DB접속");
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO basket(basket_code,basket_member_id,basket_title,basket_sel_price,"
				+ "basket_new_price,basket_point,basket_code_count,basket_delivery_pee,basket_date) VALUES(?,?,?,?,?,?,?,?,now())";

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

	public BasketListBean selectBasketInfo(String member_id) {
		BasketListBean basketListBean = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT * FROM basket WHERE basket_member_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                basketListBean = new BasketListBean();
                basketListBean.setBasket_idx(rs.getInt("basket_idx"));
                basketListBean.setBasket_code(rs.getInt("basket_code"));
                basketListBean.setBasket_member_id(rs.getString("basket_member_id"));
                basketListBean.setBasket_title(rs.getString("basket_title"));
                basketListBean.setBasket_sel_price(rs.getInt("basket_sel_price"));
                basketListBean.setBasket_new_price(rs.getInt("basket_new_price"));
                basketListBean.setBasket_point(rs.getInt("basket_point"));
                basketListBean.setBasket_code_count(rs.getInt("basket_code_count"));
                basketListBean.setBasket_delivery_pee(rs.getInt("basket_delivery_pee"));
                basketListBean.setBasket_date(rs.getDate("basket_date"));
                
            }
            
        } catch (SQLException e) {
            System.out.println("selectBasketInfo 실패! - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return basketListBean;
        
    }

	public ArrayList<BasketListBean> selectArticleList(String member_id) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ArrayList<BasketListBean> articleList = new ArrayList<BasketListBean>();

         
        
        try {
            String sql = "SELECT * FROM basket where basket_member_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            

            while(rs.next()) {
            	BasketListBean basketListBean = new BasketListBean();
                 basketListBean.setBasket_idx(rs.getInt("basket_idx"));
                 basketListBean.setBasket_code(rs.getInt("basket_code"));
                 basketListBean.setBasket_member_id(rs.getString("basket_member_id"));
                 basketListBean.setBasket_title(rs.getString("basket_title"));
                 basketListBean.setBasket_sel_price(rs.getInt("basket_sel_price"));
                 basketListBean.setBasket_new_price(rs.getInt("basket_new_price"));
                 basketListBean.setBasket_point(rs.getInt("basket_point"));
                 basketListBean.setBasket_code_count(rs.getInt("basket_code_count"));
                 basketListBean.setBasket_delivery_pee(rs.getInt("basket_delivery_pee"));
                 basketListBean.setBasket_date(rs.getDate("basket_date"));
                
                articleList.add(basketListBean);
            }
            
        } catch (SQLException e) {
            System.out.println("selectArticleList() - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        
        return articleList;
	}
	public int deleteMember(String id) {
        // id, password 에 해당하는 레코드가 있으면 삭제 (pass따로 받아와서 비번확인구현)
        System.out.println("딜리트멤버디에이오 왔나 id는 " +id);
        int deleteCount = 0;
        
        PreparedStatement pstmt = null;
       
        
        String sql = "DELETE FROM basket where basket_idx = ?";//나중에 AND로 비번검사
        
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

	public BasketListBean selectInfo(int bId) {
		 
		 BasketListBean basketListBean =null; 
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        try {
	            String sql = "SELECT * FROM basket WHERE basket_idx=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, bId);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()) {
	            	   basketListBean = new BasketListBean();
	            	   basketListBean.setBasket_idx(rs.getInt("basket_idx"));
	                   basketListBean.setBasket_code(rs.getInt("basket_code"));
	                   basketListBean.setBasket_title(rs.getString("basket_title"));
	                   basketListBean.setBasket_sel_price(rs.getInt("basket_sel_price"));
	                   basketListBean.setBasket_new_price(rs.getInt("basket_new_price"));
	                   basketListBean.setBasket_point(rs.getInt("basket_point"));
	                   basketListBean.setBasket_option_color(rs.getString("basket_option_color"));
	                   basketListBean.setBasket_code_count(rs.getInt("basket_code_count"));
	                   basketListBean.setBasket_delivery_pee(rs.getInt("basket_delivery_pee"));
	                   basketListBean.setBasket_date(rs.getDate("basket_date"));
	            }
	            
	        } catch (SQLException e) {
	        	System.out.println(basketListBean.getBasket_title());
	        	System.out.println(basketListBean.getBasket_idx());
	        	System.out.println(basketListBean.getBasket_code());
	        	System.out.println(basketListBean.getBasket_point());
	        	
	            System.out.println("selectMemberInfo 실패! - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        
	        return basketListBean;
	}

}
