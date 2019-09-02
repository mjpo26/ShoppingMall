package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewBoardModifyProService;
import vo.ActionForward;
import vo.ReviewBoardBean;

public class ReviewBoardModifyProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	System.out.println(request.getParameter("review_num"));
        int review_num = Integer.parseInt(request.getParameter("review_num"));
        String page = request.getParameter("page");
        
        String review_pass = request.getParameter("review_pass");
        
        ReviewBoardModifyProService boardModifyProService = new  ReviewBoardModifyProService();
        boolean isArticleWriter = boardModifyProService.isArticleWriter(review_num, review_pass);
        
        ActionForward forward = null;
        
        if(!isArticleWriter) { 
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('수정할 권한이 없습니다')");
            out.println("history.back()");
            out.println("</script>");
        } else { 
            ReviewBoardBean article = new ReviewBoardBean();
            article.setReview_num(review_num);
            article.setReview_subject(request.getParameter("review_subject"));
            article.setReview_content(request.getParameter("review_content"));
            
            boolean isModifySuccess = boardModifyProService.modifyArticle(article);
            
            if(!isModifySuccess) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('글 수정 실패!')");
                out.println("history.back()");
                out.println("</script>");
            } else {
                forward = new ActionForward();
                forward.setPath("ReviewBoardDetail.re?review_num=" + review_num + "&page=" + page);
                forward.setRedirect(true); 
            }
        }
        
        return forward;
    }
}
