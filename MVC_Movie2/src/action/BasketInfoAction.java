package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BasketInfoService;
import svc.MemberInfoService;
import svc.ProductListService;
import vo.ActionForward;
import vo.BasketListBean;
import vo.ItemBean;
import vo.MemberBean;
import vo.PageInfo;

public class BasketInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  System.out.println("BasketInfoAction");
	        
	        ActionForward forward = null;	     
	        HttpSession session = request.getSession(); // 현재 세션 가져오기
			String bId = (String) request.getAttribute("bId");
			
			System.out.println("bId값 : "+bId);
	        // 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
	        String sId = (String)session.getAttribute("sId");
	        if(sId == null) {
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('잘못된 접근입니다!')");
	            out.println("location.href='index.jsp'");
	            out.println("</script>");
	        } else {
	        	ArrayList<BasketListBean> articleList = new ArrayList<BasketListBean>();
		        
		        int page = 1; 
		        int limit = 10;
		        
		        if(request.getParameter("page") != null) {
		            page = Integer.parseInt(request.getParameter("page"));
		        }
	        	BasketInfoService basketInfoService = new BasketInfoService();
	        	
//		        int listCount = productListService.getListCount(); 
		        
//		        articleList = productListService.getArticleList(page, limit);
		        articleList = basketInfoService.getBasketInfo(sId);
		      
		        request.setAttribute("articleList", articleList);
		        request.setAttribute("bId", bId);
		        forward = new ActionForward();
	        
                forward.setPath("/member/baksetInfo.jsp");		        
                forward.setRedirect(false);		        
	            }
	            

	        
	        return forward;
	        
	}

}
