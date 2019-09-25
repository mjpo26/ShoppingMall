package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.MemberUpdateProService;
import svc.OrderInsertService;
import svc.ProductOrderInfoService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;
import vo.OrderBean;

public class productOrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("productOrderProAction");
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String sId = (String) session.getAttribute("sId");
		System.out.println(sId);
		int itemCode = Integer.parseInt(request.getParameter("itemCode"));
		int item_point = Integer.parseInt(request.getParameter("item_point"));
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
			MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
			memberUpdateProService.insertPoint(sId,item_point);
			
			ProductOrderInfoService productOrderInfoService = new ProductOrderInfoService();
			ItemBean itemBean = productOrderInfoService.getItemInfo(itemCode);
			if (memberBean != null) {
				// 조회된 회원정보(MemberBean)를 request 객체에 저장
				request.setAttribute("memberBean", memberBean);
				request.setAttribute("itemBean", itemBean);
				OrderBean OrderBean = new OrderBean();
				OrderBean.setOrder_item_code(itemBean.getItem_code());
				OrderBean.setOrder_item_title(itemBean.getItem_title());
//				OrderBean.setOrder_item_option_color(order_item_option_color);
//				OrderBean.setOrder_item_option_color(itemBean.getItem);
				OrderBean.setOrder_member_id(memberBean.getMember_id());
				OrderBean.setOrder_member_name(memberBean.getMember_name());
				OrderBean.setOrder_item_point(memberBean.getMember_mypoint());
				OrderInsertService orderInsertService = new OrderInsertService();
				boolean isInsertSuccess = orderInsertService.insertOrder(OrderBean);
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