package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;
import vo.ItemBean;

public class ProductDetailService {

	public ItemBean getArticle(int item_code) {
		// Connection 객체 가져오기 - getConnection()
		Connection con = getConnection();

		// ItemDAO 객체 가져오기 - getInstance()
		ItemDAO itemDAO = ItemDAO.getInstance();

		// Connection 객체 -> ItemDAO 에 전달 - setConnection()
		itemDAO.setConnection(con);

		// ItemDAO 객체의 selectArticle() 메서드를 호출하여 글 상세 내용(BoardBean 객체) 리턴받기
		ItemBean article = itemDAO.selectArticle(item_code);

		// 조회수 증가
//        int updateCount = boardDAO.updateReadcount(board_num);
//        
//        if(updateCount > 0) {
//            commit(con);
//        } else {
//            rollback(con);
//        }

		// Connection 객체 반환
		close(con);

		// BoardBean 객체 리턴
		return article;
	}

	public void getDelete(int item_code) {
		Connection con = getConnection();

		// ItemDAO 객체 가져오기 - getInstance()
		ItemDAO itemDAO = ItemDAO.getInstance();

		// Connection 객체 -> ItemDAO 에 전달 - setConnection()
		itemDAO.setConnection(con);

		// ItemDAO 객체의 selectArticle() 메서드를 호출하여 글 상세 내용(BoardBean 객체) 리턴받기
		itemDAO.Delete(item_code);
		close(con);
	}

}
