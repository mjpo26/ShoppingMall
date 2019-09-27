package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CommentBean;
import vo.EventBean;
import vo.ReviewBoardBean;

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

	public int selectListCount() {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM event_board";
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

	public ArrayList<EventBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<EventBean> articleList = new ArrayList<EventBean>();

		int startRow = (page - 1) * 10;

		try {

			String sql = "SELECT * FROM event_board order by event_num desc";
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
				cb.setEvent_num(rs.getInt("event_num"));
				articleList.add(cb);
			}

		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	public int updateReadCount(int event_num) {
		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update event_board set event_readcount= event_readcount+1 where  event_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("updateReadCount() 에러 - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public EventBean selectArticle(int event_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventBean cb = null;

		try {
			String sql = "SELECT * FROM event_board WHERE event_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event_num);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 조회된 게시물이 있을 경우
				 cb = new EventBean();
				cb.setEvent_content(rs.getString("event_content"));
				cb.setEvent_date(rs.getDate("event_date"));
				cb.setEvent_banner(rs.getString("event_banner"));
				cb.setEvent_banner2(rs.getString("event_banner2"));
				cb.setEvent_imageBackground(rs.getString("event_imageBackground"));
				cb.setEvent_imageMain(rs.getString("event_imageMain"));
				cb.setEvent_status(rs.getString("event_status"));
				cb.setEvent_subject(rs.getString("event_subject"));
				cb.setEvent_summary(rs.getString("event_summary"));
				cb.setEvent_num(rs.getInt("event_num"));
	
			}
		} catch (SQLException e) {
			System.out.println("selectArticle() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
//			close(con);
		}

		return cb;
	}

	public int isUpdateArticle(EventBean article){
        int updateCount = 0;
        
        PreparedStatement pstmt = null;
        
        try {
            // 글 번호에 해당하는 레코드에 대해 제목(subject), 내용(content) 수정 후 결과값 리턴
           System.out.println("isupdatearticle왔다 수정글 ["+article+"]가져오나");
            String sql = "UPDATE event_board SET event_subject=?,event_content=?,event_summary=?,event_status=?,event_imageMain=?,"
            		+ "event_imageBackground=?, event_banner=?, event_banner2=?  WHERE event_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, article.getEvent_subject());
            pstmt.setString(2, article.getEvent_content());
    		pstmt.setString(3, article.getEvent_summary());
    		pstmt.setString(4, article.getEvent_status());
        	pstmt.setString(5, article.getEvent_imageMain());
			pstmt.setString(6, article.getEvent_imageBackground());
			pstmt.setString(7, article.getEvent_banner());
			pstmt.setString(8, article.getEvent_banner2());
			pstmt.setInt(9, article.getEvent_num());
		
			
            updateCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("isUpdateArticle() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return updateCount;
    }
}
