package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DeliveryDAO;
import dao.MemberDAO;
import dao.MemberListDAO;
import dao.OrderListDAO;
import vo.Admin_DeliveryListBean;
import vo.Admin_DeliverySearchBean;
import vo.MemberBean;
import vo.OrderListBean;

public class Admin_DeliveryListService {
	  public int getListCount(Admin_DeliverySearchBean adb) throws Exception {
	        int listCount = 0; 
	      
	        Connection con = getConnection();	        
	        DeliveryDAO dDAO = DeliveryDAO.getInstance();
	        dDAO.setConnection(con);
	        
	        listCount = dDAO.getDeliveryCount(adb);
	        close(con);
	        System.out.println("Admin_DeliveryService 의 getDeliveryCount() 실행됨"+listCount+"조회");
	        return listCount;
	    }

	    public ArrayList<Admin_DeliveryListBean> getDeliveryList(Admin_DeliverySearchBean adb) throws Exception {
	        ArrayList<Admin_DeliveryListBean> deliveryList = null;
	        
	        Connection con = getConnection();	        
	        DeliveryDAO dDAO = DeliveryDAO.getInstance();
	        dDAO.setConnection(con);
	        
	        deliveryList = dDAO.selectDelivery(adb);
	        
	        close(con);
	        System.out.println("Admin_DeliveryService의  ArrayList<Admin_DeliveryBean> 실행됨");
	        return deliveryList;
	    }
	    
}
