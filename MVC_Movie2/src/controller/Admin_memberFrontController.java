package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberDeleteProAction;
import action.MemberInfoAction;
import action.MemberJoinProAction;
import action.MemberLoginProAction;
import action.MemberLogoutProAction;
import action.MemberUpdateProAction;
import vo.ActionForward;

@WebServlet("*.me")
public class Admin_memberFrontController extends HttpServlet {
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 한글 설정
        
        // 서블릿 주소 가져오기
        String command = request.getServletPath();
        //
        Action action = null;
        ActionForward forward = null;
        
        if(command.equals("/MemberLoginForm.me")) {
            forward = new ActionForward();
            forward.setPath("/member/loginForm.jsp");
        } else if(command.equals("/MemberJoinForm.me")) {
            forward = new ActionForward();
            forward.setPath("/member/joinForm.jsp");
        } else if(command.equals("/MemberLoginPro.me")) {
            action = new MemberLoginProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MemberLogoutPro.me")) {
            action = new MemberLogoutProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MemberJoinPro.me")) {
            action = new MemberJoinProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MemberInfo.me")) {
            action = new MemberInfoAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MemberDeletePro.me")) {
            action = new MemberDeleteProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/MemberUpdatePro.me")) {
            action = new MemberUpdateProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        
        // 포워딩 처리
        if(forward != null) {
            // ActionForward 객체의 isRedirect() 메서드가 true 이면 Redirect 방식으로 포워딩
            //                        ""                  false 이면 Dispatcher 방식으로 포워딩
            if(forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
    
}
