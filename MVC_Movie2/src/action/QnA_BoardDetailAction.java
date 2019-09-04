package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Free_BoardDetailService;
import svc.QnA_BoardDetailService;
import vo.ActionForward;
import vo.Free_BoardBean;
import vo.QnA_BoardBean;

public class QnA_BoardDetailAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardDetailAction");
        
        // 파라미터로 전달된 free_num, page 데이터 가져오기
        int QnA_num = Integer.parseInt(request.getParameter("QnA_num"));
        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음 
        
        System.out.println("Board Detail Action 까지 들어옴 + 페이지 값 받아옴");
        // BoardDetailService 객체 생성
        QnA_BoardDetailService boardDetailService = new QnA_BoardDetailService();
        
        // BoardDetailService 객체의 getArticle() 메서드를 호출하여 글 상세 내용 BoardBean 타입으로 리턴받음
        QnA_BoardBean article = boardDetailService.getArticle(QnA_num);
        
        // page 값 request 객체에 저장
        // 글 상세 내용 BoardBean 객체 request 객체에 저장
        request.setAttribute("page", page);
        request.setAttribute("article", article);
        System.out.println("Action에서는 BoardView에 가기전에 article 값이 있는지?"+article);
        
        // /free_board/qna_board_view.jsp 페이지로 포워딩(Dispatcher 방식)
        ActionForward forward = new ActionForward();
        forward.setPath("/QnA_Board/QnA_Board_view.jsp"); // 포워딩 주소 지정
        forward.setRedirect(false); // 포워딩 방식 지정 => Dispatcher 방식은 false 전달(생략 가능)
        
        return forward; // ActionForward 객체 리턴
        
    }

}













