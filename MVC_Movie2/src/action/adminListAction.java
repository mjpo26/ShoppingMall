package action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderListService;
import vo.ActionForward;
import vo.AdminListBean;
import vo.PageInfo;
import vo.OrderBean;
import vo.OrderBean;

public class adminListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<OrderBean> articleList = new ArrayList<OrderBean>();
		AdminListBean  adminListBean = new AdminListBean();
	    //매출현황
		int sumsel=0; //결제합계
	    int sumOrder=0; //주문건수
	    int sumrefund=0; //환불합계
	    int result=0; //총매출금액
	    
	  //주문 현황
	    int inputOrder=0; //입금전 
	    int delivery_be=0; //배송전
	    int delivery_ing=0;	//배송중
	    int delivery_af=0;//배송완료
	   //취소/교환/반품/환불
	    int cancel =0;//취소
	    int change =0;//교환
	    int retrun =0;//반품
	    int refund=0; //환불
		System.out.println("adminListAction실행됨");
	      
	        OrderListService orderListService = new OrderListService();
	        articleList = orderListService.getMainList(); // 전체 게시물 목록 가져오기(10개 한정)
//	    	OrderBean.setOrder_idx(rs.getInt("order_idx"));
//        	OrderBean.setOrder_item_sel_price(rs.getInt("order_item_sel_price"));
//        	OrderBean.setOrder_item_status(rs.getString("order_item_status"));
//        	OrderBean.setOrder_delivery_status(rs.getString("order_delivery_status"));
	        for(int i=0; i <articleList.size(); i++) {
	        	
	        	
	        	if(articleList.get(i).getOrder_item_status().equals("환불")) {
	        		sumrefund += articleList.get(i).getOrder_item_sel_price(); 
	        		refund +=1;   
	        	}else if(articleList.get(i).getOrder_item_status().equals("취소")) {
	        		cancel+=1;
	        	}else if(articleList.get(i).getOrder_item_status().equals("교환")) {
	        		change +=1;
	        	}else if(articleList.get(i).getOrder_item_status().equals("반품")) {
	        		retrun +=1;
	        	}
	        	if(articleList.get(i).getOrder_delivery_status().equals("입금전")) {
	        		sumOrder+=articleList.get(i).getOrder_item_sel_price();
	        		inputOrder+=1;
	        	}else if(articleList.get(i).getOrder_delivery_status().equals("배송전")) {
	        		sumsel +=articleList.get(i).getOrder_item_sel_price();
	        		delivery_be+=1;
	        	}else if(articleList.get(i).getOrder_delivery_status().equals("배송중")) {
	        		sumsel +=articleList.get(i).getOrder_item_sel_price();
	        		delivery_ing+=1;
	        	}else if(articleList.get(i).getOrder_delivery_status().equals("배송완료")) {
	        		sumsel +=articleList.get(i).getOrder_item_sel_price();
	        		delivery_af+=1;
	        	}
	        }
	        sumOrder+=sumsel;
	        result=sumsel-sumrefund;
	        System.out.println("-----매출현황----");
	        System.out.println("주문결제 : "+sumsel);
	        System.out.println("주문건수 : "+sumOrder);
	        System.out.println("환불합계 : "+sumrefund);
	        System.out.println("총합금액 : "+result);
	        System.out.println("-----주문 현황----");
	        System.out.println("입금전 : "+inputOrder);
	        System.out.println("배송전: "+delivery_be);
	        System.out.println("배송중 : "+delivery_ing);
	        System.out.println("배송완료 : "+delivery_af);
	        System.out.println("-----취소/교환/반품/환불----");
	        System.out.println("취소 : "+cancel);
	        System.out.println("교환 : "+change);
	        System.out.println("반품 : "+retrun);
	        System.out.println("환불 : "+refund);
	        adminListBean.setSumsel(sumsel);
	        adminListBean.setSumOrder(sumOrder);
	        adminListBean.setSumrefund(sumrefund);
	        adminListBean.setResult(result);
	        adminListBean.setInputOrder(inputOrder);
	        adminListBean.setDelivery_be(delivery_be);
	        adminListBean.setDelivery_ing(delivery_ing);
	        adminListBean.setDelivery_af(delivery_af);
	        adminListBean.setCancel(cancel);
	        adminListBean.setChange(change);
	        adminListBean.setRetrun(retrun);
	        adminListBean.setRefund(refund);
	        
	        
	        
	        request.setAttribute("adminListBean", adminListBean);

	        
	        
	        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false); // 생략 가능
	        forward.setPath("/main/admin.jsp");
	        
	        return forward;
		}
}