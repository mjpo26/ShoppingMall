package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProductInsertProService;
import vo.ActionForward;
import vo.ItemBean;

public class ProductInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductInserProAction");
		  ItemBean itemBean = new ItemBean();
		  	itemBean.setItem_title(request.getParameter("title"));
		  	itemBean.setItem_old_price(Integer.parseInt(request.getParameter("old_price")));
		  	itemBean.setItem_content1(request.getParameter("content1"));
		  	itemBean.setItem_content2(request.getParameter("content2"));
		  	itemBean.setItem_BGpic(request.getParameter("BGpic"));
		  	itemBean.setItem_pic1(request.getParameter("pic1"));
		  	itemBean.setItem_display(request.getParameter("display"));
		  	itemBean.setItem_sales(request.getParameter("sales"));
		  	itemBean.setItem_category1(request.getParameter("category"));
		  	itemBean.setItem_stock_price(Integer.parseInt(request.getParameter("stock_price")));
		  	itemBean.setItem_delivery_pee(Integer.parseInt(request.getParameter("delivery_pee")));
		  	itemBean.setItem_weight(Integer.parseInt(request.getParameter("weight")));
		  	itemBean.setItem_stock_count(Integer.parseInt(request.getParameter("stock_count")));
		  	
		  	
	        ProductInsertProService productInsertProService = new ProductInsertProService(); 
	        
	        boolean isInsertSuccess = productInsertProService.insertItem(itemBean);
	        
	        // 회원 추가 결과가 false 일 경우
	        // "회원 가입 실패!" 경고 출력 후 이전 페이지로 이동
	        // true 일 경우 index.jsp 로 이동
	        ActionForward forward = null;
	        
	        if(!isInsertSuccess) {
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('상품 등록 실패!')");
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
