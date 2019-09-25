package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.OrderInfoService;
import svc.ReviewBoardDetailService;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrderListBean;
import vo.ReviewBoardBean;

public class ReviewBoardWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      System.out.println("ReviewBoardReplyFormAction");
	      HttpSession session = request.getSession(); // 현재 세션 가져오기

			// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
			String sId = (String) session.getAttribute("sId");
			int order_item_code=Integer.parseInt(request.getParameter("order_item_code"));
			System.out.println(sId);
			System.out.println(order_item_code);
			OrderListBean orderListBean = OrderInfoService.getOrderInfo1(order_item_code);
	        MemberBean memberBean = MemberInfoService.getMemberInfo(sId); // 세션 아이디값을 파라미터로 전달
	        
	        
	        // 게시물 번호(Review_num), 현재 페이지(page) 파라미터 가져오기
	        
	        // BoardDetailService 클래스의 getArticle() 메서드를 호출하여 게시물 정보 가져오기
	        System.out.println("여기는 직히나요 ????????"+orderListBean.getOrder_idx());
	        // 현재 게시물 정보(article), 현재 페이지(page) request 객체에 저장
	        request.setAttribute("memberBean", memberBean);
	        request.setAttribute("orderListBean", orderListBean);
	        
	        ActionForward forward = new ActionForward();
	        forward.setPath("/reviewBoard/write.jsp");
	        forward.setRedirect(false);
	        return forward;
	    }
}
