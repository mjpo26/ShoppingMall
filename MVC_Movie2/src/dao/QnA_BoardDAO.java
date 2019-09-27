package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AdminBoardSearchBean;
import vo.EventBean;
import vo.QnA_BoardBean;

public class QnA_BoardDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static QnA_BoardDAO instance;
    private QnA_BoardDAO() {}
    
    public static QnA_BoardDAO getInstance() {
        // 기존의 BoardDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new QnA_BoardDAO();
        }
        
        return instance;
    }
    // -----------------------------------------------------

    Connection con;
    
    // Service 클래스로부터 Connection 객체 전달받는 메서드
    public void setConnection(Connection con) {
        this.con = con;
    }
    
    
    // 글 등록 요청을 처리하는 insertArticle() 메서드
    public int insertArticle(QnA_BoardBean article) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int insertCount = 0; // 게시물 등록 성공 여부를 저장할 변수(성공 = 1, 실패 = 0)
        
        try {
            // 현재 게시물 번호 중 가장 큰 번호 조회
            String sql = "SELECT MAX(QnA_num) FROM QnA_Board";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            int num = 1; // 게시물 번호 저장할 변수(기본값으로 1 지정)
            
            if(rs.next()) {
                // 기존 게시물이 존재할 경우(가장 큰 번호를 조회했을 경우)
                num = rs.getInt(1) + 1; // 가장 큰 번호 + 1 값(새로운 게시물 번호)을 저장
            } 
            
            // 게시물 등록 구문 작성(마지막 컬럼인 board_date 항목은 DB 현재 시각 정보 사용)
            sql = "INSERT INTO QnA_Board ("
                    + "QnA_num,"
                    + "QnA_writer_id,"
                    + "QnA_pass,"
                    + "QnA_subject,"
                    + "QnA_content,"
                    + "QnA_file1,"
                    + "QnA_re_ref,"
                    + "QnA_re_lev,"
                    + "QnA_re_seq,"
                    + "QnA_readcount,"
                    + "QnA_replycount,"
                    + "QnA_date,"
                    + "QnA_file2,"
                    + "QnA_file3,"
                    + "QnA_file4,"
                    + "QnA_file5) VALUES (?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num); // 게시물 번호(새로 계산한 번호 사용)
            // QnA_writer_id, QnA_pass, QnA_subject, QnA_content, QnA_file1 - BoardBean 객체 값 사용
            pstmt.setString(2, article.getQnA_writer_id());
            pstmt.setString(3, article.getQnA_pass());
            pstmt.setString(4, article.getQnA_subject());
            pstmt.setString(5, article.getQnA_content());
            pstmt.setString(6, article.getQnA_file1());
            pstmt.setInt(7, num); // 참조 게시물 번호 = 새 글이므로 현재 게시물 번호로 설정
            pstmt.setInt(8, 0); // 들여쓰기 레벨 = 새 글이므로 0
            pstmt.setInt(9, 0); // 글 순서번호 = 새 글이므로 0
            pstmt.setInt(10, 0); // 조회수 = 새 글이므로 0
            pstmt.setString(11,"0"); //리플라이카운트 일단 0으로 만들자
            //12번 라인은 date
            pstmt.setString(12, article.getQnA_file2());
            pstmt.setString(13, article.getQnA_file3());
            pstmt.setString(14, article.getQnA_file4());
            pstmt.setString(15, article.getQnA_file5());
            
            insertCount = pstmt.executeUpdate(); // 글 등록 처리 결과를 int 형 값으로 리턴받음
            
        } catch (SQLException e) {
//            e.printStackTrace();
            System.out.println("보드DAO에서 insertArticle() 에러 - " + e.getMessage());
          System.out.println("보드디에오,아티클 안에는 값 들어가있나"+article.getQnA_subject());
            
            // 만약, 외부로 예외를 던질 때 메세지를 직접 지정하고 싶을 경우 throw 키워드 사용하여
            // Exception 객체 생성 시 예외 메세지를 지정하면 된다! => throws 키워드로 예외 던지기 필요!
//            throw new Exception("insertArticle() 에러 - " + e.getMessage());
        } finally {
            // static import 문을 사용하여 JdbcUtil 클래스명 지정 필요없음
            close(rs);
            close(pstmt);
        }
        
        return insertCount;
    }

    // 전체 게시물 갯수를 조회하여 리턴
    public int selectListCount() {
        int listCount = 0; // 게시물 갯수를 저장하는 변수
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT COUNT(*) FROM QnA_Board";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                listCount = rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.out.println("selectListCount() 에러 - " + e.getMessage());
        } finally {
            // static import 문을 사용하여 JdbcUtil 클래스명 지정 필요없음
            close(rs);
            close(pstmt);
        }
        
        return listCount;
    }

    // 게시물 목록 조회하여 리턴
    public ArrayList<QnA_BoardBean> selectArticleList(int page, int limit) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ArrayList<QnA_BoardBean> articleList = new ArrayList<QnA_BoardBean>();

        int startRow = (page - 1) * 10; // 읽어올 목록의 첫 레코드 번호
        
        try {
            // SELECT 구문 : board 테이블 데이터 전체 조회 
            // => QnA_re_ref 기준 내림차순, QnA_re_seq 기준 오름차순
            // => 전체 갯수가 아닌 시작 레코드 번호 ~ limit 갯수 만큼 읽어오기
            String sql = "SELECT * FROM QnA_Board ORDER BY QnA_re_ref,QnA_num DESC,QnA_re_seq ASC LIMIT ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, limit);
            rs = pstmt.executeQuery();
            
            
            // ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
            // => 패스워드 제외
            while(rs.next()) {
                QnA_BoardBean qnA_BoardBean = new QnA_BoardBean();
                qnA_BoardBean.setQnA_num(rs.getInt("QnA_num"));
                qnA_BoardBean.setQnA_writer_id(rs.getString("QnA_writer_id"));
                qnA_BoardBean.setQnA_subject(rs.getString("QnA_subject"));
                qnA_BoardBean.setQnA_content(rs.getString("QnA_content"));
                qnA_BoardBean.setQnA_file1(rs.getString("QnA_file1"));
                qnA_BoardBean.setQnA_re_ref(rs.getInt("QnA_re_ref"));
                qnA_BoardBean.setQnA_re_lev(rs.getInt("QnA_re_lev"));
                qnA_BoardBean.setQnA_re_seq(rs.getInt("QnA_re_seq"));
                qnA_BoardBean.setQnA_readcount(rs.getInt("QnA_readcount"));
                qnA_BoardBean.setQnA_date(rs.getDate("QnA_date"));
                
                articleList.add(qnA_BoardBean);
            }
            System.out.println("보드dao 왔다 셀렉트아티클 해서"+articleList.size()+ "개담았다");
            
        } catch (SQLException e) {
            System.out.println("selectArticleList() 에러 - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        
        return articleList;
    }
    
    // 글 내용 보기 - 게시물 상세 정보를 조회하여 리턴
  
    public QnA_BoardBean selectArticle(int QnA_num) { // 글 번호를 전달받아 조회 후, 결과를 BoardBean 으로 리턴
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        QnA_BoardBean qnA_BoardBean = null;
        
        System.out.println("보드DAO:게시글하나 가지러 selectArticle왔다 보드넘:" +QnA_num );
        
        try {
            // QnA_num 에 해당하는 게시물 조회 후, 결과값을 BoardBean 에 저장하여 리턴
            String sql = "SELECT * FROM QnA_Board WHERE QnA_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, QnA_num);
            rs = pstmt.executeQuery();
            
            if(rs.next()) { // 조회된 게시물이 있을 경우
                System.out.println("rs는 갖고 오나?"+rs.getString("QnA_writer_id"));
                
                qnA_BoardBean = new QnA_BoardBean();
                qnA_BoardBean.setQnA_num(rs.getInt("QnA_num"));
                qnA_BoardBean.setQnA_writer_id(rs.getString("QnA_writer_id"));
                qnA_BoardBean.setQnA_subject(rs.getString("QnA_subject"));
                qnA_BoardBean.setQnA_content(rs.getString("QnA_content"));
                qnA_BoardBean.setQnA_file1(rs.getString("QnA_file1"));
                qnA_BoardBean.setQnA_re_ref(rs.getInt("QnA_re_ref"));
                qnA_BoardBean.setQnA_re_lev(rs.getInt("QnA_re_lev"));
                qnA_BoardBean.setQnA_re_seq(rs.getInt("QnA_re_seq"));
                qnA_BoardBean.setQnA_readcount(rs.getInt("QnA_readcount"));
                qnA_BoardBean.setQnA_date(rs.getDate("QnA_date"));
                qnA_BoardBean.setQnA_pass(rs.getString("QnA_pass"));
               
              System.out.println("보드빈에 담겼나?"+qnA_BoardBean.getQnA_writer_id());
            }
        } catch (SQLException e) {
            System.out.println("selectArticle() 에러 - " + e.getMessage());
        } finally {
            System.out.println("보드DAO 셀렉아티클["+qnA_BoardBean+" ]뽑았다.서비스로 리턴하러간다.");
            close(rs);
            close(pstmt);
        }
        
        return qnA_BoardBean;
        
    }

    // 게시물 패스워드 확인
    public boolean isArticleBoardWriter(int QnA_num, String QnA_pass) {
//        System.out.println("BoardDAO - isArticleBoardWriter()");
        // QnA_num 에 해당하는 게시물의 패스워드를 비교
        boolean isArticleWriter = false; 
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // 게시물 번호에 해당하는 패스워드가 존재하는지 검색
            String sql = "SELECT * FROM QnA_Board WHERE QnA_num=? AND QnA_pass=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, QnA_num);
            pstmt.setString(2, QnA_pass);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                // 게시물 번호에 해당하는 패스워드가 일치하여 레코드가 검색될 경우
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

    // 글 수정
    public int isUpdateArticle(QnA_BoardBean article) {
        int updateCount = 0;
        
        PreparedStatement pstmt = null;
        
        try {
            // 글 번호에 해당하는 레코드에 대해 제목(subject), 내용(content) 수정 후 결과값 리턴
           System.out.println("isupdatearticle왔다 수정글 ["+article+"]가져오나");
            String sql = "UPDATE QnA_Board SET QnA_subject=?,QnA_content=? WHERE QnA_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, article.getQnA_subject());
            pstmt.setString(2, article.getQnA_content());
            pstmt.setInt(3, article.getQnA_num());
            updateCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("isUpdateArticle() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return updateCount;
    }

    // 답글 등록
    public int insertReplyArticle(QnA_BoardBean article) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int num = 1; // 답변글 번호
        int insertCount = 0; // 성공 여부의 리턴값을 저장할 변수
        
        // article 객체에서 참조글(QnA_re_ref), 들여쓰기레벨(QnA_re_lev), 순서번호(QnA_re_seq) 가져오기 
        int QnA_re_ref = article.getQnA_re_ref();
        int QnA_re_lev = article.getQnA_re_lev();
        int QnA_re_seq = article.getQnA_re_seq();
        
        try {
            // 현재 게시물에서 가장 큰 번호 조회
            String sql = "SELECT MAX(QnA_num) FROM QnA_Board";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // ResultSet 객체가 존재할 경우(조회 성공할 경우) => 현재 게시물 가장 큰번호 + 1 값을 num 에 저장
            // => 객체가 없을 경우 기본값 num = 1
            if(rs.next()) {
                num = rs.getInt(1) + 1;
            }
            
            // 동일한 참조글(QnA_re_ref)에 대한 기존 답글의 순서번호 값을 모두 1씩 증가시킴 
            // => 최신 글이 seq 번호가 가장 낮은 값(1)이어야 하므로 기존 답글들의 값을 전부 +1 시킴
            sql = "UPDATE QnA_Board SET QnA_re_seq=QnA_re_seq+1 WHERE QnA_re_ref=? AND QnA_re_seq>?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, QnA_re_ref);
            pstmt.setInt(2, QnA_re_seq);
            int updateCount = pstmt.executeUpdate();
            
            if(updateCount > 0) {
                commit(con);
            }
            
            // 새 답글에 대한 순서 번호, 들여쓰기 레벨 1 증가시킴
            QnA_re_seq += 1;
            QnA_re_lev += 1;
            
            // 답변글 등록 => 파일을 제외한 나머지 등록
            System.out.println("리플라이등록DAO왔다");
            sql = "INSERT INTO QnA_Board ("
                    + "QnA_num,"
                    + "QnA_writer_id,"
                    + "QnA_pass,"
                    + "QnA_subject,"
                    + "QnA_content,"
                    + "QnA_file1,"
                    + "QnA_re_ref,"
                    + "QnA_re_lev,"
                    + "QnA_re_seq,"
                    + "QnA_readcount,"
                    + "QnA_replycount,"
                    + "QnA_date,"
                    + "QnA_file2,"
                    + "QnA_file3,"
                    + "QnA_file4,"
                    + "QnA_file5 ) VALUES(?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num); // 게시물 번호(새로 계산한 번호 사용)
            pstmt.setString(2, article.getQnA_writer_id());
            pstmt.setString(3, article.getQnA_pass());
            pstmt.setString(4, article.getQnA_subject());
            pstmt.setString(5, article.getQnA_content());
            pstmt.setString(6, ""); // 답글 파일 업로드 없음
            pstmt.setInt(7, QnA_re_ref); 
            pstmt.setInt(8, QnA_re_lev);
            pstmt.setInt(9, QnA_re_seq);
            pstmt.setInt(10, 0); // 조회수 = 새 글이므로 0
            pstmt.setInt(11, 0); // 리플카운트
            //date
            pstmt.setString(12, "");
            pstmt.setString(13, "");
            pstmt.setString(14, "");
            pstmt.setString(15, "");
            
            
            insertCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
           
            System.out.println("insertReplyArticle() 에러 - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return insertCount;
    }

    
    
    // 조회수 증가
    public int updateReadcount(int QnA_num) {
        int updateCount = 0;
        
        PreparedStatement pstmt = null;
        
        try {
            // QnA_num 에 해당하는 게시물의 기존 조회수(readcount) + 1
            String sql = "UPDATE QnA_Board SET QnA_readcount=QnA_readcount+1 WHERE QnA_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, QnA_num);
            updateCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("updateReadcount() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return updateCount;
    }
    
    
    // 글 삭제
    public int deleteArticle(int QnA_num) {
        // DELETE 구문을 사용하여 QnA_num 에 해당하는 게시물 삭제
        // => 삭제 결과를 int 형 변수로 리턴
        PreparedStatement pstmt = null;
        
        int deleteCount = 0;
        
        try {
            String sql = "DELETE FROM QnA_Board WHERE QnA_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, QnA_num);
            deleteCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteArticle() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return deleteCount;
        
        
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
					+ "and QnA_date >= ?"
			        + "and QnA_date <= ?"
			        + "and QnA_writer_id like ifnull(?,'%%') "
					+ "and QnA_replycount like ifnull(?,'%%')";

//			        + "and QnA_file1 like ifnull(?,'%%') ";
//			        + "ORDER BY order_item_code LIMIT ?,?"; 답글달렸는지여부 아직체크 안함, 이미지여부도..
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, abs.getOrder_item_option_color());
			pstmt.setString(1, abb.getBoard_title());
			pstmt.setDate(2, abb.getPickStart());
			pstmt.setDate(3, abb.getPickEnd());
			pstmt.setString(4, abb.getBoard_writer());
			pstmt.setString(5, abb.getBoard_replyCheck());
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+abb.getLimit());

			while (rs.next()) {
				QnA_BoardBean listBean = new QnA_BoardBean();
		        listBean.setQnA_subject(rs.getString("QnA_subject"));
		        listBean.setQnA_writer_id(rs.getString("QnA_writer_id"));
		        listBean.setQnA_date(rs.getDate("QnA_date"));
		        listBean.setQnA_num(rs.getInt("QnA_NUM"));
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

	public int isUpdateArticle(EventBean article) {
		// TODO Auto-generated method stub
		return 0;
	}

    
    
    
}