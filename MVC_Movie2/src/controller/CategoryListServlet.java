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
        String cate1 = request.getParameter("item_category1");
        System.out.println("서블릿 왔나"+cate1);
        Connection con = getConnection();
        ItemDAO idao = ItemDAO.getInstance();
        idao.setConnection(con);
        
       
        ArrayList<ItemBean> cateList = new ArrayList<ItemBean>();
        public String getJSON(){
         StringBuffer json = new StringBuffer("");
         json.append("{\json\":[");
         cateList = idao.selectCate1();
         for(int i=0; i<cateList.size(); i++) {
        	 
        	 json.append("[{\"value\":\"" +cateList.get(i).getItem_category1()+"\"},");
         }
         json.append("]}");
        	 
        	 return json.toString();
         }
        
        
        
        
        
        
        
        // response.getWriter().write(mdao.idcheck(id)+"");
       
    }
}