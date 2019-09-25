package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.ReviewBoardDetailService;
import vo.ActionForward;
import vo.MemberBean;
import vo.ReviewBoardBean;

public class ReviewBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    HttpSession session = request.getSession(); 
	    
		int review_num = Integer.parseInt(request.getParameter("review_num"));
        String page = request.getParameter("page");
    	String sId = (String) session.getAttribute("sId");
        MemberBean memberBean = MemberInfoService.getMemberInfo(sId); 
		System.out.println(sId);

        ReviewBoardDetailService boardDetailService = new ReviewBoardDetailService();
        
        ReviewBoardBean article = boardDetailService.getArticle(review_num);
        
        request.setAttribute("page", page);
        request.setAttribute("article", article);
        request.setAttribute("memberBean", memberBean);
        
        ActionForward forward = new ActionForward();
        forward.setPath("/reviewBoard/view.jsp"); 
        forward.setRedirect(false); 

        return forward; 
	}
}
