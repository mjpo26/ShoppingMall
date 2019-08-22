package action;

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
        
        ActionForward forward = new ActionForward();
        forward.setPath("index.jsp");
        forward.setRedirect(true);
        
        return forward;
    }

}
