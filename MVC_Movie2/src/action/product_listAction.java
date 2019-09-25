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
	        int limit = 10;
	        
	        if(request.getParameter("page") != null) {
	            page = Integer.parseInt(request.getParameter("page"));
	        }
	        
	        ProductListService productListService = new ProductListService();
	        int listCount = productListService.getListCount(); 
	        
	        articleList = productListService.getArticleList(page, limit);
	        
	        int maxPage = (int)((double)listCount / limit + 0.95);
	        
	        int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
	        
	        int endPage = startPage + 10 - 1;
	        
	        if(endPage > maxPage) {
	            endPage = maxPage;
	        }
	        
	        PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
	        
	        request.setAttribute("pageInfo", pageInfo);
	        request.setAttribute("articleList", articleList);
	        
	        ActionForward forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("/admin/productboard_list.jsp");
	        
	        return forward;
	}

}
