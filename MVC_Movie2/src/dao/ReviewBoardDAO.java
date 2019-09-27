package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AdminBoardSearchBean;
import vo.CommentBean;
import vo.ReviewBoardBean;

public class ReviewBoardDAO {
	private static ReviewBoardDAO instance;

	private ReviewBoardDAO() {
	}

	public static ReviewBoardDAO getInstance() {
		if (instance == null) {
			instance = new ReviewBoardDAO();
		}
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 글 등록
	public int insertArticle(ReviewBoardBean article) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int insertCount = 0;

		try {
			String sql = "SELECT MAX(review_num) FROM Review_Board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(article.getReview_subject());
			System.out.println(article.getReview_order_item_code());
			int num = 1;

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			sql = "INSERT INTO Review_Board (" + "review_num," + "review_subject," + "review_content,"
					+ "review_writer," + "review_id," + "review_pass," + "review_readcount," + "review_file1,"
					+ "review_file2," // 10
					+ "review_file3," + "review_file4," + "review_file5," + "review_starPoint," + "review_orderNo,"
					+ "review_re_ref," + "review_re_lev," + "review_re_seq," + "review_replycount,"
					+ "review_order_item_code, " + "review_date)" + "VALUES(?,?,?,?,?,?," + "?,?,?,?,?,?,?,"
					+ "?,?,?,?,?,?,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getReview_subject());
			pstmt.setString(3, article.getReview_content());
			pstmt.setString(4, article.getReview_writer());
			pstmt.setString(5, article.getReview_id());
			pstmt.setString(6, article.getReview_pass());
			pstmt.setInt(7, 0);
			pstmt.setString(8, article.getReview_file1());
			pstmt.setString(9, article.getReview_file2());
			pstmt.setString(10, article.getReview_file3());
			pstmt.setString(11, article.getReview_file4());
			pstmt.setString(12, article.getReview_file5());
			pstmt.setInt(13, article.getReview_starPoint());
			pstmt.setInt(14, article.getReview_orderNo());
			pstmt.setInt(15, num);
			pstmt.setInt(16, 0);
			pstmt.setInt(17, 0);
			pstmt.setString(18, "0");
			pstmt.setInt(19, article.getReview_order_item_code());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertArticle() 에러 - " + e.getMessage());

		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return insertCount;
	}

	public int selectListCount() {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM Review_Board";
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

	public ReviewBoardBean selectArticle(int Review_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewBoardBean boardBean = null;

		try {
			String sql = "SELECT * FROM Review_Board WHERE Review_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Review_num);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 조회된 게시물이 있을 경우
				boardBean = new ReviewBoardBean();
				boardBean.setReview_num(rs.getInt("review_num"));
				boardBean.setReview_writer(rs.getString("review_writer"));
				boardBean.setReview_id(rs.getString("review_id"));
				boardBean.setReview_subject(rs.getString("review_subject"));
				boardBean.setReview_content(rs.getString("review_content"));
				boardBean.setReview_file1(rs.getString("review_file1"));
				boardBean.setReview_readcount(rs.getInt("review_readcount"));
				boardBean.setReview_date(rs.getDate("review_date"));
				boardBean.setReview_pass(rs.getString("review_pass"));
				boardBean.setReview_starPoint(rs.getInt("review_starPoint"));
				boardBean.setReview_orderNo(rs.getInt("review_orderNo"));
				boardBean.setReview_re_ref(rs.getInt("review_re_ref"));
				boardBean.setReview_re_lev(rs.getInt("review_re_lev"));
				boardBean.setReview_re_seq(rs.getInt("review_re_seq"));
			}
		} catch (SQLException e) {
			System.out.println("selectArticle() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return boardBean;

	}

	public ArrayList<ReviewBoardBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ReviewBoardBean> articleList = new ArrayList<ReviewBoardBean>();

		int startRow = (page - 1) * 10;

		try {

			String sql = "SELECT * FROM Review_Board ORDER BY review_re_ref DESC,review_re_seq ASC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewBoardBean boardBean = new ReviewBoardBean();
				boardBean.setReview_num(rs.getInt("review_num"));
				boardBean.setReview_writer(rs.getString("review_writer"));
				boardBean.setReview_subject(rs.getString("review_subject"));
				boardBean.setReview_content(rs.getString("review_content"));
				boardBean.setReview_file1(rs.getString("review_file1"));
				boardBean.setReview_readcount(rs.getInt("review_readcount"));
				boardBean.setReview_date(rs.getDate("review_date"));
				boardBean.setReview_starPoint(rs.getInt("review_starPoint"));
				boardBean.setReview_re_ref(rs.getInt("review_re_ref"));
				boardBean.setReview_re_lev(rs.getInt("review_re_lev"));
				boardBean.setReview_re_seq(rs.getInt("review_re_seq"));
				articleList.add(boardBean);
			}

		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return articleList;
	}

	// 조회수
	public int updateReadCount(int review_num) {
		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update Review_Board set review_readcount= review_readcount+1 where  review_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("updateReadCount() 에러 - " + e.getMessage());
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public boolean isArticleBoardWriter(int review_num, String review_pass) {

		boolean isArticleWriter = false;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 게시물 번호에 해당하는 패스워드가 존재하는지 검색
			String sql = "SELECT * FROM Review_Board WHERE review_num=? AND review_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			pstmt.setString(2, review_pass);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isArticleWriter = true;
			}

		} catch (SQLException e) {
			System.out.println("isArticleBoardWriter() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return isArticleWriter;
	}

	public int isUpdateArticle(ReviewBoardBean article) {
		int updateCount = 0;

		PreparedStatement pstmt = null;

		try {
			// 글 번호에 해당하는 레코드에 대해 제목(subject), 내용(content) 수정 후 결과값 리턴
			String sql = "UPDATE Review_Board SET review_subject=?,review_content=?,review_starPoint=? WHERE review_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getReview_subject());
			pstmt.setString(2, article.getReview_content());
			pstmt.setInt(3, article.getReview_starPoint());
			pstmt.setInt(4, article.getReview_num());
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("isUpdateArticle() 에러 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(con);
		}

		return updateCount;
	}

	public int deleteArticle(int review_num) {
		PreparedStatement pstmt = null;

		int deleteCount = 0;

		try {
			String sql = "DELETE FROM Review_Board WHERE review_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteArticle() 에러 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(con);
		}

		return deleteCount;

	}

	public int insertCommentArticle(CommentBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("dao댓글까지 잘 왔음");
		int insertCount = 0;
		try {
			String sql = "select max(comment_num) from Review_comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int num = 1;
			if (rs.next()) {
				num = rs.getInt("max(comment_num)") + 1;
			}

			sql = "insert into Review_comment(comment_num,comment_id,comment_pass,comment_content,comment_review_num,comment_writer,comment_date) "
					+ "values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getComment_id());
			pstmt.setString(3, article.getComment_pass());
			pstmt.setString(4, article.getComment_content());
			pstmt.setInt(5, article.getComment_review_num());
			pstmt.setString(6, article.getComment_writer());

			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertReplyArticle() 에러 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(con);
		}

		return insertCount;
	}

	// 답글 달렸는지 여부 1이면 달린거 0이면 안달린거
	public int isUpdateReply(ReviewBoardBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		int review_re_ref = article.getReview_re_ref();
		try {
			// 글 번호에 해당하는 레코드에 대해 제목(subject), 내용(content) 수정 후 결과값 리턴
			String sql = "UPDATE Review_Board SET review_replycount=? WHERE review_re_ref=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "1");
			pstmt.setInt(2, review_re_ref);
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("isUpdateArticle() 에러 - " + e.getMessage());
		} finally {
			close(pstmt);
			close(con);
		}

		return updateCount;
	}

	public ArrayList<CommentBean> selectCommentList(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();

		try {
           System.out.println("DAO에서!!!!"+num);
			String sql = "SELECT * FROM Review_comment where comment_review_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentBean cb2 = new CommentBean();
				cb2.setComment_content(rs.getString("comment_content"));
	
				cb2.setComment_id(rs.getString("comment_id"));
				cb2.setComment_writer(rs.getString("comment_writer"));
				cb2.setComment_date(rs.getDate("comment_date"));
			
				commentList.add(cb2);
			}
			System.out.println("코멘트 담긴거 확인:" + commentList);
		} catch (SQLException e) {
			System.out.println("MemberDAO: selectMemberList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return commentList;
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
			close(con);
		}

		return listCount;
	}

	// 어드민 보드리스트 조회
	public ArrayList<ReviewBoardBean> selectBoardList(AdminBoardSearchBean abs) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewBoardBean> boardlist = new ArrayList<ReviewBoardBean>();
		
		int startRow = (abs.getPage() - 1) * 10;

		try {

			String sql = "SELECT * FROM Review_Board where "
			        + "review_subject like ifnull(?,'%%') "
					+ "and review_date >= ?"
			        + "and review_date <= ?"
			        + "and review_writer like ifnull(?,'%%') "
			        + "and review_replycount like ifnull(?,'%%')";
//			        + "and review_file1 like ifnull(?,'%%') ";
//			        + "ORDER BY order_item_code LIMIT ?,?"; 답글달렸는지여부 아직체크 안함, 이미지여부도..
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, abs.getOrder_item_option_color());
			System.out.println(abs.getBoard_title());
			pstmt.setString(1, abs.getBoard_title());
			pstmt.setDate(2, abs.getPickStart());
			pstmt.setDate(3, abs.getPickEnd());
			pstmt.setString(4, abs.getBoard_writer());
			pstmt.setString(5, abs.getBoard_replyCheck());
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+abs.getLimit());

			while (rs.next()) {
				ReviewBoardBean listBean = new ReviewBoardBean();
		        listBean.setReview_subject(rs.getString("review_subject"));
		        listBean.setReview_writer(rs.getString("review_writer"));
		        listBean.setReview_date(rs.getDate("review_date"));
		        listBean.setReview_num(rs.getInt("review_num"));
		        listBean.setReview_re_lev(rs.getInt("review_re_lev"));
		        listBean.setReview_replycount(rs.getString("review_replycount"));
		        boardlist.add(listBean);
			}
			System.out.println("OrderDAO: orderList 담긴거 확인:" + boardlist);
		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return boardlist;
	}
}