package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ItemBean;

import static db.JdbcUtil.*;

public class ItemDAO {
	// -----------------------------------------------------
	// DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
	private static ItemDAO instance;

	private ItemDAO() {
	}

	public static ItemDAO getInstance() {
		// 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
		if (instance == null) {
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

		String sql = "INSERT INTO Item(Item_title,Item_old_price,Item_content1,Item_content2,"
				+ "Item_bgpic,Item_pic1,Item_display,Item_sales,Item_category1,Item_stock_price,"
				+ "Item_delivery_pee,Item_weight,Item_stock_count,Item_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemBean.getItem_title());// 상품명
			pstmt.setInt(2, itemBean.getItem_old_price()); // 판매가(정가)
			pstmt.setString(3, itemBean.getItem_content1());// 상품요약설명
			pstmt.setString(4, itemBean.getItem_content2()); // 상품상세설명
			pstmt.setString(5, itemBean.getItem_bgpic()); // 상품 대표그림
			pstmt.setString(6, itemBean.getItem_pic1()); // 추가이미지
			pstmt.setString(7, itemBean.getItem_display());// 진열상태
			pstmt.setString(8, itemBean.getItem_sales());// 판매상태
			pstmt.setString(9, itemBean.getItem_category1());// 카테고리
			pstmt.setInt(10, itemBean.getItem_stock_price());// 원가
			pstmt.setInt(11, itemBean.getItem_delivery_pee());// 배송비
			pstmt.setInt(12, itemBean.getItem_weight()); // 판매중량
			pstmt.setInt(13, itemBean.getItem_stock_count()); // 재고
			insertCount = pstmt.executeUpdate();
			System.out.println("DB성공");
		} catch (SQLException e) {
			System.out.println("insertItem 실패! - " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return insertCount;
	}

	public int selectListCount() {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM Item";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount()  - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}



	 public ArrayList<ItemBean> selectArticleList(int page, int limit) {
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        ArrayList<ItemBean> articleList = new ArrayList<ItemBean>();

	        int startRow = (page - 1) * 10; 
	        
	        try {
	            String sql = "SELECT * FROM Item";
	            pstmt = con.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	            

	            while(rs.next()) {
	                ItemBean itemBean = new ItemBean();
	                itemBean.setItem_code(rs.getInt("Item_code"));
	                itemBean.setItem_title(rs.getString("Item_title"));
	                itemBean.setItem_category1(rs.getString("Item_category1"));
	                itemBean.setItem_content1(rs.getString("Item_content1"));
	                itemBean.setItem_content2(rs.getString("Item_content2"));
	                itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
	                itemBean.setItem_pic1(rs.getString("Item_pic1"));
	                itemBean.setItem_display(rs.getString("Item_display"));
	                itemBean.setItem_sales(rs.getString("Item_sales"));
	                itemBean.setItem_old_price(rs.getInt("Item_old_price"));
	                itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
	                itemBean.setItem_weight(rs.getInt("Item_weight"));
	                itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
	                itemBean.setItem_Date(rs.getDate("Item_Date"));
	                
	                articleList.add(itemBean);
	            }
	            
	        } catch (SQLException e) {
	            System.out.println("selectArticleList() - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        
	        
	        return articleList;
	    }

	public ItemBean selectArticle(int item_code) {
		 PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        ItemBean itemBean = null;
	        
	        try {
	            String sql = "SELECT * FROM Item WHERE Item_code=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, item_code);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()) { 
	                
	            	itemBean = new ItemBean();
	                itemBean.setItem_code(rs.getInt("Item_code"));
	                itemBean.setItem_title(rs.getString("Item_title"));
	                itemBean.setItem_category1(rs.getString("Item_category1"));
	                itemBean.setItem_content1(rs.getString("Item_content1"));
	                itemBean.setItem_content2(rs.getString("Item_content2"));

	                itemBean.setItem_bgpic(rs.getString("Item_bgpic"));
	                itemBean.setItem_pic1(rs.getString("Item_pic1"));
	                itemBean.setItem_display(rs.getString("Item_display"));
	                itemBean.setItem_sales(rs.getString("Item_sales"));
	                itemBean.setItem_old_price(rs.getInt("Item_old_price"));
	                itemBean.setItem_stock_price(rs.getInt("Item_stock_price"));
	                itemBean.setItem_weight(rs.getInt("Item_weight"));
	                itemBean.setItem_stock_count(rs.getInt("Item_stock_count"));
	                itemBean.setItem_Date(rs.getDate("Item_Date"));
	            }
	        } catch (SQLException e) {
	            System.out.println("selectArticle() ���� - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        
	        return itemBean;
	}

	public int UpdateItem(ItemBean itemBean) {
		int updateCount = 0;

		PreparedStatement pstmt = null;

		String sql = "UPDATE Item SET Item_title=?,Item_old_price=?,Item_content1=?,Item_content2=?,"
				+ "Item_bgpic=?,Item_pic1=?,Item_display=?,Item_sales=?,Item_category1=?,Item_stock_price=?,"
				+ "Item_delivery_pee=?,Item_weight=?,Item_stock_count=?,Item_date=NOW() where Item_code=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemBean.getItem_title());// 상품명
			pstmt.setInt(2, itemBean.getItem_old_price()); // 판매가(정가)
			pstmt.setString(3, itemBean.getItem_content1());// 상품요약설명
			pstmt.setString(4, itemBean.getItem_content2()); // 상품상세설명
			pstmt.setString(5, itemBean.getItem_bgpic()); // 상품 대표그림
			pstmt.setString(6, itemBean.getItem_pic1()); // 추가이미지
			pstmt.setString(7, itemBean.getItem_display());// 진열상태
			pstmt.setString(8, itemBean.getItem_sales());// 판매상태
			pstmt.setString(9, itemBean.getItem_category1());// 카테고리
			pstmt.setInt(10, itemBean.getItem_stock_price());// 원가
			pstmt.setInt(11, itemBean.getItem_delivery_pee());// 배송비
			pstmt.setInt(12, itemBean.getItem_weight()); // 판매중량
			pstmt.setInt(13, itemBean.getItem_stock_count()); // 재고
			pstmt.setInt(14, itemBean.getItem_code());
			updateCount = pstmt.executeUpdate();
			System.out.println("DB성공");
		} catch (SQLException e) {
			System.out.println("updateItem 실패! - " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return updateCount;
	}
}
