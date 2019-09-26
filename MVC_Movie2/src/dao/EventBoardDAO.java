package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CommentBean;
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

	public ArrayList<EventBean> selectEventList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<EventBean> eventList = new ArrayList<EventBean>();

		try {

			String sql = "SELECT * FROM event_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				EventBean cb = new EventBean();
				cb.setEvent_content(rs.getString("event_content"));
				cb.setEvent_date(rs.getDate("event_date"));
				cb.setEvent_banner(rs.getString("event_banner"));
				cb.setEvent_banner2(rs.getString("event_banner2"));
				cb.setEvent_imageBackground(rs.getString("event_imageBackground"));
				cb.setEvent_imageMain(rs.getString("event_imageMain"));
				cb.setEvent_status(rs.getString("event_status"));
				cb.setEvent_subject(rs.getString("event_subject"));
				cb.setEvent_summary(rs.getString("event_summary"));
				eventList.add(cb);
			}
			System.out.println("코멘트 담긴거 확인:" + eventList);
		} catch (SQLException e) {
			System.out.println("EventDAO: selectMemberList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return eventList;
	}

}
