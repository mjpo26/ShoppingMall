package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.OrderInsertService;
import svc.ProductOrderInfoService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderListBean;

public class productOrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("productOrderProAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String sId = (String) session.getAttribute("sId");
		System.out.println(sId);
		int itemCode = Integer.parseInt(request.getParameter("itemCode"));
		System.out.println(itemCode);
		if (sId == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세용!')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		} else {
			MemberInfoService memberInfoService = new MemberInfoService();
			MemberBean memberBean = memberInfoService.getMemberInfo(sId); // 세션 아이디값을 파라미터로 전달
			ProductOrderInfoService productOrderInfoService = new ProductOrderInfoService();
			ItemBean itemBean = productOrderInfoService.getItemInfo(itemCode);
			if (memberBean != null) {
				// 조회된 회원정보(MemberBean)를 request 객체에 저장
				request.setAttribute("memberBean", memberBean);
				request.setAttribute("itemBean", itemBean);
				OrderListBean orderListBean = new OrderListBean();
				orderListBean.setOrder_item_code(itemBean.getItem_code());
				orderListBean.setOrder_item_title(itemBean.getItem_title());
				orderListBean.setOrder_member_id(memberBean.getMember_id());
				orderListBean.setOrder_member_name(memberBean.getMember_name());
				orderListBean.setOrder_item_point(memberBean.getMember_mypoint());
				OrderInsertService orderInsertService = new OrderInsertService();
				boolean isInsertSuccess = orderInsertService.insertOrder(orderListBean);
				if (!isInsertSuccess) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('주문 실패!')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					forward = new ActionForward();
					forward.setPath("index.jsp");
					forward.setRedirect(true);
				}

				return forward;
			}

		}
		return forward;
	}
}