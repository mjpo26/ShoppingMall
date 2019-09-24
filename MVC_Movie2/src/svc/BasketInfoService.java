package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BasketListDAO;
import dao.ItemDAO;
import dao.MemberDAO;
import vo.BasketListBean;
import vo.ItemBean;
import vo.MemberBean;

public class BasketInfoService {


	public ArrayList<BasketListBean> getBasketInfo(String member_id)  throws Exception{
        ArrayList<BasketListBean> articleList = null;
        
        Connection con = getConnection();  
        
        BasketListDAO basketListDAO =BasketListDAO.getInstance();
		
        basketListDAO.setConnection(con);
        
        
        articleList = basketListDAO.selectArticleList(member_id);
        

        
        close(con);
        
        return articleList;
	}

	public static BasketListBean getBasketInfo1(int bId){
		BasketListBean bb= null;
		  Connection con = getConnection();  
	        
	        BasketListDAO basketListDAO =BasketListDAO.getInstance();
			
	        basketListDAO.setConnection(con);
	        
	        
	       bb = basketListDAO.selectInfo(bId);
	        

	        
	        close(con);
	        
	        return bb;
	}
    
}



















