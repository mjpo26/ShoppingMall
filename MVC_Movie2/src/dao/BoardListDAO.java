package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AdminBoardSearchBean;
import vo.MemberBean;
import vo.ReviewBoardBean;

public class BoardListDAO {
	// -----------------------------------------------------
	// DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
	private static BoardListDAO instance;

	private BoardListDAO() {
	}

	public static BoardListDAO getInstance() {
		// 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
		if (instance == null) {
			instance = new BoardListDAO();
		}

		return instance;
	}
	// -----------------------------------------------------

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int getBoardCount(AdminBoardSearchBean abs) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String board_list = abs.getBoard_list();

		String sql = "SELECT COUNT(*) FROM Review_Board";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("게시판 글 갯수는"+listCount);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	// 어드민 보드리스트 조회
	public ArrayList<ReviewBoardBean> selectMemberList(AdminBoardSearchBean abs) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewBoardBean> boardlist = new ArrayList<ReviewBoardBean>();
		
		int startRow = (abs.getPage() - 1) * 10;

		try {

			String sql = "SELECT * FROM Review_Board where "
			        + "review_subject like ifnull(?,'%%') "
			        + "and review_writer like ifnull(?,'%%') ";
//			        + "and review_file1 like ifnull(?,'%%') ";
//			        + "ORDER BY order_item_code LIMIT ?,?"; 답글달렸는지여부 아직체크 안함, 이미지여부도..
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, abs.getOrder_item_option_color());
			pstmt.setString(1, abs.getBoard_title());
			pstmt.setString(2, abs.getBoard_writer());
			
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+abs.getLimit());

			while (rs.next()) {
				ReviewBoardBean listBean = new ReviewBoardBean();
		        listBean.setReview_subject(rs.getString("review_subject"));
		        listBean.setReview_writer(rs.getString("review_writer"));
		        boardlist.add(listBean);
			}
			System.out.println("OrderDAO: orderList 담긴거 확인:" + boardlist);
		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return boardlist;
	}
}
