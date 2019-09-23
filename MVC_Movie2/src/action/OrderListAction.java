package action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.OrderListBean;
import vo.OrderSearchBean;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  ArrayList<OrderListBean> articleList = new ArrayList<OrderListBean>();
	        System.out.println("OrderListAction실행됨");
	        // 페이징 처리를 위한 변수 선언
	        int page = 1; // 현재 페이지
	        int limit = 10; // 한 페이지 당 표시할 게시물 수
	        
	        // 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장
	        if(request.getParameter("page") != null) {
	            page = Integer.parseInt(request.getParameter("page"));
	        }
	        
	        OrderSearchBean ob = new OrderSearchBean();
	        ob.setOrder_item_code(request.getParameter("ItemCode"));
	//        ob.setOrder_idx(Integer.parseInt(request.getParameter("order_idx")));
	        ob.setOrder_item_title(request.getParameter("ItemName"));
	        ob.setOrder_member_id(request.getParameter("Buyer"));
	        ob.setOrder_pay_status(request.getParameter("pay")); // 결제상태
	        ob.setOrder_delivery_status(request.getParameter("delivery")); // 배송상태
	        ob.setOrder_item_status(request.getParameter("item_status")); // 주문취소
	        ob.setOrder_bank(request.getParameter("bank"));
	        ob.setOrder_payment(request.getParameter("payment"));//  결제방법
	        
	        System.out.println("jsp script 로 널값 변환되나 보자  ["+request.getParameter("pickStart")+"]");
	        
	        if(request.getParameter("pickStart") !=null) {
    	      String pickStart = request.getParameter("pickStart");
              SimpleDateFormat beforeFormat = new SimpleDateFormat("mm/dd/yyyy");
              SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
              java.util.Date tempDate = null;
              try {
                 tempDate = beforeFormat.parse(pickStart);

              } catch (ParseException e) {
                  e.printStackTrace();
              }
              String transDate = afterFormat.format(tempDate);
              Date start = Date.valueOf(transDate);
              
              ob.setPickStart(start);
              System.out.println("시작 이다"+ start);

            }else {
            	ob.setPickStart(Date.valueOf("2010-01-01"));
            }
            
            if(request.getParameter("pickEnd")!=null) {
    	      String pickEnd = request.getParameter("pickEnd");
              SimpleDateFormat beforeFormat = new SimpleDateFormat("mm/dd/yyyy");
              SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
              java.util.Date tempDate = null;
              try {
                 tempDate = beforeFormat.parse(pickEnd);

              } catch (ParseException e) {
                  e.printStackTrace();
              }
              String transDate = afterFormat.format(tempDate);
              Date end = Date.valueOf(transDate);
              ob.setPickEnd(end);
              System.out.println("끝 이다"+ end);
            }else {
            	ob.setPickEnd(Date.valueOf("2020-01-01"));
            }
            
            System.out.println("액션 심플데이타포맷 위 에러인가?");
            
	        ob.setPage(page);
	        ob.setLimit(limit);
	        
	        System.out.println("시작"+ob.getPickStart());
	        System.out.println("끝"+ob.getPickEnd());
	        System.out.println("ob order_idx request체크:"+ob.getOrder_idx());
	        System.out.println("ob order_item_title request체크:"+ob.getOrder_item_title());
	        System.out.println("ob order_member_id request체크:"+ob.getOrder_member_id());
	        System.out.println("ob order_pay_status request체크:"+ob.getOrder_pay_status());
	        System.out.println("ob order_delivery_status request체크:" + ob.getOrder_delivery_status());
	        System.out.println("ob order_item_status request체크:" + ob.getOrder_item_status());
	        System.out.println("ob.order_bank request체크:"+ob.getOrder_bank());
	        System.out.println("ob order_payment request체크:"+ob.getOrder_payment());
	        
	        OrderListService orderListService = new OrderListService();
	        int listCount = orderListService.getListCount(ob); // 전체 게시물 수 가져오기
	        
	        int delivery1_Count = orderListService.getdelivery1_Count(ob);
	        int delivery2_Count = orderListService.getdelivery2_Count(ob);
	        int delivery3_Count = orderListService.getdelivery3_Count(ob);
	        int delivery4_Count = orderListService.getdelivery4_Count(ob);

	        articleList = orderListService.getArticleList(ob); // 전체 게시물 목록 가져오기(10개 한정)
	        
	        // 전체 페이지(마지막 페이지) 수 계산
	        int maxPage = (int)((double)listCount / limit + 0.95);
	        
	        // 시작 페이지 수 계산
	        int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
	        
	        // 끝 페이지 수 계산
	        int endPage = startPage + 10 - 1;
	        
	        // 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
	        if(endPage > maxPage) {
	            endPage = maxPage;
	        }
	        
	        // PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
	        PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount, delivery1_Count, delivery2_Count, delivery3_Count, delivery4_Count);
	        
	        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
	        request.setAttribute("pageInfo", pageInfo);
	        request.setAttribute("articleList", articleList);
	        	                	        	        	        	       	             
	        
	        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false); // 생략 가능
	        forward.setPath("/admin/admin_orderList.jsp");
	        
	        return forward;
		}
}