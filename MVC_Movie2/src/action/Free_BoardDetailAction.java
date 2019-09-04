package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Free_BoardDetailService;
import vo.ActionForward;
import vo.Free_BoardBean;

public class Free_BoardDetailAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardDetailAction");
        
        // 파라미터로 전달된 free_num, page 데이터 가져오기
        int free_num = Integer.parseInt(request.getParameter("free_num"));
        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음 
        
        System.out.println("보드디테일액션왔다.페이지값가져옴");
        // BoardDetailService 객체 생성
        Free_BoardDetailService boardDetailService = new Free_BoardDetailService();
        
        // BoardDetailService 객체의 getArticle() 메서드를 호출하여 글 상세 내용 BoardBean 타입으로 리턴받음
        Free_BoardBean article = boardDetailService.getArticle(free_num);
        
        // page 값 request 객체에 저장
        // 글 상세 내용 BoardBean 객체 request 객체에 저장
        request.setAttribute("page", page);
        request.setAttribute("article", article);
        System.out.println("액션:보드뷰 가기전에 article 값 있나?"+article);
        
        // /free_board/qna_board_view.jsp 페이지로 포워딩(Dispatcher 방식)
        ActionForward forward = new ActionForward();
        forward.setPath("/free_board/Free_board_view.jsp"); // 포워딩 주소 지정
        forward.setRedirect(false); // 포워딩 방식 지정 => Dispatcher 방식은 false 전달(생략 가능)
        
        return forward; // ActionForward 객체 리턴
        
    }

}













