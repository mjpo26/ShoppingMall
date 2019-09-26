package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.EventWriteProService;
import svc.MemberInfoService;
import svc.OrderInfoService;
import vo.ActionForward;
import vo.EventBean;

public class EventBoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		System.out.println("EventBoardWriteFormAction 실행 !!");

		String realFolder = "./upload/event";
		String saveFolder = "./upload/event";
		int fileSize = 10 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		EventBean eventBean = new EventBean();
		eventBean.setEvent_subject(multi.getParameter("subject"));
		eventBean.setEvent_content(multi.getParameter("content"));
		eventBean.setEvent_banner(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		eventBean.setEvent_banner2(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		eventBean.setEvent_imageBackground(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		eventBean.setEvent_imageMain(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		eventBean.setEvent_summary(multi.getParameter("summary"));
		eventBean.setEvent_status(multi.getParameter("status"));
		System.out.println(eventBean.getEvent_subject());
		EventWriteProService eventWriteProService = new EventWriteProService();
		boolean isWriteSuccess = eventWriteProService.registArticle(eventBean);
		
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
            forward.setPath("admin.ma"); 
            forward.setRedirect(true); 
        }
		return forward;
	}
}
