package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import dao.ItemDAO;
import vo.ItemBean;


public class MainPageService {
	
	public ArrayList<ItemBean> getItem(String item_category1) { // item_category1 - new, best, hot, recommand 등 가능
	     // Connection 객체 가져오기 - getConnection()
       Connection con = getConnection();       
       // ItemDAO 객체 가져오기 - getInstance()
       ItemDAO itemDAO = ItemDAO.getInstance();       
       // Connection 객체 -> ItemDAO 에 전달 - setConnection()
       itemDAO.setConnection(con);       
       
				
       // ItemDAO 객체의 selectItem() 메서드를 호출하여 Item의 상세 스펙 (ItemBean 객체) 리턴받기
       ArrayList<ItemBean> products = itemDAO.selectItem(item_category1);

       // Connection 객체 반환
       close(con);
       
       // BoardBean 객체 리턴
       return products;
	}

	
	

}
