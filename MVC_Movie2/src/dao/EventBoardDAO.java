package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.EventBean;

public class EventBoardDAO {
	private static EventBoardDAO instance;

	private EventBoardDAO() {
	}

	public static EventBoardDAO getInstance() {
		if (instance == null) {
			instance = new EventBoardDAO();
		}
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertArticle(EventBean article) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int insertCount = 0;

		try {
			String sql = "SELECT MAX(event_num) FROM event_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int num = 1;

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			sql = "INSERT INTO event_board (" + "event_num," + "event_subject," + "event_content,"
				+ "event_readcount," + "event_date,"+"event_summary,"
		        +"event_status,"+"event_imageMain,"+"event_imageBackground,"+"event_banner,"
				+"event_banner2)" + "VALUES(?,?,?,?,now(),?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getEvent_subject());
			pstmt.setString(3, article.getEvent_content());
			pstmt.setInt(4, 0);
			pstmt.setString(5, article.getEvent_summary());
			pstmt.setString(6, article.getEvent_status());
			pstmt.setString(7, article.getEvent_imageMain());
			pstmt.setString(8, article.getEvent_imageBackground());
			pstmt.setString(9, article.getEvent_banner());
			pstmt.setString(10, article.getEvent_banner2());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertArticle() 에러 - " + e.getMessage());

		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

}
