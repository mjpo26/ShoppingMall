package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import svc.MemberInfoService;
import svc.MemberLoginProService;
import svc.MemberUserCheckService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberUsercheckAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("MemberInfoAction");
        
        ActionForward forward = null;
        
        HttpSession session = request.getSession(); // 현재 세션 가져오기
        
        // 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
        String id = (String)request.getParameter("id");

//            MemberInfoService memberInfoService = new MemberInfoService();
            MemberUserCheckService memberUserCheckService  = new MemberUserCheckService();
            
            JSONObject json = memberUserCheckService.searchId(id); // 세션 아이디값을 파라미터로 전달
            
            if(json != null) {
                // 조회된 회원정보(MemberBean)를 request 객체에 저장
                request.setAttribute("json", json);
                
                forward = new ActionForward();
                forward.setPath("/MemberJoinForm.me");
//                forward.setPath("/member/memberInfo.jsp");
                forward.setRedirect(false);
            }
            

        
        return forward;
        
    }

}















