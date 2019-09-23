package action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.OrderListService;
import svc.ProductList1Service;
import vo.ActionForward;
import vo.ItemBean;
import vo.PageInfo;
import vo.ProductSearchBean;
import vo.OrderListBean;
import vo.OrderSearchBean;

public class productList1Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  ArrayList<ItemBean> articleList = new ArrayList<ItemBean>();
	        System.out.println("OrderListAction실행됨");
	        // 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장
	        
	        ProductSearchBean pb = new ProductSearchBean();
	        pb.setItem_title(request.getParameter("title"));
//	        pb.setItem_code(Integer.parseInt(request.getParameter("Item_code")));
//	        pb.setMember_id(request.getParameter("member_id"));
//	        pb.setItem_old_price(Integer.parseInt(request.getParameter("old_price")));
//	        pb.setItem_sel_price(Integer.parseInt(request.getParameter("sel_price")));
	        pb.setItem_display(request.getParameter("display"));
	        pb.setItem_sales(request.getParameter("sales"));
	        pb.setItem_category1(request.getParameter("category"));
	        
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
              
              pb.setPickStart(start);
              System.out.println("시작 이다"+ start);

            }else {
            	pb.setPickStart(Date.valueOf("2010-01-01"));
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
              pb.setPickEnd(end);
              System.out.println("끝 이다"+ end);
            }else {
            	pb.setPickEnd(Date.valueOf("2020-01-01"));
            }
            
            System.out.println("액션 심플데이타포맷 위 에러인가?");
            
	        
	        System.out.println("시작"+pb.getPickStart());
	        System.out.println("끝"+pb.getPickEnd());
	        System.out.println("pb 아템코드:"+pb.getItem_code());
	        System.out.println("pb 상품명:"+pb.getItem_title());
//	        System.out.println("pb 맴버아이디:"+pb.getMember_id());
//	        System.out.println("pb 판매가:"+pb.getItem_old_price());
//	        System.out.println("pb 할인후판매가:"+pb.getItem_sel_price());
	        System.out.println("pb 진열상태:"+pb.getItem_display());
	        System.out.println("pb 판매상태:"+pb.getItem_sales());
	        System.out.println("pb 카테고리체크:"+pb.getItem_category1());
	        
	        ProductList1Service productList1Service = new ProductList1Service();
	        
	        
	        
	        articleList = productList1Service.getArticleList(pb); // 전체 게시물 목록 가져오기(10개 한정)
	        
	       
	        
	        // PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
	        
	        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
	        request.setAttribute("articleList", articleList);
	        	                	        	        	        	       	             
	        
	        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false); // 생략 가능
	        forward.setPath("/admin/product_list.jsp");
	        
	        return forward;
		}
}