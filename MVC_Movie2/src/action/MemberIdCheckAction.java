package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberIdCheckService;
import svc.MemberInfoService;
import svc.MemberJoinProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberIdCheckAction implements Action {

	   @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        
		    String id = request.getParameter("fid");
	        MemberIdCheckService memberIdcheckService = new MemberIdCheckService();
	        int Member_idcheck = memberIdcheckService.Member_idcheck(id);
	        
	        ActionForward forward = null;
	            response.setContentType("text/html;charset=UTF-8");
	            
	            forward = new ActionForward();
	            forward.setPath("./idcheck.jsp");
	            forward.setRedirect(true);
	        
	        return forward;
	    }

	}