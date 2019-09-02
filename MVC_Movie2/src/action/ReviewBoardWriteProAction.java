package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ReviewBoardWriteProService;
import vo.ActionForward;
import vo.ReviewBoardBean;

import action.Action;

public class ReviewBoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;
        
        String realFolder = ""; 
        String saveFolder = "/reviewBoardUpload"; 
        int fileSize = 10 * 1024 * 1024; 
        
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder); 
       
        MultipartRequest multi = 
                new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

        
        ReviewBoardBean boardBean = new ReviewBoardBean();
   
        boardBean.setReview_writer(multi.getParameter("review_writer"));
        boardBean.setReview_id(multi.getParameter("review_id"));
        boardBean.setReview_pass(multi.getParameter("review_pass"));
        boardBean.setReview_subject(multi.getParameter("review_subject"));
        boardBean.setReview_content(multi.getParameter("review_content"));
        boardBean.setReview_file1(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
        boardBean.setReview_starPoint(Integer.parseInt(multi.getParameter("review_starPoint")));
        ReviewBoardWriteProService reviewBoardWriteProService = new ReviewBoardWriteProService();
       
        boolean isWriteSuccess = reviewBoardWriteProService.registArticle(boardBean);
        
      
        if(!isWriteSuccess) { 
            response.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('등록실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else { 
            forward = new ActionForward();
            forward.setPath("ReviewBoardList.re"); 
       
            forward.setRedirect(true); 
        }
              return forward;
	}

}