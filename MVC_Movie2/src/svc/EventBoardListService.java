package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewBoardDAO;
import vo.EventBean;

public class EventBoardListService {
	public ArrayList<EventBean> getArticleList(int num) throws Exception {
        ArrayList<EventBean> articleList = null;
        
        Connection con = getConnection();  
        ReviewBoardDAO mDAO = ReviewBoardDAO.getInstance();
        mDAO.setConnection(con);
        
        articleList = mDAO.selectCommentList(num);
        
        close(con);
        System.out.println("ReviewCommentDetailService의  ArrayList<CommentBean> 실행됨");
        return articleList;
    }

}
