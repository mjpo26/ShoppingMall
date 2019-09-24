package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import svc.MemberIdCheckService;
import svc.MemberInfoService;
import svc.MemberJoinProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFwFindAction implements Action {

	   @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   ActionForward forward = null;
		   response.setContentType("text/html;charset=UTF-8");
		   HttpSession session = request.getSession(); // 현재 세션 가져오기
	        
		    String id = request.getParameter("member_id");
		    String phone =request.getParameter("phon1")+"-"+request.getParameter("phon2")+"-"+request.getParameter("phon3");
		    
		    System.out.println(phone);
	        MemberIdCheckService memberIdcheckService = new MemberIdCheckService();
		    MemberBean memberBean = memberIdcheckService.findFw(id, phone);
		    
	            
	           

	                // 조회된 회원정보(MemberBean)를 request 객체에 저장
	                request.setAttribute("memberBean", memberBean);
	                
	                forward = new ActionForward();
	                //    forward.setPath("./idcheck.jsp");
	                    forward.setPath("./member/pw_findpro.jsp");
	                    forward.setRedirect(false);

	            
	        return forward;
	    }

	}