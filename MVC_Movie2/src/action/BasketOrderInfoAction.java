package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BasketInfoService;
import svc.MemberInfoService;
import svc.OrderInfoService;
import svc.ProductDetailService;
import vo.ActionForward;
import vo.BasketListBean;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderListBean;

public class BasketOrderInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BasketOrderAction 실행됨");
		ActionForward forward = null;

		HttpSession session = request.getSession();

//		int itemCode = Integer.parseInt(request.getParameter("Item_code"));
		String sId = (String) session.getAttribute("sId");
		int bId = Integer.parseInt((String) request.getParameter("bId"));
		System.out.println(bId);
		ProductDetailService productDetailService = new ProductDetailService();
		MemberInfoService memberInfoService = new MemberInfoService();
		MemberBean memberBean = memberInfoService.getMemberInfo(sId);
		BasketInfoService basketInfoService = new BasketInfoService();
		BasketListBean basketListBean = basketInfoService.getBasketInfo1(bId); 
//		ItemBean itemBean = productDetailService.getArticle(itemCode);
		
		request.setAttribute("basketListBean", basketListBean);
		request.setAttribute("memberBean", memberBean);
//		request.setAttribute("itemBean", itemBean);
		
		if (memberBean != null) {
			// 조회된 회원정보(MemberBean)를 request 객체에 저장
			request.setAttribute("basketListBean", basketListBean);
			request.setAttribute("memberBean", memberBean);
//			request.setAttribute("itemBean", itemBean);
			forward = new ActionForward();
			forward.setPath("/Product/productPay2.jsp");

			forward.setRedirect(false); // 생략 가능
		}
		return forward;
		
		
		
		
		
	}
		
	}
//		System.out.println("OrderInfoAction");
//
//		ActionForward forward = null;
//
//		HttpSession session = request.getSession(); // 현재 세션 가져오기
//		
//		// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
//		String sId = (String) session.getAttribute("sId");
//		String bId = (String) request.getParameter("bId");
//		if (sId == null) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('잘못된 접근입니다!')");
//			out.println("location.href='index.jsp'");
//			out.println("</script>");
//		} else {
//			if (bId == null) {
//				response.setContentType("text/html;charset=UTF-8");
//				PrintWriter out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('잘못된 접근입니다!')");
//				out.println("location.href='index.jsp'");
//				out.println("</script>");
//			} 
//			ArrayList<OrderListBean> articleList = new ArrayList<OrderListBean>();
//			
//			int page = 1;
//			int limit = 10;
//
//			if (request.getParameter("page") != null) {
//				page = Integer.parseInt(request.getParameter("page"));
//			}
//			OrderInfoService orderInfoService = new OrderInfoService();
//
////		        int listCount = productListService.getListCount(); 
//
////		        articleList = productListService.getArticleList(page, limit);
//			System.out.println(bId);
//			articleList = orderInfoService.getOrderInfo2(bId);
//
//			request.setAttribute("articleList", articleList);
//
//			forward = new ActionForward();
//
//			forward.setPath("/member/orderInfo.jsp");
//			forward.setRedirect(false);
//		}
//			
//		return forward;
//		
//
//		}
	
