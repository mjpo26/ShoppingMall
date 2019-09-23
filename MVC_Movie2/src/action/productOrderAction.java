package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.ProductDetailService;
import svc.ProductOrderService;
import vo.ActionForward;
import vo.ItemBean;
import vo.MemberBean;

public class productOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("productOrderAction 실행됨");
		ActionForward forward = null;

		HttpSession session = request.getSession();

		int itemCode = Integer.parseInt(request.getParameter("Item_code"));
		String page = request.getParameter("page");
		String sId = (String) session.getAttribute("sId");
		ProductDetailService productDetailService = new ProductDetailService();
		MemberInfoService memberInfoService = new MemberInfoService();
		MemberBean memberBean = memberInfoService.getMemberInfo(sId);
		ItemBean itemBean = productDetailService.getArticle(itemCode);
		String item_code_count =request.getParameter("Item_code_count");
		String item_color=(String)request.getAttribute("item_color");
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("page", page);
		request.setAttribute("itemBean", itemBean);
		request.setAttribute("item_color", item_color);
		System.out.println("아아아아ㅏ아아"+item_color);
		if (memberBean != null) {
			// 조회된 회원정보(MemberBean)를 request 객체에 저장
			request.setAttribute("memberBean", memberBean);
			request.setAttribute("itemBean", itemBean);
			request.setAttribute("item_code_count", item_code_count);
			request.setAttribute("item_color", item_color);
			request.setAttribute("page", page);
			forward = new ActionForward();
			forward.setPath("/Product/productPay.jsp");

			forward.setRedirect(false); // 생략 가능
		}
		return forward;
	}
}