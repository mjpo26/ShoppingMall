package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinProService;
import svc.MemberUpdateProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberUpdateProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("MemberJoinProAction");
        
        // 회원가입 폼 입력 데이터 가져와서 MemberBean 에 저장
        MemberBean memberBean = new MemberBean();
        memberBean.setMember_id(request.getParameter("id"));
        memberBean.setMember_pass(request.getParameter("pass"));
        memberBean.setMember_name(request.getParameter("name"));
        memberBean.setMember_postcode1(request.getParameter("postcode"));
        memberBean.setMember_address1(request.getParameter("address")+"/"+request.getParameter("detailaddress"));
        memberBean.setMember_phone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));
        memberBean.setMember_email(request.getParameter("email") + "@" + request.getParameter("domain"));
        memberBean.setMember_address_x1(request.getParameter("resultx"));
        memberBean.setMember_address_y1(request.getParameter("resulty"));
        memberBean.setMember_sms_ok(request.getParameter("isSmsOk"));
        memberBean.setMember_email_ok(request.getParameter("isEmailOk"));
        memberBean.setMember_address1_nick("기본 배송지");
        memberBean.setMember_grade("일반회원");
        System.out.println("문자노노오오오"+memberBean.getMember_sms_ok());
        MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
        boolean isUpdateSuccess = memberUpdateProService.updateMember(memberBean);
     
        // 회원 추가 결과가 false 일 경우
        // "회원 가입 실패!" 경고 출력 후 이전 페이지로 이동
        // true 일 경우 index.jsp 로 이동
        ActionForward forward = null;
        
        if(!isUpdateSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('회원 수정 실패!')");
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

















