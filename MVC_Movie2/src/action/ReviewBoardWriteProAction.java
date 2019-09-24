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
        
        String realFolder = "./upload/review"; 
        String saveFolder = "./upload/review"; 
        int fileSize = 10 * 1024 * 1024; 
//        int review_orderNo = Integer.parseInt(request.getParameter("num"));
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
        boardBean.setReview_orderNo(Integer.parseInt(multi.getParameter("order_idx")));
        System.out.println("주문번호는!!!!!!"+boardBean.getReview_orderNo());
        boardBean.setReview_order_item_code(Integer.parseInt(multi.getParameter("order_item_code")));
        System.out.println("아이템 코드요@@@@@@@@@@@@ "+boardBean.getReview_order_item_code());
        
        
        ReviewBoardWriteProService reviewBoardWriteProService = new ReviewBoardWriteProService(); 
        System.out.println("네? 코드요? "+boardBean.getReview_order_item_code());
        System.out.println("주문벙호!!"+boardBean.getReview_orderNo());
        System.out.println("네? 작성자코드요? "+boardBean.getReview_writer());
        boolean isWriteSuccess = reviewBoardWriteProService.registArticle(boardBean);
      
        if(!isWriteSuccess) { 
            response.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('등록실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else { 
            System.out.println();
            forward = new ActionForward();
            forward.setPath("ReviewBoardList.re"); 
            forward.setRedirect(true); 
        }
        
              return forward;
	}

}
