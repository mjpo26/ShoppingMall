package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.MemberLoginProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberUpdateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("MemberUpdateAction");
        
        ActionForward forward = null;
        
        HttpSession session = request.getSession(); // 현재 세션 가져오기
        
        // 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
        String sId = (String)session.getAttribute("sId");
        String mId = (String)request.getParameter("mId");
        if(mId==null) {
        	mId=sId;
        }
        if(sId == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('잘못된 접근입니다!')");
            out.println("location.href='index.jsp'");
            out.println("</script>");
        } else {
            MemberInfoService memberInfoService = new MemberInfoService();
            MemberBean memberBean = memberInfoService.getMemberInfo(mId); // 세션 아이디값을 파라미터로 전달
            
            if(memberBean != null) {
                // 조회된 회원정보(MemberBean)를 request 객체에 저장
                request.setAttribute("memberBean", memberBean);
                
                forward = new ActionForward();
                forward.setPath("/member/memberUpdate.jsp");
//                forward.setPath("/member/memberInfo.jsp");
                forward.setRedirect(false);
            }
            
        }
        
        return forward;
        
    }

}















