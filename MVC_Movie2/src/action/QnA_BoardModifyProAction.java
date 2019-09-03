package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnA_BoardModifyProService;
import vo.ActionForward;
import vo.QnA_BoardBean;

public class QnA_BoardModifyProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardModifyProAction");
        
        // QnA_num, page 파라미터 가져오기(page 파라미터는 String 타입 그대로 가져오기)
        int QnA_num = Integer.parseInt(request.getParameter("QnA_num"));
        String page = request.getParameter("page");
        
        String QnA_pass = request.getParameter("QnA_pass"); // 입력받은 패스워드 파라미터 가져오기
        
        QnA_BoardModifyProService boardModifyProService = new QnA_BoardModifyProService();
        boolean isArticleWriter = boardModifyProService.isArticleWriter(QnA_num, QnA_pass);
        
        ActionForward forward = null;
        
        if(!isArticleWriter) { // 패스워드가 일치하지 않을 경우(올바른 작성자가 아닐 경우)
            // "수정 권한이 없습니다" 경고창 출력 후 이전페이지로 돌아가기
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('수정할 권한이 없습니다')");
            out.println("history.back()");
            out.println("</script>");
        } else { // 패스워드가 일치할 경우
            // 전달받은 파라미터 데이터(번호, 제목, 내용)를 BoardBean 객체에 저장
            QnA_BoardBean article = new QnA_BoardBean();
            article.setQnA_num(QnA_num);
            article.setQnA_subject(request.getParameter("QnA_subject"));
            article.setQnA_content(request.getParameter("QnA_content"));
            
            // BoardModifyProService 객체의 modifyArticle() 메서드를 호출하여 수정 후 결과값 리턴받음
            boolean isModifySuccess = boardModifyProService.modifyArticle(article);
            
            // isModifySuccess 판별
            if(!isModifySuccess) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('글 수정 실패!')");
                out.println("history.back()");
                out.println("</script>");
            } else {
                // 실패했을 경우 if 문을 통해 자바스크립트를 사용하여 이전페이지로 이동해야하므로
                // ActionForward 객체 설정은 else 문을 통해 별도로 설정해야함
                // ActionForward 객체 생성 후
                // BoardDetail.bo 페이지로 포워딩 => 파라미터로 글번호(QnA_num), 페이지(page) 전달
                // => 주소가 변경(새로운 요청)되어야 하므로 Redirect 방식으로 이동
                forward = new ActionForward();
                forward.setPath("QnA_BoardDetail.bo?QnA_num=" + QnA_num + "&page=" + page);
                forward.setRedirect(true); // Redirect 방식이므로 생략 불가
            }
        }
        
        return forward;
    }

}
