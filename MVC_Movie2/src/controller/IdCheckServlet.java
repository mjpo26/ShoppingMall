package controller;

import static db.JdbcUtil.getConnection;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/IdcheckServlet.ic")
public class IdCheckServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("fid");
        System.out.println("서블릿 왔나"+id);
        Connection con = getConnection();
        MemberDAO mdao = MemberDAO.getInstance();
        mdao.setConnection(con);
        
        System.out.println(mdao.getMemberCount()+"");
        response.getWriter().write(mdao.idcheck(id)+"");
    }

}
