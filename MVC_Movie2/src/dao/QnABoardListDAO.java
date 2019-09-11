package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AdminBoardSearchBean;
import vo.QnA_BoardBean;

public class QnABoardListDAO {
	
	private static QnABoardListDAO instance;

	private QnABoardListDAO() {
	}

	public static QnABoardListDAO getInstance() {
		// 기존의 MemberDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
		if (instance == null) {
			instance = new QnABoardListDAO();
		}
		return instance;
	}
	// -----------------------------------------------------

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int getBoardCount(AdminBoardSearchBean abb) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String board_list = abb.getBoard_list();

		String sql = "SELECT COUNT(*) FROM QnA_Board";
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


	public ArrayList<QnA_BoardBean> selectBoardList(AdminBoardSearchBean abb) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QnA_BoardBean> Qboardlist = new ArrayList<QnA_BoardBean>();
		
		int startRow = (abb.getPage() - 1) * 10;

		try {

			String sql = "SELECT * FROM QnA_Board where "
			        + "QnA_subject like ifnull(?,'%%') "
			        + "and QnA_writer_id like ifnull(?,'%%') "
			        +"and QnA_replycount like ifnull(?,'%%')";
//			        + "and QnA_file1 like ifnull(?,'%%') ";
//			        + "ORDER BY order_item_code LIMIT ?,?"; 답글달렸는지여부 아직체크 안함, 이미지여부도..
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, abs.getOrder_item_option_color());
			pstmt.setString(1, abb.getBoard_title());
			pstmt.setString(2, abb.getBoard_writer());
			pstmt.setString(3, abb.getBoard_replyCheck());
			
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+abb.getLimit());

			while (rs.next()) {
				QnA_BoardBean listBean = new QnA_BoardBean();
		        listBean.setQnA_subject(rs.getString("QnA_subject"));
		        listBean.setQnA_writer_id(rs.getString("QnA_writer_id"));
		        listBean.setQnA_date(rs.getDate("QnA_date"));
		        listBean.setQnA_num(rs.getInt("QnA_num"));
		        listBean.setQnA_re_lev(rs.getInt("QnA_re_lev"));
		        listBean.setQnA_replycount(rs.getString("QnA_replycount"));
		        Qboardlist.add(listBean);
			}
			System.out.println("OrderDAO: orderList 담긴거 확인:" + Qboardlist);
		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return Qboardlist;
	}

}
