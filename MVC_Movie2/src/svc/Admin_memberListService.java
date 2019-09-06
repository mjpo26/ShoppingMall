package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import dao.OrderListDAO;
import vo.MemberBean;
import vo.OrderListBean;

public class Admin_memberListService {
	  public int getListCount() throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();
	        
	        MemberDAO mDAO = MemberDAO.getInstance();
	        mDAO.setConnection(con);
	        
	        listCount = mDAO.getMemberCount();
	        close(con);
	        System.out.println("Admin_memberListService 의 getMemberCount() 실행됨");
	        return listCount;
	    }

	    public ArrayList<MemberBean> getArticleList(int page, int limit) throws Exception {
	        ArrayList<MemberBean> articleList = null;
	        
	        Connection con = getConnection();  
	        MemberDAO mDAO = MemberDAO.getInstance();
	        mDAO.setConnection(con);
	        
	        articleList = mDAO.selectMemberList(page, limit);
	        
	        close(con);
	        System.out.println("Admin_memberListService의  ArrayList<MemberBean> 실행됨");
	        return articleList;
	    }
	    
}
