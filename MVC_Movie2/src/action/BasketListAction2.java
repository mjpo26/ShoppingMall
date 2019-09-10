package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BasketListService;
import svc.BasketListService2;
import vo.ActionForward;
import vo.BasketListBean;
import vo.Basket_PageInfo;
import vo.ItemBean;

public class BasketListAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	      BasketListBean basketListBean = new BasketListBean();  
		  System.out.println("BasketListAction 실행됨");
	        // 페이징 처리를 위한 변수 선언
	        String sId = request.getParameter("sId");
	        System.out.println(request.getParameter("sId"));
	        System.out.println(request.getParameter("Item_code"));
	        System.out.println(request.getParameter("Item_title"));
	        System.out.println(request.getParameter("Item_old_price"));
	        System.out.println(request.getParameter("Item_sel_price"));
	        System.out.println(request.getParameter("Item_delivery_pee"));
	        System.out.println(request.getParameter("Item_point"));
	        System.out.println(request.getParameter("Item_code_count"));
	        
	        basketListBean.setBasket_member_id(request.getParameter("sId"));
	        basketListBean.setBasket_code(Integer.parseInt(request.getParameter("Item_code")));
	        basketListBean.setBasket_title(request.getParameter("Item_title"));
	        basketListBean.setBasket_new_price(Integer.parseInt(request.getParameter("Item_old_price")));
	        basketListBean.setBasket_sel_price(Integer.parseInt(request.getParameter("Item_sel_price")));
	        basketListBean.setBasket_delivery_pee(Integer.parseInt(request.getParameter("Item_delivery_pee")));
	        basketListBean.setBasket_point(Integer.parseInt(request.getParameter("Item_point")));
	        basketListBean.setBasket_code_count(Integer.parseInt(request.getParameter("Item_code_count")));
			
			
	        BasketListService2 basketListService = new BasketListService2();
	        
	        boolean isInsertSuccess = basketListService.insertbasket(basketListBean,sId);
	        
	        	        
	        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false); // 생략 가능
	        forward.setPath("index.jsp");
	        
	        return forward;
		}
}
