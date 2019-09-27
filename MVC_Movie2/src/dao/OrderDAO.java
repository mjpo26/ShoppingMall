package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Free_BoardBean;
import vo.OrderBean;
import vo.OrderBean;

public class OrderDAO {
    // -----------------------------------------------------
    // DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴
    private static OrderDAO instance;
    private OrderDAO() {}
    
    public static OrderDAO getInstance() {
        // 기존의 BoardDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성
        if(instance == null) {
            instance = new OrderDAO();
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
    public int insertOrder(OrderBean OrderBean) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int insertCount = 0; // 게시물 등록 성공 여부를 저장할 변수(성공 = 1, 실패 = 0)
        
        try {
            String sql = "INSERT INTO item_order ("
                       + "order_item_code ,"
                       + "order_item_title ,"
                       + "order_item_count ,"
                       + "order_item_option_color ,"
//                       + "order_item_option_size ,"
                       + "order_item_sel_price ,"
                       + "order_item_point ,"
                       + "order_plus_point ,"
//                       + "order_used_point ,"
					   + "order_bank ,"
                       + "order_delivery_status ,"
                       + "order_pay_status ," //입금여부
                       + "order_payment ," //결제방식
                       + "order_memo ," //메모
                       + "order_item_status ," //주문현황
                       + "order_date,"+"order_member_name, "+"order_member_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,?)";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, OrderBean.getOrder_item_code()); 
            pstmt.setString(2, OrderBean.getOrder_item_title());
            pstmt.setInt(3, OrderBean.getOrder_item_code_count()); 
            pstmt.setString(4, OrderBean.getOrder_item_option_color());
//            pstmt.setString(4, article.getOrder_item_option_size());
//            pstmt.setString(4, "M");
            pstmt.setInt(5, OrderBean.getOrder_item_sel_price());
            pstmt.setInt(6, OrderBean.getOrder_item_point());
            pstmt.setInt(7, OrderBean.getOrder_plus_point());
            pstmt.setString(8, OrderBean.getOrder_bank());
//            pstmt.setInt(10, OrderBean.getOrder_used_point()); 
            pstmt.setString(9, "입금전");
            pstmt.setString(10, "입금대기");
            pstmt.setString(11, "현금");
            pstmt.setString(12, OrderBean.getOrder_memo());
            pstmt.setString(13, "완료");
            pstmt.setString(14, OrderBean.getOrder_member_name());
            pstmt.setString(15, OrderBean.getOrder_member_id());
//            pstmt.setInt(6, OrderBean.getOrder_idx()); 
            
            
            insertCount = pstmt.executeUpdate(); // 글 등록 처리 결과를 int 형 값으로 리턴받음
            
        } catch (SQLException e) {
//            e.printStackTrace();
            System.out.println("오더DAO에서 insertOrder() 에러 - " + e.getMessage());
          System.out.println("오더DAO,아티클 안에는 값 들어가있나"+OrderBean.getOrder_item_code());
            
            // 만약, 외부로 예외를 던질 때 메세지를 직접 지정하고 싶을 경우 throw 키워드 사용하여
            // Exception 객체 생성 시 예외 메세지를 지정하면 된다! => throws 키워드로 예외 던지기 필요!
//            throw new Exception("insertArticle() 에러 - " + e.getMessage());
        } finally {
            // static import 문을 사용하여 JdbcUtil 클래스명 지정 필요없음
       
            close(pstmt);
            close(con);
        }
        
        return insertCount;
    }

    // 전체 게시물 갯수를 조회하여 리턴
    public int selectListCount() {
        int listCount = 0; // 게시물 갯수를 저장하는 변수
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT COUNT(*) FROM free_board";
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
            close(con);
        }
        
