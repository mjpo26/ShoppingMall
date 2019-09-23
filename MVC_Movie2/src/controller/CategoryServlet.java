package controller;
import static db.JdbcUtil.getConnection;


import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import dao.MemberDAO;
import vo.ItemBean;

@WebServlet("/CategoryServlet.ca")
public class CategoryServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String cate1 = request.getParameter("item_category1");
        System.out.println("서블릿 왔나"+cate1);
        Connection con = getConnection();
        ItemDAO idao = ItemDAO.getInstance();
        idao.setConnection(con);
        
        if(cate1.equals("")||cate1==null) {
        	request.getSession().setAttribute("messageType","오류메시지");
        	response.sendRedirect("product_category.jsp");
        	return;
        }
        int result = idao.insertCate1(cate1);
        
        // response.getWriter().write(mdao.idcheck(id)+"");
       
    }

}
