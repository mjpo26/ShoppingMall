package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberInfoService;
import svc.MemberLoginProService;
import svc.MemberReservationInfoService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberReservationInfoAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("MemberReservationInfoAction");
        
        ActionForward forward = null;
     
        // 현재 세션에 저장된 id 값이 없을 경우 메인 페이지로 이동("잘못된 접근입니다" 출력)
        HttpSession session = request.getSession();
        
        String sId = (String)session.getAttribute("sId");
        if(sId == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('잘못된 접근입니다!')");
            out.println("location.href='index.jsp'");
            out.println("</script>");
        } else {
            // MemberReservationInfoService 클래스의 getReservationList() 메서드 호출 
            // => 세션아이디 전달, ArrayList 타입으로 리턴받음
            //    리턴받은 ArrayList 객체를 request 객체에 저장
            // ActionForward 객체 생성하여 member 폴더의 member_reservation_list.jsp 페이지 포워딩
            MemberReservationInfoService memberReservationInfoService = new MemberReservationInfoService();
            ArrayList reservationList = memberReservationInfoService.getReservationList(sId);
            request.setAttribute("reservationList", reservationList);
            
            forward = new ActionForward();
            forward.setPath("/member/member_reservation_list.jsp");
        }
        
        return forward;
        
    }

}















