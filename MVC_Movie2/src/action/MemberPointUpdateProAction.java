package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinProService;
import svc.MemberUpdateProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberPointUpdateProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("MemberJoinProAction");
        
        // 회원가입 폼 입력 데이터 가져와서 MemberBean 에 저장
        MemberBean memberBean = new MemberBean();
        memberBean.setMember_id(request.getParameter("mId"));
        memberBean.setMember_mypoint(Integer.parseInt(request.getParameter("mypoint")));
        MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
        boolean isUpdateSuccess = memberUpdateProService.updatePointMember(memberBean);
     
        // 회원 추가 결과가 false 일 경우
        // "회원 가입 실패!" 경고 출력 후 이전 페이지로 이동
        // true 일 경우 index.jsp 로 이동
        ActionForward forward = null;
        
        if(!isUpdateSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('포인트 수정 실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else {
            forward = new ActionForward();
            forward.setPath("index.jsp");
            forward.setRedirect(true);
        }
        
        return forward;
    }

}

















