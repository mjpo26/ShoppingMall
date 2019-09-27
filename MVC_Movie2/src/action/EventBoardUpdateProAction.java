package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.EventBoardUpdateProService;
import svc.QnA_BoardModifyProService;
import vo.ActionForward;
import vo.EventBean;

public class EventBoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		EventBoardUpdateProService boardModifyProService = new EventBoardUpdateProService();
		String realFolder = "./upload/event";
		String saveFolder = "./upload/event";
		int fileSize = 10 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		ActionForward forward = null;
		
		int event_num = Integer.parseInt(multi.getParameter("event_num"));
		System.out.println("수정할 이벤트 번호:"+event_num);
		String page = multi.getParameter("page");
		// 패스워드가 일치할 경우
		// 전달받은 파라미터 데이터(번호, 제목, 내용)를 BoardBean 객체에 저장

		EventBean article = new EventBean();
		article.setEvent_num(event_num);
		article.setEvent_subject(multi.getParameter("subject"));
		article.setEvent_content(multi.getParameter("content"));
		article.setEvent_banner(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		article.setEvent_banner2(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		article.setEvent_imageBackground(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		article.setEvent_imageMain(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		article.setEvent_summary(multi.getParameter("summary"));
		article.setEvent_status(multi.getParameter("status"));

		boolean isModifySuccess = boardModifyProService.modifyArticle(article);
		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {

			forward = new ActionForward();
			forward.setPath("EventBoardDetail.event?event_num=" + event_num + "&page=" + page);
			forward.setRedirect(true); // Redirect 방식이므로 생략 불가
		}
		return forward;
	}

}
