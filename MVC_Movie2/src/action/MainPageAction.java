package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MainPageService;
import svc.ProductDetailService;
import vo.ActionForward;

public class MainPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   System.out.println("MainPageAction");
		
	        MainPageService mainPageService = new MainPageService();

	        mainPageService.getItem("best");

		
		
		
		return null;
	}

}
