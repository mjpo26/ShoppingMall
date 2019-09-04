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
			sql = "INSERT INTO Review_Board VALUES (?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?)";
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
				boardBean.setReview_num(rs.getInt("Review_num"));
				boardBean.setReview_writer(rs.getString("Review_writer"));
				boardBean.setReview_id(rs.getString("Review_id"));
				boardBean.setReview_subject(rs.getString("Review_subject"));
				boardBean.setReview_content(rs.getString("Review_content"));
				boardBean.setReview_file1(rs.getString("Review_file1"));
	        	boardBean.setReview_readcount(rs.getInt("Review_readcount"));
				boardBean.setReview_date(rs.getDate("Review_date"));
				boardBean.setReview_pass(rs.getString("Review_pass"));
				boardBean.setReview_starPoint(rs.getInt("Review_starPoint"));
				boardBean.setReview_orderNo(rs.getInt("Review_orderNo"));
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

			String sql = "SELECT * FROM Review_Board ORDER BY review_num DESC LIMIT ?,?";
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
	
	//조회수
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
    
}
