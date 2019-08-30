package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.QnA_BoardWriteProService;
import vo.ActionForward;
import vo.QnA_BoardBean;

public class QnA_BoardWriteProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardWriteProAction!");
        
        ActionForward forward = null;
        
        String realFolder = ""; // 실제 업로드 폴더(톰캣)
        String saveFolder = "/boardUpload"; // 이클립스 상의 업로드 폴더
        int fileSize = 10 * 1024 * 1024; // 10MB 제한 크기 지정
        
        // request 객체로부터 서블릿컨텍스트 객체(톰캣) 가져오기
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder); // 이클립스 상의 업로드 폴더에 해당하는 톰캣 실제 폴더
        
        // 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar API 필요)
        MultipartRequest multi = 
                new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

        QnA_BoardBean qnA_BoardBean = new QnA_BoardBean();
        qnA_BoardBean.setQna_name(multi.getParameter("Qna_name"));
        qnA_BoardBean.setQna_pass(multi.getParameter("Qna_pass"));
        qnA_BoardBean.setQna_subject(multi.getParameter("board_subject"));
        qnA_BoardBean.setQna_content(multi.getParameter("board_content"));
        qnA_BoardBean.setQna_file1(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
        
        QnA_BoardWriteProService qnA_BoardWriteProService = new QnA_BoardWriteProService();
        boolean isWriteSuccess = qnA_BoardWriteProService.registArticle(qnA_BoardBean);
        
        if(!isWriteSuccess) { // 글 쓰기에 실패했을 경우
            response.setContentType("text/html;charset=UTF-8"); // 응답 문서 타입 설정
            PrintWriter out = response.getWriter(); // 출력스트림 객체 가져오기
            out.println("<script>");
            out.println("alert('등록실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else { // 글 쓰기에 성공했을 경우
            forward = new ActionForward();
            forward.setPath("BoardList.qb"); // 포워딩 경로 설정
            forward.setRedirect(true); // Redirect 방식 지정
        }
        
        return forward;
    }

}

















