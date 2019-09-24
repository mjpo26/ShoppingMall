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
import vo.ItemBean;
@WebServlet("/CategoryListServlet.ca")
public class CategoryListServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        Connection con = getConnection();
        ItemDAO idao = ItemDAO.getInstance();
        idao.setConnection(con);
        
       
        ArrayList<ItemBean> cateList = new ArrayList<ItemBean>();
        cateList=idao.selectCate1();
        String aaa="";
        for(int i=0;i<cateList.size();i++) {
        	
        	aaa += cateList.get(i).getItem_category1()+"/";
        	//response.getWriter().write(cateList.get(i).getItem_category1());
        //System.out.println(cateList.get(i).getItem_category1());
       
        }
        
        System.out.println(aaa);
        
        response.getWriter().write("가나");
        
        
        
    }
        
        
       
}
