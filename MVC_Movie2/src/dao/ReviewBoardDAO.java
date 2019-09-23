package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

			int num = 1;

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			sql = "INSERT INTO Review_Board VALUES (?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setInt(18,article.getReview_order_item_code());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertArticle() 에러 - " + e.getMessage());

		} finally {
			close(rs);
			close(pstmt);
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
		}

		return deleteCount;

	}

	public int insertReplyArticle(ReviewBoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = 1; // 답변글 번호
		int insertCount = 0; // 성공 여부의 리턴값을 저장할 변수

		// article 객체에서 참조글(Review_re_ref), 들여쓰기레벨(Review_re_lev), 순서번호(Review_re_seq)
		// 가져오기
		int review_re_ref = article.getReview_re_ref();
		int review_re_lev = article.getReview_re_lev();
		int review_re_seq = article.getReview_re_seq();
		String review_replycount = article.getReview_replycount();

		try {
			// 현재 게시물에서 가장 큰 번호 조회
			String sql = "SELECT MAX(review_num) FROM Review_Board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// ResultSet 객체가 존재할 경우(조회 성공할 경우) => 현재 게시물 가장 큰번호 + 1 값을 num 에 저장
			// => 객체가 없을 경우 기본값 num = 1
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			// 동일한 참조글(Review_re_ref)에 대한 기존 답글의 순서번호 값을 모두 1씩 증가시킴
			// => 최신 글이 seq 번호가 가장 낮은 값(1)이어야 하므로 기존 답글들의 값을 전부 +1 시킴
			sql = "UPDATE Review_Board SET review_re_seq=review_re_seq+1 WHERE review_re_ref=? AND review_re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_re_ref);
			pstmt.setInt(2, review_re_seq);
			int updateCount = pstmt.executeUpdate();

			if (updateCount > 0) {
				commit(con);
			}

			// 새 답글에 대한 순서 번호, 들여쓰기 레벨 1 증가시킴
			review_re_seq += 1;
			review_re_lev += 1;

			// 답변글 등록 => 파일을 제외한 나머지 등록
			System.out.println("리플라이등록DAO왔다");
			sql = "INSERT INTO Review_Board VALUES (?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getReview_subject());
			pstmt.setString(3, article.getReview_content());
			pstmt.setString(4, article.getReview_writer());
			pstmt.setString(5, article.getReview_id());
			pstmt.setString(6, article.getReview_pass());
			pstmt.setInt(7, 0);
			pstmt.setString(8, "");
			pstmt.setString(9, "");
			pstmt.setString(10, "");
			pstmt.setString(11, "");
			pstmt.setString(12, "");
			pstmt.setInt(13, article.getReview_starPoint());
			pstmt.setInt(14, article.getReview_orderNo());
			pstmt.setInt(15, review_re_ref);
			pstmt.setInt(16, review_re_lev);
			pstmt.setInt(17, review_re_seq);
			pstmt.setString(18, review_replycount);
			insertCount = pstmt.executeUpdate();
            
			isUpdateReply(article);
			System.out.println("*글번호: " + review_re_ref + "리플라이카운트: " + review_replycount);
			
		} catch (SQLException e) {

			System.out.println("insertReplyArticle() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}
  //답글 달렸는지 여부 1이면 달린거 0이면 안달린거
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
		}

		return updateCount;
	}
}