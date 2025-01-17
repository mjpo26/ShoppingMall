package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProductDetailService;
import vo.ActionForward;
import vo.ItemBean;

public class productUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   System.out.println("ProductUpdateAction ");
		   System.out.println(request.getParameter("Item_code"));
	        
	        // 파라미터로 전달된 board_num, page 데이터 가져오기
	        int item_code = Integer.parseInt(request.getParameter("Item_code"));
	        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음
	        if(request.getParameter("page")=="") {
	        	page = request.getParameter("1"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음
	        }
//	        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음 
	        
	        // BoardDetailService 객체 생성
	        ProductDetailService productDetailService = new ProductDetailService();
	        
	        // BoardDetailService 객체의 getArticle() 메서드를 호출하여 글 상세 내용 BoardBean 타입으로 리턴받음
	        ItemBean article = productDetailService.getArticle(item_code);
	        
	        // page 값 request 객체에 저장
	        // 글 상세 내용 BoardBean 객체 request 객체에 저장
	        request.setAttribute("page", page);
	        request.setAttribute("article", article);
	        
	        // /board/qna_board_view.jsp 페이지로 포워딩(Dispatcher 방식)
	        ActionForward forward = new ActionForward();
	        forward.setPath("/admin/product_update.jsp"); // 포워딩 주소 지정
	        forward.setRedirect(false); // 포워딩 방식 지정 => Dispatcher 방식은 false 전달(생략 가능)
	        
	        return forward; // ActionForward 객체 리턴
	}

}
