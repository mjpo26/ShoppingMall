package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BasketInfoService;
import svc.OrderInfoService;
import vo.ActionForward;
import vo.BasketListBean;
import vo.OrderListBean;

public class BasketOrderInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderInfoAction");

		ActionForward forward = null;

		HttpSession session = request.getSession(); // 현재 세션 가져오기
		
		// 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
		String sId = (String) session.getAttribute("sId");
		String bId = (String) request.getParameter("bId");
		if (sId == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다!')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		} else {
			if (bId == null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('잘못된 접근입니다!')");
				out.println("location.href='index.jsp'");
				out.println("</script>");
			} 
			ArrayList<OrderListBean> articleList = new ArrayList<OrderListBean>();
			
			int page = 1;
			int limit = 10;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			OrderInfoService orderInfoService = new OrderInfoService();

//		        int listCount = productListService.getListCount(); 

//		        articleList = productListService.getArticleList(page, limit);
			System.out.println(bId);
			articleList = orderInfoService.getOrderInfo2(bId);

			request.setAttribute("articleList", articleList);

			forward = new ActionForward();

			forward.setPath("/member/orderInfo.jsp");
			forward.setRedirect(false);
		}
			
		return forward;
		

		}
	}