        return listCount;
    }

    // 게시물 목록 조회하여 리턴
    public ArrayList<Free_BoardBean> selectArticleList(int page, int limit) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ArrayList<Free_BoardBean> articleList = new ArrayList<Free_BoardBean>();

        int startRow = (page - 1) * 10; // 읽어올 목록의 첫 레코드 번호
        
        try {
            // SELECT 구문 : board 테이블 데이터 전체 조회 
            // => free_ref 기준 내림차순, free_seq 기준 오름차순
            // => 전체 갯수가 아닌 시작 레코드 번호 ~ limit 갯수 만큼 읽어오기
            String sql = "SELECT * FROM free_board ORDER BY free_ref DESC,free_seq ASC LIMIT ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, limit);
            rs = pstmt.executeQuery();
            
            
            // ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
            // => 패스워드 제외
            while(rs.next()) {
                Free_BoardBean boardBean = new Free_BoardBean();
                boardBean.setFree_num(rs.getInt("free_num"));
                boardBean.setFree_writer_id(rs.getString("free_writer_id"));
                boardBean.setFree_subject(rs.getString("free_subject"));
                boardBean.setFree_content(rs.getString("free_content"));
                boardBean.setFree_file1(rs.getString("free_file1"));
                boardBean.setFree_ref(rs.getInt("free_ref"));
                boardBean.setFree_lev(rs.getInt("free_lev"));
                boardBean.setFree_seq(rs.getInt("free_seq"));
                boardBean.setFree_readcount(rs.getInt("free_readcount"));
                boardBean.setFree_date(rs.getDate("free_date"));
                
                articleList.add(boardBean);
            }
            System.out.println("보드dao 왔다 셀렉트아티클 해서"+articleList.size()+ "개담았다");
            
        } catch (SQLException e) {
            System.out.println("selectArticleList() 에러 - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        
        
        return articleList;
    }
    
    // 글 내용 보기 - 게시물 상세 정보를 조회하여 리턴
  
    public Free_BoardBean selectArticle(int free_num) { // 글 번호를 전달받아 조회 후, 결과를 BoardBean 으로 리턴
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Free_BoardBean boardBean = null;
        
        System.out.println("보드DAO:게시글하나 가지러 selectArticle왔다 보드넘:" +free_num );
        
        try {
            // free_num 에 해당하는 게시물 조회 후, 결과값을 BoardBean 에 저장하여 리턴
            String sql = "SELECT * FROM free_board WHERE free_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, free_num);
            rs = pstmt.executeQuery();
            
            if(rs.next()) { // 조회된 게시물이 있을 경우
                System.out.println("rs는 갖고 오나?"+rs.getString("free_writer_id"));
                
                boardBean = new Free_BoardBean();
                boardBean.setFree_num(rs.getInt("free_num"));
                boardBean.setFree_writer_id(rs.getString("free_writer_id"));
                boardBean.setFree_subject(rs.getString("free_subject"));
                boardBean.setFree_content(rs.getString("free_content"));
                boardBean.setFree_file1(rs.getString("free_file1"));
                boardBean.setFree_ref(rs.getInt("free_ref"));
                boardBean.setFree_lev(rs.getInt("free_lev"));
                boardBean.setFree_seq(rs.getInt("free_seq"));
                boardBean.setFree_readcount(rs.getInt("free_readcount"));
                boardBean.setFree_date(rs.getDate("free_date"));
                boardBean.setFree_pass(rs.getString("free_pass"));
               
              System.out.println("보드빈에 담겼나?"+boardBean.getFree_writer_id());
            }
        } catch (SQLException e) {
            System.out.println("selectArticle() 에러 - " + e.getMessage());
        } finally {
            System.out.println("보드DAO 셀렉아티클["+boardBean+" ]뽑았다.서비스로 리턴하러간다.");
            close(rs);
            close(pstmt);
            close(con);
        }
        
        return boardBean;
        
    }

    // 게시물 패스워드 확인
    public boolean isArticleBoardWriter(int free_num, String free_pass) {
//        System.out.println("BoardDAO - isArticleBoardWriter()");
        // free_num 에 해당하는 게시물의 패스워드를 비교
        boolean isArticleWriter = false; 
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // 게시물 번호에 해당하는 패스워드가 존재하는지 검색
            String sql = "SELECT * FROM free_board WHERE free_num=? AND free_pass=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, free_num);
            pstmt.setString(2, free_pass);
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
            close(con);
        }
        
        
        return isArticleWriter;
    }

    // 글 수정
    public int isUpdateArticle(Free_BoardBean article) {
        int updateCount = 0;
        
        PreparedStatement pstmt = null;
        
        try {
            // 글 번호에 해당하는 레코드에 대해 제목(subject), 내용(content) 수정 후 결과값 리턴
           System.out.println("isupdatearticle왔다 수정글 ["+article+"]가져오나");
            String sql = "UPDATE free_board SET free_subject=?,free_content=? WHERE free_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, article.getFree_subject());
            pstmt.setString(2, article.getFree_content());
            pstmt.setInt(3, article.getFree_num());
            updateCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("isUpdateArticle() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
            close(con);
        }
        
        return updateCount;
    }

    // 답글 등록
    public int insertReplyArticle(Free_BoardBean article) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int num = 1; // 답변글 번호
        int insertCount = 0; // 성공 여부의 리턴값을 저장할 변수
        
        // article 객체에서 참조글(free_ref), 들여쓰기레벨(free_lev), 순서번호(free_seq) 가져오기 
        int free_ref = article.getFree_ref();
        int free_lev = article.getFree_lev();
        int free_seq = article.getFree_seq();
        
        try {
            // 현재 게시물에서 가장 큰 번호 조회
            String sql = "SELECT MAX(free_num) FROM free_board ";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // ResultSet 객체가 존재할 경우(조회 성공할 경우) => 현재 게시물 가장 큰번호 + 1 값을 num 에 저장
            // => 객체가 없을 경우 기본값 num = 1
            if(rs.next()) {
                num = rs.getInt(1) + 1;
            }
            
            // 동일한 참조글(free_ref)에 대한 기존 답글의 순서번호 값을 모두 1씩 증가시킴 
            // => 최신 글이 seq 번호가 가장 낮은 값(1)이어야 하므로 기존 답글들의 값을 전부 +1 시킴
            sql = "UPDATE free_board SET free_seq=free_seq+1 WHERE free_ref=? AND free_seq>?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, free_ref);
            pstmt.setInt(2, free_seq);
            int updateCount = pstmt.executeUpdate();
            
            if(updateCount > 0) {
                commit(con);
                close(con);
            }
            
            // 새 답글에 대한 순서 번호, 들여쓰기 레벨 1 증가시킴
            free_seq += 1;
            free_lev += 1;
            
            // 답변글 등록 => 파일을 제외한 나머지 등록
            System.out.println("리플라이등록DAO왔다");
            sql = "INSERT INTO free_board ("
                    + "free_num,"
                    + "free_writer_id,"
                    + "free_pass,"
                    + "free_subject,"
                    + "free_content,"
                    + "free_file1,"
                    + "free_ref,"
                    + "free_lev,"
                    + "free_seq,"
                    + "free_readcount,"
                    + "free_replycount,"
                    + "free_date,"
                    + "free_file2,"
                    + "free_file3,"
                    + "free_file4,"
                    + "free_file5 ) VALUES(?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num); // 게시물 번호(새로 계산한 번호 사용)
            pstmt.setString(2, article.getFree_writer_id());
            pstmt.setString(3, article.getFree_pass());
            pstmt.setString(4, article.getFree_subject());
            pstmt.setString(5, article.getFree_content());
            pstmt.setString(6, ""); // 답글 파일 업로드 없음
            pstmt.setInt(7, free_ref); 
            pstmt.setInt(8, free_lev);
            pstmt.setInt(9, free_seq);
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
            close(con);
        }
        
        return insertCount;
    }

    
    // 조회수 증가
    public int updateReadcount(int free_num) {
        int updateCount = 0;
        
        PreparedStatement pstmt = null;
        
        try {
            // free_num 에 해당하는 게시물의 기존 조회수(readcount) + 1
            String sql = "UPDATE free_board SET free_readcount=free_readcount+1 WHERE free_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, free_num);
            updateCount = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("updateReadcount() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
        }
        
        return updateCount;
    }
    
    
    // 글 삭제
    public int deleteArticle(int free_num) {
        // DELETE 구문을 사용하여 free_num 에 해당하는 게시물 삭제
        // => 삭제 결과를 int 형 변수로 리턴
        PreparedStatement pstmt = null;
        
        int deleteCount = 0;
        
        try {
            String sql = "DELETE FROM free_board WHERE free_num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, free_num);
            deleteCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteArticle() 에러 - " + e.getMessage());
        } finally {
            close(pstmt);
            close(con);
        }
        
        return deleteCount;
        
        
    }

	public int updateOrder(OrderBean orderBean) {
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE item_order SET "
				+ "order_pay_status=?,"
				+ "order_delivery_status=?,"
				+ "order_item_status=?,"
				+ "order_bank=?,"
				+ "order_payment=?"
				+ "where order_idx=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			System.out.println("출력:::::"+orderBean.getOrder_delivery_status());
			System.out.println("출력:::::"+orderBean.getOrder_item_status());
			System.out.println("출력:::::"+orderBean.getOrder_bank());
			System.out.println("출력:::::"+orderBean.getOrder_payment());
			System.out.println("출력:::::"+orderBean.getOrder_idx());
			
			
			pstmt.setString(1, orderBean.getOrder_pay_status());
			pstmt.setString(2, orderBean.getOrder_delivery_status());
			pstmt.setString(3, orderBean.getOrder_item_status());
			pstmt.setString(4, orderBean.getOrder_bank());
			pstmt.setString(5, orderBean.getOrder_payment());
			pstmt.setInt(6, orderBean.getOrder_idx());
			
				updateCount = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				System.out.println("updateOrder() 에러 - " + e.getMessage());
			} finally {
				close(pstmt);
				close(con);
			}

			return updateCount;
		}
	public int selectListCount(OrderBean ob) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String order_member_id=ob.getOrder_member_id();
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_member_id);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_member_id()+"갯수는"+listCount);
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
	
	// Admin OrderList Select
	public ArrayList<OrderBean> selectArticleList(OrderBean ob) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<OrderBean> articleList = new ArrayList<OrderBean>();

		int startRow = (ob.getPage() - 1) * 10;
		
		try {

			System.out.println("디에오 체크/"+ob.getPickStart() + "/" +ob.getPickEnd());
			
			
			// admin
			// admin2
	
			String sql = "SELECT * FROM item_order where "
			
	
			
			        
					
//				+ "if(order_idx=?<1 ,like '%%',?)"
				
		        
					+ "order_idx like if(?<1,'%%',?)"
					+ "and order_item_title like ifnull(?,'%%') "
					+ "and order_date >= ?"
					+ "and order_date <= ?"
			        + "and order_member_id like ifnull(?,'%%') "
			        + "and order_pay_status like ifnull(?,'%%') "
			        + "and order_delivery_status like ifnull(?,'%%')"
			        + "and order_item_status like ifnull(?,'%%')"
			        + "and order_bank like ifnull(?,'%%')"
			        + "and order_payment like ifnull(?,'%%')"
			        + "ORDER BY order_item_code LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, ob.getOrder_item_option_color());
			pstmt.setInt(1, ob.getOrder_idx());
			pstmt.setInt(2, ob.getOrder_idx());
			pstmt.setString(3, ob.getOrder_item_title());
			pstmt.setDate(4, ob.getPickStart());
			pstmt.setDate(5, ob.getPickEnd());
			pstmt.setString(6, ob.getOrder_member_id());
			pstmt.setString(7, ob.getOrder_pay_status());
			pstmt.setString(8, ob.getOrder_delivery_status());
			pstmt.setString(9, ob.getOrder_item_status());
			pstmt.setString(10, ob.getOrder_bank());
			pstmt.setString(11, ob.getOrder_payment());
			pstmt.setInt(12, startRow);
			pstmt.setInt(13, ob.getLimit());
			
			rs = pstmt.executeQuery();
			
			System.out.println(startRow+"와"+ob.getLimit());

			while (rs.next()) {
				OrderBean listBean = new OrderBean();
				listBean.setOrder_date(rs.getDate("order_date"));
				listBean.setOrder_idx(rs.getInt("order_idx"));
				listBean.setOrder_member_id(rs.getString("order_member_id"));
				listBean.setOrder_item_title(rs.getString("order_item_title"));
				listBean.setOrder_pay_status(rs.getString("order_pay_status"));
				listBean.setOrder_item_sel_price(rs.getInt("order_item_sel_price"));
				listBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
				listBean.setOrder_payment(rs.getString("order_payment"));
				listBean.setOrder_bank(rs.getString("order_bank"));
				listBean.setOrder_item_status(rs.getString("order_item_status"));
				listBean.setOrder_memo(rs.getString("order_memo"));
				articleList.add(listBean);
			}
			
			System.out.println("OrderDAO: orderList 담긴거 확인:" + articleList);
		} catch (SQLException e) {
			System.out.println("selectArticleList() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return articleList;
	}
	
	public int selectdelivery1_Count(OrderBean ob) {
		int delivery1_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_start="입금전";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_start);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery1_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery1_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return delivery1_Count;
	}
	
	public int selectdelivery2_Count(OrderBean ob) {
		int delivery2_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_before="배송전";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_before);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery2_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery2_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return delivery2_Count;
	}
	
	public int selectdelivery3_Count(OrderBean ob) {
		int delivery3_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_ing="배송중";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_ing);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery3_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery3_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return delivery3_Count;
	}
	
	public int selectdelivery4_Count(OrderBean ob) {
		int delivery4_Count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delivery_end="배송완료";
		// String before배송= "배송전";
		try {
			String sql = "SELECT COUNT(*) FROM item_order where order_delivery_status=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery_end);  //제목  
			rs = pstmt.executeQuery();

			if (rs.next()) {
				delivery4_Count = rs.getInt(1);
				System.out.println("작성자는"+ob.getOrder_delivery_status()+"갯수는"+delivery4_Count);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 에러 - " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return delivery4_Count;
	}
	
	
	public ArrayList<OrderBean> selectArticleList(String sId) {		// 회원 정보 => 장바구니에서 주문
		 PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        ArrayList<OrderBean> articleList = new ArrayList<OrderBean>();

	         
	        
	        try { 
	            String sql = "SELECT * FROM item_order where order_member_id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, sId);
	            rs = pstmt.executeQuery();

	            while(rs.next()) {
	            	OrderBean OrderBean = new OrderBean();
	            	System.out.println("아");
	            	OrderBean.setOrder_idx(rs.getInt("order_idx"));
	            	System.out.println("주문번호"+OrderBean.getOrder_idx());
	            	OrderBean.setOrder_item_code((rs.getInt("order_item_code")));
	             	System.out.println("아이템코드"+OrderBean.getOrder_idx());
	            	OrderBean.setOrder_item_title(rs.getString("order_item_title"));
	            	OrderBean.setOrder_item_option_color(rs.getString("order_item_option_color"));
	            	OrderBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
	                OrderBean.setOrder_date(rs.getDate("order_date"));
	                OrderBean.setOrder_item_title((rs.getString("order_item_title")));
	            	articleList.add(OrderBean);
	            }
	            
	        } catch (SQLException e) {
	            System.out.println("selectArticleList() - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	            close(con);
	        }
	        
	        
	        return articleList;
		}

	public OrderBean selectArticleList(int order_item_code) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        
        OrderBean ob = new OrderBean();
         
        
        try { 
            String sql = "SELECT * FROM item_order where order_item_code=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, order_item_code);
            rs = pstmt.executeQuery();
            

            while(rs.next()) {
            	
            	ob.setOrder_item_code((rs.getInt("order_item_code")));
            	ob.setOrder_idx(rs.getInt("order_idx"));
            	ob.setOrder_item_title(rs.getString("order_item_title"));
            	ob.setOrder_item_option_color(rs.getString("order_item_option_color"));
            	ob.setOrder_delivery_status(rs.getString("order_delivery_status"));
            	ob.setOrder_date(rs.getDate("order_date"));
            	ob.setOrder_item_title((rs.getString("order_item_title")));
            	
            }
            
        } catch (SQLException e) {
            System.out.println("selectArticleList() - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        
        
        return ob;

	}

	public ArrayList<OrderBean> selectArticleList1(String bId) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        ArrayList<OrderBean> articleList = new ArrayList<OrderBean>();

         
        
        try { 
            String sql = "SELECT * FROM basket where basket_idx=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bId);
            rs = pstmt.executeQuery();
            

            while(rs.next()) {
            	OrderBean OrderBean = new OrderBean();
            	OrderBean.setOrder_idx(rs.getInt("basket_idx"));
            	OrderBean.setOrder_item_code((rs.getInt("basket_code")));
            	OrderBean.setOrder_item_title((rs.getString("basket_title")));
            	OrderBean.setOrder_item_option_color(rs.getString("basket_option_color"));
            	OrderBean.setOrder_delivery_status("배송준비");
                OrderBean.setOrder_date(rs.getDate("basket_date"));
            	articleList.add(OrderBean);
            }
            
        } catch (SQLException e) {
            System.out.println("selectArticleList() - " + e.getMessage());
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        
        
        return articleList;

	}

	public ArrayList<OrderBean> MainList() {
		 PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        ArrayList<OrderBean> articleList = new ArrayList<OrderBean>();

	         
	        
	        try { 
	            String sql = "SELECT * FROM item_order";
	            pstmt = con.prepareStatement(sql);
	            rs = pstmt.executeQuery();

	            while(rs.next()) {
	            	OrderBean OrderBean = new OrderBean();
	            	OrderBean.setOrder_idx(rs.getInt("order_idx"));
	            	OrderBean.setOrder_item_sel_price(rs.getInt("order_item_sel_price"));
	            	OrderBean.setOrder_item_status(rs.getString("order_item_status"));
	            	OrderBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
	            	
	            	articleList.add(OrderBean);
	            }
	            
	        } catch (SQLException e) {
	            System.out.println("selectArticleList() - " + e.getMessage());
	        } finally {
	            close(rs);
	            close(pstmt);
	            close(con);
	        }
	        
	        
	        return articleList;
	}
    
}




















