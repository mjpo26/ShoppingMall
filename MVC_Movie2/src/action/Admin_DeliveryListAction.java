package action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Admin_DeliveryListService;
import vo.ActionForward;
import vo.Admin_DeliveryListBean;
import vo.Admin_DeliverySearchBean;
import vo.PageInfo;


public class Admin_DeliveryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  ArrayList<Admin_DeliveryListBean> deliveryList = new ArrayList<Admin_DeliveryListBean>();
	        System.out.println("Admin_DeliveryListAction 실행됨");
	        // 페이징 처리를 위한 변수 선언
	        int page = 1; // 현재 페이지
	        int limit = 10; // 한 페이지 당 표시할 게시물 수
	        
	        // 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장
	        if(request.getParameter("page") != null) {
	            page = Integer.parseInt(request.getParameter("page"));
	        }
	        
	        Admin_DeliverySearchBean adb = new Admin_DeliverySearchBean();
            adb.setDelivery_code(request.getParameter("delivery_code"));
            adb.setDelivery_title(request.getParameter("delivery_title"));
            adb.setDelivery_member_id(request.getParameter("delivery_member"));
	        adb.setDelivery_ok(request.getParameter("delivery_ok"));
            adb.setDelivery_bank(request.getParameter("delivery_bank"));
            
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
                
                adb.setPickStart(start);
                System.out.println("시작 이다"+ start);

              }else {
              	adb.setPickStart(Date.valueOf("2010-01-01"));
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
                adb.setPickEnd(end);
                System.out.println("끝 이다"+ end);
              }else {
              	adb.setPickEnd(Date.valueOf("2020-01-01"));
              }
              
	        adb.setPage(page);
	        adb.setLimit(limit);     
	        
	        System.out.println("시작"+adb.getPickStart());
	        System.out.println("끝"+adb.getPickEnd());
	        System.out.println("adb code request체크 :"+adb.getDelivery_code());
	        System.out.println("adb title request체크 :"+adb.getDelivery_title());
	        System.out.println("adb member request체크 :"+adb.getDelivery_member_id());
	        System.out.println("adb ok request체크 :"+adb.getDelivery_ok());
	        System.out.println("adb bank request체크: "+adb.getDelivery_bank());
	        
	        Admin_DeliveryListService admin_DeliveryListService = new Admin_DeliveryListService();
	        int listCount = admin_DeliveryListService.getListCount(adb); // 전체 게시물 수 가져오기

	        deliveryList = admin_DeliveryListService.getDeliveryList(adb); // 전체 게시물 목록 가져오기(10개 한정)
	        
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
	        PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
	        
	        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
	        request.setAttribute("pageInfo", pageInfo);
	        request.setAttribute("deliveryList", deliveryList);
	        
	        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false); // 생략 가능
	        forward.setPath("/admin/admin_deliverylist.jsp");
	        
	        return forward;
		}
}
