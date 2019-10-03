package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class MemberLogoutProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // 저장된 세션 객체 초기화(세션 비우기)
        HttpSession session = request.getSession();
        session.invalidate();
        
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        out.println("<script language='javascript'>");
//        out.println("alert('소셜 로그인도 로그아웃됩니다!')");
//        out.println("location.href=' http://nid.naver.com/nidlogin.logout'");
//        out.println("</script>");
     
               
        ActionForward forward = new ActionForward();
        forward.setPath("index.jsp");
        forward.setRedirect(true);
        
        return forward;
    }

}
