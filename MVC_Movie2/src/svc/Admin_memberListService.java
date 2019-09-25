package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;
import vo.OrderBean;

public class Admin_memberListService {
	  public int getListCount(MemberBean ams) throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();
	        
	        MemberDAO mDAO = MemberDAO.getInstance();
	        mDAO.setConnection(con);
	        
	        listCount = mDAO.getMemberCount(ams);
	        close(con);
	        System.out.println("Admin_memberListService 의 getMemberCount() 실행됨"+listCount+"조회");
	        return listCount;
	    }

	    public ArrayList<MemberBean> getArticleList(MemberBean ams) throws Exception {
	        ArrayList<MemberBean> articleList = null;
	        
	        Connection con = getConnection();  
	        MemberDAO mDAO = MemberDAO.getInstance();
	        mDAO.setConnection(con);
	        
	        articleList = mDAO.selectMemberList(ams);
	        
	        close(con);
	        System.out.println("Admin_memberListService의  ArrayList<MemberBean> 실행됨");
	        return articleList;
	    }
	    
}
