package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardDetailService;
import vo.ActionForward;
import vo.ReviewBoardBean;

public class ReviewBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
   
		int review_num = Integer.parseInt(request.getParameter("review_num"));
        String page = request.getParameter("page");
        

        ReviewBoardDetailService boardDetailService = new ReviewBoardDetailService();
        
        ReviewBoardBean article = boardDetailService.getArticle(review_num);
        
        request.setAttribute("page", page);
        request.setAttribute("article", article);
        
        ActionForward forward = new ActionForward();
        forward.setPath("/reviewBoard/view.jsp"); 
        forward.setRedirect(false); 

        return forward; 
	}
}
