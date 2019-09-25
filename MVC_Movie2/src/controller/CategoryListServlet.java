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
        
       
        ArrayList<ItemBean> cate1List = new ArrayList<ItemBean>();
        ArrayList<ItemBean> cate2List = new ArrayList<ItemBean>();
        
        Connection con = getConnection();
        ItemDAO idao = ItemDAO.getInstance();
        idao.setConnection(con);
        cate1List=idao.selectCate1();
        
        
        
        Connection con2 = getConnection();
        ItemDAO idao2 = ItemDAO.getInstance();
        idao2.setConnection(con2);
        cate2List=idao2.selectCate2();
        
        String cate1="";
        String cate2 ="";
        for(int i=0;i<cate1List.size();i++) {
        	cate1 += cate1List.get(i).getItem_category1()+"/";
        }
        for(int i=0;i<cate2List.size();i++) {
        	cate2 += cate2List.get(i).getItem_category2()+"/";
        }
        
        response.getWriter().write(cate1 +"and"+cate2);
        System.out.println(cate1 +"and"+cate2);
       
        
        //response.getWriter().write("가나");
        
        
        
    }
    
      
}
