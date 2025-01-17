package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BasketDeleteProService;
import svc.MemberDeleteProService;
import vo.ActionForward;

public class BasketDeleteProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
        HttpSession session =  request.getSession();
       String sId= (String)session.getAttribute("sId");
       String bId = (String)request.getParameter("bId");
       BasketDeleteProService basketDeleteProService = new BasketDeleteProService();
       boolean isDeleteSuccess = basketDeleteProService.isDeleteMember(bId);
       
       //회원삭제 결과가 false일경우 삭제 실패출력 후 이전페이지로이동
       //true일 경우 index.jsp로 이동
       ActionForward forward = null;
       
       if(!isDeleteSuccess) {
           response.setContentType("text/html;charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.println("<script>");
           out.println("alert('장바구니 삭제 실패!')");
           out.println("history.back()");
           out.println("</script>");
       } else {
           session.setAttribute("sId", sId);
           forward = new ActionForward();
           forward.setPath("./BasketInfo.bl");
           forward.setRedirect(true);
       }
        
        
        
        
        return forward;
    }

}
