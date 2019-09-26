package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProductDeleteProService;
import svc.ProductDetailService;
import vo.ActionForward;
import vo.ItemBean;

public class productDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   System.out.println("ProductDeleteAction ");
		   System.out.println(request.getParameter("Item_code"));
	        
	        // 파라미터로 전달된 board_num, page 데이터 가져오기
	        int item_code = Integer.parseInt(request.getParameter("Item_code"));
	        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음
	        if(request.getParameter("page")=="") {
	        	page = request.getParameter("1"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음
	        }
//	        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음 
	        ActionForward forward = new ActionForward();
	        
	        // BoardDetailService 객체 생성
	        ProductDeleteProService productDeleteProService = new ProductDeleteProService();
	        // BoardDetailService 객체의 getArticle() 메서드를 호출하여 글 상세 내용 BoardBean 타입으로 리턴받음
	        
	        boolean isDeleteSuccess = productDeleteProService.isDeleteItem(item_code);
	        // page 값 request 객체에 저장
	        // 글 상세 내용 BoardBean 객체 request 객체에 저장
	        if(!isDeleteSuccess) {
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('아이템 삭제 실패!')");
	            out.println("history.back()");
	            out.println("</script>");
	        } else {
	            forward = new ActionForward();
	            forward.setPath("./main.ma");
	            forward.setRedirect(true);
	        }
	        
	        
	        return forward; // ActionForward 객체 리턴
	}

}
