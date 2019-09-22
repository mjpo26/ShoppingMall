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

public class MemberIdCheckAction implements Action {

	   @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        
		    String id = request.getParameter("fid");
		    System.out.println("멤버아이디체크-액션"+id);
	        MemberIdCheckService memberIdcheckService = new MemberIdCheckService();
	      //  int Member_idcheck = memberIdcheckService.Member_idcheck(id);
	        JSONObject json = memberIdcheckService.Member_idcheck(id);
	        ActionForward forward = null;
	            response.setContentType("text/html;charset=UTF-8");
	            System.out.println("액션 json 리턴받은거 확인"+json.toJSONString());
	            
	           
	            if(json != null) {
	                // 조회된 회원정보(MemberBean)를 request 객체에 저장
	                request.setAttribute("json", json);
	                
	                forward = new ActionForward();
	                //    forward.setPath("./idcheck.jsp");
	                    forward.setPath("./join.jsp");
	                    forward.setRedirect(true);
	            }
	            
	        return forward;
	    }

	}