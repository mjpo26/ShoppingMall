package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProductListService;
import vo.ActionForward;
import vo.ItemBean;
import vo.PageInfo;

public class product_listAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  ArrayList<ItemBean> articleList = new ArrayList<ItemBean>();
	        
	        int page = 1; 
	        int limit = 12;
	        String category=(String)request.getParameter("Item_category1");
	        String category2=(String)request.getParameter("Item_category2");
//	        System.out.println("카테고리ㅣㅣㅣㅣ 번호 "+num);
	        System.out.println("카테고고고이리리 : "+category);
	        if(category==null) {
	        	category="전체";
	        }
	        if(category2==null) {
	        	category2="전체";
	        }
	        
	        System.out.println("카테고고고이리리 : "+category);
	        	
	        if(request.getParameter("page") != null) {
	            page = Integer.parseInt(request.getParameter("page"));
	        }
	        
	        ProductListService productListService = new ProductListService();
	        int listCount = productListService.getListCount(category,category2); 
	        
	        articleList = productListService.getArticleList(page, limit,category,category2);
	        
	        int maxPage = (int)((double)listCount / limit + 0.95);
	        
	        int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
	        
	        int endPage = startPage + 10 - 1;
	        
	        if(endPage > maxPage) {
	            endPage = maxPage;
	        }
	        
	        PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
	        System.out.println("갯수ㅜㅜ+"+listCount);
	        request.setAttribute("pageInfo", pageInfo);
	        request.setAttribute("articleList", articleList);
	        request.setAttribute("category",category);
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("/admin/productboard_list.jsp");
	        
	        return forward;
	}

}
